ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Julia installation
ARG julia_version="1.5.2"

# SHA256 checksum
ARG julia_checksum="6da704fadcefa39725503e4c7a9cfa1a570ba8a647c4bd8de69a118f43584630"

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    unzip \
    default-jdk \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Julia packages in /opt/julia
ENV JULIA_DEPOT_PATH=/opt/julia \
    JULIA_PKGDIR=/opt/julia \
    JULIA_VERSION="${julia_version}"

WORKDIR /tmp

# hadolint ignore=SC2046
RUN mkdir "/opt/julia-${JULIA_VERSION}" && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/$(echo "${JULIA_VERSION}" | cut -d. -f 1,2)"/julia-${JULIA_VERSION}-linux-x86_64.tar.gz" && \
    echo "${julia_checksum} *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf "julia-${JULIA_VERSION}-linux-x86_64.tar.gz" -C "/opt/julia-${JULIA_VERSION}" --strip-components=1 && \
    rm "/tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz"
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# Show Julia where conda libraries are \
RUN mkdir /etc/julia && \
    echo "push!(Libdl.DL_LOAD_PATH, \"$CONDA_DIR/lib\")" >> /etc/julia/juliarc.jl && \
    # Create JULIA_PKGDIR \
    mkdir "${JULIA_PKGDIR}" && \
    chown "${NB_USER}" "${JULIA_PKGDIR}" && \
    fix-permissions "${JULIA_PKGDIR}"

# Install snpEff into /opt/
RUN mkdir /opt/snpeff && \
    wget -q -P "/opt/snpeff/" https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip && \
    cd /opt/snpeff/ && \
    unzip "/opt/snpeff/snpEff_latest_core.zip" && \
    mkdir -p /opt/snpeff/snpEff/data/GRCh38.99/ && \
    chown -R "${NB_USER}" /opt/snpeff && \
    fix-permissions /opt/snpeff

# Install rtg into /opt/
RUN mkdir /opt/rtg && \
    wget -q -P "/opt/rtg/" https://github.com/RealTimeGenomics/rtg-tools/releases/download/3.11/rtg-tools-3.11-linux-x64.zip && \
    cd /opt/rtg/ && \
    unzip "/opt/rtg/rtg-tools-3.11-linux-x64.zip" && \
    chown -R "${NB_USER}" /opt/rtg && \
    fix-permissions /opt/rtg

# Install STAR into /opt/
RUN mkdir /opt/star && \
    wget -q -P "/opt/star/" https://github.com/alexdobin/STAR/blob/master/bin/Linux_x86_64_static/STAR && \
    chown -R "${NB_USER}" /opt/star && \
    fix-permissions /opt/star

USER $NB_UID

RUN conda config --set channel_priority false && \
    conda install --quiet --yes \
    'git' \
    'git-lfs' \
    'nodejs' \
    'jupyterlab' \
    'pylama' \
    'isort' \
    'autoflake' \
    'pylint' \
    'black' \
    'rope' \
    'twine' && \
    conda install --quiet --yes --channel bioconda \
    'seqtk' \
    'skewer' \
    'fastqc' \
    'multiqc' \
    'minimap2' \
    'htslib' \
    'samtools' \
    'bcftools' \
    'snpeff' \
    'kallisto' && \ 
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" 

RUN conda create --name py2 --yes python=2.7 && \
    conda install --name py2 --channel bioconda --yes \
    'manta' \
    'strelka'

# Install IJulia as jovyan and then move the kernelspec out
# to the system share location. Avoids problems with runtime UID change not
# taking effect properly on the .local folder in the jovyan home dir. \
RUN julia -e 'import Pkg; Pkg.update()' && \
    julia -e "using Pkg; pkg\"add IJulia\"; pkg\"add JuliaFormatter\"; pkg\"add CSV\"; pkg\"add DataFrames\"; pkg\"add Plots\"; pkg\"add BenchmarkTools\"; pkg\"add Revise\"; pkg\"precompile\"" && \
    # move kernelspec out of home \
    mv "${HOME}/.local/share/jupyter/kernels/julia"* "${CONDA_DIR}/share/jupyter/kernels/" && \
    chmod -R go+rx "${CONDA_DIR}/share/jupyter" && \
    rm -rf "${HOME}/.local" && \
    fix-permissions "${JULIA_PKGDIR}" "${CONDA_DIR}/share/jupyter"

RUN rm -rf /home/jovyan/work/

WORKDIR $HOME
