<h1 align="center">"My" Nvim Configuration</h1>

**This is a fork**! All credit to [Allaman](https://github.com/Allaman/nvim) for creating this config. I merely adapted it to suite my tools and workflow better.

<div align="center">

[![Neovim](https://img.shields.io/badge/Neovim-repo-blue.svg?logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)
[![Last commit](https://img.shields.io/github/last-commit/Useekaw/nvim?logo=github)](https://github.com/Useekaw/nvim/pulse)
[![License](https://img.shields.io/github/license/Useekaw/nvim?logo=MIT&label=License)](https://github.com/Useekaw/nvim/blob/main/LICENSE)
[![Fork](https://img.shields.io/badge/Fork-source-red.svg?logo=git)](https://github.com/Allaman/nvim)

</div>

## Keybindings

`<leader>` is `<Space>`, `<localleader>` is `,`. Groups below mirror the
which-key groups defined in `lua/vnext/plugins/which-key.lua`. Run
`<leader>sk` any time to fuzzy-search all active keymaps.

### General

| Key | Mode | Action |
| --- | --- | --- |
| `j` / `k` | n | Move by display line (respects wrap) |
| `<` / `>` | v | Indent/dedent, keep selection |
| `Q` | n | `q` (repeat last `:` command) |
| `<esc>` | i, n | Clear search highlight |
| `<CR>` | n | Toggle fold under cursor (or default `<CR>` in quickfix) |
| `<leader>z` | n | Cycle fold levels |
| `<leader>q` | n | Close window |
| `<leader>uI` | n | Inspect Treesitter tree |
| `S` | n, x, o | Flash jump |
| `SS` | n, o, x | Flash Treesitter jump |
| `<c-s>` | c | Toggle Flash search |
| `<c-space>` | n, o, x | Treesitter incremental selection |
| `s` | n | Substitute operator |
| `ss` | x | Substitute selection |
| `ga` / `gA` | v | Align / Align with preview |
| `-` | n | Open Oil (float file explorer) |
| `<TAB>` / `<S-TAB>` | n | Next / previous buffer |
| `<C-h/j/k/l>` | n | Move between window splits (tmux-aware) |
| `<c-n>` | n | Toggle terminal |
| `<C-n>` | t | Close terminal |
| `<C-l>` | i | Jump over next closing bracket/quote |
| `*` / `#` | n | Jump to next / previous reference under cursor |

### Windows — `<leader>w`

| Key | Action |
| --- | --- |
| `ws` / `wv` | Horizontal / vertical split |
| `wT` | Move window to new tab |
| `wr` / `wR` | Rotate windows down/right / up/left |
| `wH` / `wJ` / `wK` / `wL` | Move window left/down/up/right |
| `w=` | Equalize window sizes |
| `wk` / `wj` | Increase / decrease height |
| `wh` / `wl` | Increase / decrease width |

### Files — `<leader>f`

| Key | Action |
| --- | --- |
| `ff` | Find files (cwd) |
| `fr` | Recent files (cwd) |
| `fg` | Git status files |
| `fp` | Toggle file explorer |
| `fn` | New file |
| `fs` | Save file |
| `fo` | Open path under cursor (`gf`) |
| `fR` | Rename current file |
| `lf` | Open Yazi file manager |

### Search — `<leader>s`

| Key | Action |
| --- | --- |
| `ss` | Grep strings |
| `sw` | Grep word/selection under cursor |
| `sh` | Help tags |
| `sl` | Buffer lines |
| `si` | Icons |
| `sL` | Lazy plugin spec |
| `sz` | Zoxide directories |
| `sD` | Diagnostics (workspace) |
| `sd` | Diagnostics (buffer) |
| `sk` | Keymaps |
| `sR` | Resume last picker |
| `sb` | Git branches |
| `su` | Undo tree |
| `sT` | Todo comments |

### Buffers — `<leader>b`

| Key | Action |
| --- | --- |
| `bb` | List buffers |
| `bd` | Delete current buffer |
| `bD` | Close all but current buffer |

### Git — `<leader>g`

| Key | Action |
| --- | --- |
| `gg` | Fugitive status |
| `gh` | Fugitive maps help |
| `gH` | Commit history (`GV`) |
| `gF` | File history (`GV!`) |
| `gL` | File history in loclist (`GV?`) |
| `gD` | Open CodeDiff |
| `gB` | Git blame line |
| `go` / `gc` | Open / copy git link (n, v) |
| `gs` / `gS` | Stage hunk / stage buffer |
| `gu` | Undo stage hunk |
| `gr` / `gR` | Reset hunk / reset buffer |
| `gp` | Preview hunk |
| `gd` | Show deleted (inline) |
| `gb` | Toggle current-line blame |
| `gj` / `gk` | Next / previous git hunk (no leader) |

### LSP — `<leader>l`

| Key | Action |
| --- | --- |
| `lk` | Hover |
| `lR` | Rename |
| `la` | Code action (n, x) |
| `lD` | Go to declaration |
| `ld` | Go to definition (picker) |
| `lr` | References (picker) |
| `lI` | Implementations (picker) |
| `lt` | Type definition (picker) |
| `ls` | Document symbols (picker) |
| `lS` | Workspace symbols (picker) |

### Diagnostics — `<leader>d`

| Key | Action |
| --- | --- |
| `dj` / `dk` | Next / previous diagnostic |
| `dc` | Show diagnostic in float |
| `dd` | Send diagnostics to quickfix |

### Toggles — `<leader>t` / `<leader>u`

| Key | Action |
| --- | --- |
| `ts` | Spelling |
| `tF` | Format on save |
| `to` | Outline panel |
| `uw` | Wrap |
| `un` | Relative number |
| `uC` | Cursorline |
| `ud` | Diagnostics |
| `ul` | Line numbers |
| `uc` | Conceal level |
| `uh` | Inlay hints |
| `uD` | Dim inactive code |
| `ux` | Colorizer |
| `uq` | Quickfix window |
| `uZ` / `uz` | Zen mode / zoom |

### HTTP client (`.http`/`.rest` files) — `<leader>H`

| Key | Action |
| --- | --- |
| `Hs` | Send request |
| `Ha` | Send all requests |
| `Hb` | Open scratchpad |

### AI / Sidekick CLI — `<leader>a`

| Key | Mode | Action |
| --- | --- | --- |
| `<c-.>` | n, t, i, x | Toggle Sidekick |
| `aa` | n | Toggle CLI |
| `as` | n | Select CLI tool |
| `ad` | n | Detach CLI session |
| `at` | n, x | Send "this" |
| `af` | n | Send file |
| `av` | x | Send visual selection |
| `ap` | n, x | Select prompt |
| `ac` | n | Toggle Claude directly |

### Misc

| Key | Action |
| --- | --- |
| `<leader>nn` | Open Noice message history |
| `<leader>nd` | Dismiss notification |
| `<leader>rr` | Open search & replace (grug-far) |
| `<leader>rR` | Search & replace, limited to current file |
| `<leader>rw` | Search & replace word under cursor |
| `<leader>rs` (v) | Search & replace selection |
| `<leader>k...` | Kustomize commands (`yaml` filetype only) |

### Context-specific

| Key | Context | Action |
| --- | --- | --- |
| `<leader>x` (n/v) | `lua` files | Source current line / range |
| `<leader>j` / `<leader>k` | diff mode | Next / previous change |
| `<leader>co` / `<leader>cp` | diff mode | Obtain / put change |
| `q` | help, qf, query, man, grug-far | Close window |
| `<C-h>` | insert mode (LuaSnip) | Cycle snippet choice |

### Completion (insert mode, blink.cmp)

| Key | Action |
| --- | --- |
| `<C-space>` | Show completion / documentation |
| `<C-e>` | Hide completion |
| `<CR>` | Accept |
| `<Tab>` / `<S-Tab>` | Next/previous item, or jump snippet |
| `<C-j>` / `<C-k>` | Next / previous item |
| `<C-f>` / `<C-b>` | Scroll documentation down / up |
