# Repository Guidelines

## Project Structure & Module Organization
- `app/components/primer` holds Ruby view components and associated TypeScript modules; pair changes with matching previews in `previews/` when available.
- `app/assets` and `static/` expose compiled JS/CSS shipped with the gem, while `script/` hosts automation helpers (build, lint, release).
- Domain logic and shared helpers live in `lib/primer`, and documentation sources reside in `docs/`.
- Tests are split across `test/components` (unit), `test/system` (Cuprite browser flows), `test/playwright` (visual regression), and supporting fixtures in `test/css` and `test/lib`.

## Build, Test, and Development Commands
- Run `script/setup` once per machine to install Ruby, Node, and Playwright prerequisites.
- Use `npm run build` (or `script/build-assets [js|css]`) to compile distributable assets before packaging.
- `bundle exec rake test` exercises the default Minitest suite; `script/test path/to/file` narrows the scope.
- Launch the demo/preview environment with `script/dev` after ensuring `script/setup` has completed.
- For visual checks, run `npx playwright test` or `script/run-playwright`; inspect reports via `npx playwright show-report .playwright/report`.

## Coding Style & Naming Conventions
- Ruby follows the `rubocop-github` defaults plus Primer cops; keep two-space indentation, favor frozen string literals, and place components under the `Primer::` namespace (e.g., `Primer::Alpha::ActionList`).
- TypeScript/JavaScript code in `app/components/primer/**/*.ts` is linted by ESLint and formatted by the shared GitHub Prettier config; use PascalCase for class exports and kebab-case for filenames.
- PostCSS modules (`.pcss`) in components should rely on Primer design tokens; run `npm run lint:stylelint` after stylistic changes.

## Testing Guidelines
- Name Ruby tests with the `_test.rb` suffix and mirror the component namespace inside `test/components`.
- Visual specs belong in `test/playwright/*.test.ts`; update baselines only after verifying diffs locally.
- System specs default to headless Cuprite—set `HEADLESS=false script/test test/system/...` to debug locally.
- Regenerate docs previews with `bundle exec rake docs:preview` before exercising demo flows to avoid stale HTML.

## Commit & Pull Request Guidelines
- Write imperative commit subjects (e.g., `feat(SubHeader): add dismiss control`) and keep scope prefixes consistent with existing history.
- Create a changeset (`npx changeset` or `npm run changeset:version` during release) whenever you modify shipped APIs, markup, or styles.
- PRs should link tracking issues, list affected components, and include screenshots or Playwright diff summaries for UI changes.
- Confirm `bundle exec rake test`, `npm run lint`, and relevant Playwright runs before requesting review; failing automation blocks merges.
