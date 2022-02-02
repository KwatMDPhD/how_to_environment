Make the most minimal app (template skeleton and say no to everything else)

## Make one

```bash
npm init svelte@next
```

Install dependencies

```bash
npm install
```

Run the app

```bash
npm run dev -- --open
```

## Take a look

Build the app

```bash
ls -l .svelt-kit
```

```bash
npm run build
```

```bash
ls -l .svelt-kit
```

Preview the built app

```bash
npm run preview -- --open
```

## Publish to GitHub

Read https://kit.svelte.dev/docs#adapters-supported-environments-static-sites and follow:

Install `adapter-static` (for only during development)

```bash
npm install --save-dev @sveltejs/adapter-static@next 
```

Edit `svelte.config.js`

```diff
-import adapter from '@sveltejs/adapter-auto';
+import adapter from '@sveltejs/adapter-static';
```

Carry `.nojekyll` so tha GitHub nojekyll does not mess with this app

```bash
touch static/.nojekyll
```

Build

```bash
npm run build
```

```bash
ls -l build
```

```bash
npx gh-pages --dist build --dotfiles --branch main --dest docs
```

## 10

Do all https://svelte.dev/tutorial/basics.

Do all https://kit.svelte.dev/docs.
