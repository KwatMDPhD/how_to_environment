## DataFrames.jl

DataFrame function copies its data source by default

df\[,] to access

: means all

df\[:, :col] returns a copy

Functions that make a DataFrame copy by default

Symbol function

Use Symbol (:A) instead of String ("A") to access a the column A

Get a view instead of a copy: df\[!, :col] (! is the eachcol function); df.col (. is the getproperty function); df\[1, \[:A, :B]] (single row is selected using integer); view function

df.A == df\[!, 1] returns false; values are different

df.A === df\[!, 1] returns true; objects are the same

Make DataFrame all at once, by column, but not by row.

size function

Print more with show function

first function

last function

Can use regular expression to select columns: df\[!, r"A"]

Not function selects all columns excluding a specified ones

Cols function makes column selector: df\[:, Cols(r"A", :)] returns a new DataFrame whose columns matcing the expression are moved early

df\[in.(df.A, \["elk", "deer"]), :] to select rows where A values are in the specified set

df\[in(\["elk", "deer"]).(df.A), :] is equivalent; in function with one argument creates a function that checks if each value of its argument belonds to the specified set

select function creates a new DataFrame but select! function ; select, rename, and transform columns

AsTable function makes the selected columns NamedTuple

ByRow function makes the function to apply by row

select(df, AsTable(:) => ByRow(extrema) => \[:lo, :hi])

transform function is the select function that keeps all columns

describe function describes column and returns column-x-statistic

combine function calls function on column and returns 1-x-return

replace function; use allowmissing!(df) to introduce missing

Broadcast with ifelse function

## Plotly.jl (which is PlotlyJS.jl plus interactivity and server)

A Plotly plot has a layout and data, which is one or more traces

A layout has fields

A trace has a kind and fields

fields is a Dict

scatter(;x=1:2, y=1:2, marker_size=16,); function name becomes the trace kind and keyword arguments become the fields (nested fields can be named using parent_child=value)

This conversion of keyword arguments into a Dict can be done by attr(x=1:2, y=1:2, marker_size=16,)

trace\["parent_child"] = value to set a field

trace\["parent.child"] = value to get a field

Layout(;title_font_size=32,) to make a layout

savefig(plot, file_path; width=, height=, scale=) to save a figure

A style has a layout, global fields, and trace specific fields

Style(a_style, layout=, global_trace=, trace=) to extend from a_style

plot(, style=my_style) fills the fields not specified using those from my_style

PlotlyJS.STYLES are the default style symbols

style(style::Symbol) to see the style fields

use_style!(style::Symbol) to set a style globally
