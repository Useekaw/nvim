# AGENTS.md

Personal Neovim configuration (fork of [Allaman/nvim](https://github.com/Allaman/nvim)), managed with
[lazy.nvim](https://github.com/folke/lazy.nvim).

## Structure

- `init.lua` — entry point; sets `<leader>`/`<localleader>`, python host, disables perl/ruby
  providers, then `require("vnext.config")`.
- `lua/vnext/config/` — core config, loaded in this order (see `config/init.lua`):
  `options.lua`, `lazy.lua` (bootstraps lazy.nvim and loads plugin specs), `autocmds.lua`,
  `mappings.lua`, `diagnostics.lua`, `usercmds.lua`.
- `lua/vnext/plugins/` — one file per feature/domain (not per plugin); each file `return`s a
  lazy.nvim plugin spec table. Add new plugins to the matching domain file (e.g. LSP servers →
  `lsp.lua`, Mason tool lists → `mason.lua`) instead of creating a new file per plugin.
- `lua/vnext/extra/` — optional/local overrides, imported via `{ import = "vnext.extra" }` in
  `lazy.lua`. Files here (e.g. `example.lua`, `c.lua`) are mostly commented-out templates that
  `return {}`; only uncomment/extend them for machine-specific or experimental setups.
- `snippets/` — custom LuaSnip snippets.
- `README.md` — the single source of truth for keybindings; every keymap group mirrors a
  which-key group from `lua/vnext/plugins/which-key.lua`.
- `Dockerfile` — builds a container image (based on `allaman/nvim-full`) intended for CI to
  build/push a docker image; not required for local development.

## Conventions

- **Formatting (Lua):** [stylua](https://github.com/JohnnyMorganz/StyLua), config in
  `.stylua.toml` (2-space indent, Unix line endings, prefer double quotes). Run `stylua .` before
  committing Lua changes.
- **Linting (Lua):** [selene](https://github.com/Kampfkarren/selene), config in `selene.toml`
  (std `lua54+vim`, `mixed_table` allowed). Run `selene lua/`.
- **Markdown:** [markdownlint](https://github.com/DavidAnson/markdownlint), config in
  `.markdownlint.yaml` (long lines and inline HTML allowed).
- Keep plugin specs grouped by feature/domain, matching the existing files in
  `lua/vnext/plugins/`.
- When adding/changing a keymap: register it in the appropriate which-key group in
  `lua/vnext/plugins/which-key.lua` and document it in the corresponding table in `README.md`.
- **Tool installation:** never install LSP servers/linters/formatters ad-hoc. Prefer
  [Mason](https://github.com/mason-org/mason.nvim) — add the tool to the relevant
  `ensure_installed` list in `lua/vnext/plugins/mason.lua`. If a tool is not available via Mason,
  it is installed through Homebrew, but the Brewfile and that tool's configuration are managed
  outside this repo (via chezmoi) — do not add Homebrew/Brewfile logic here.

## Build / Test

- There is no automated test suite in this repo.
- Sanity-check config changes locally with, e.g., `nvim --headless "+checkhealth" +qa`, or open
  Neovim interactively and confirm there are no startup errors and `:checkhealth` is clean for the
  affected plugins.
- `.github/workflows/ci.yml` describes what CI *would* run (on push to `main` when `Dockerfile`,
  `**.lua`, or the workflow itself change: `hadolint` on the `Dockerfile`, `markdownlint-cli2` on
  `README.md`, and a docker build/push job). **These GitHub Actions workflows are currently not
  active/enabled in this fork** — don't rely on them running; treat their steps as guidance for
  manual local checks instead.

## Notes

- This is a personal fork; when pulling upstream changes from Allaman/nvim, merge carefully since
  personal customizations exist throughout (e.g. `lua/vnext/extra/`, `mason.lua`
  `ensure_installed` lists, README badges/keybindings).
