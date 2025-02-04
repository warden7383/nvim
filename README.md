> [!CAUTION]
> ```telescope-file-browser``` returns stacktrace error for folders with '[]' as 
of current version of the lock-file (and possibly my own nightly config)
> will not run with folders containing [] anywhere
# Warden7383's personal nvim config
This is my personal nvim config that is personalized for my needs.<br>
## Requirements:
- [neovim nightly](https://github.com/neovim/neovim/releases/)
- [rg(rip grep)](https://github.com/BurntSushi/ripgrep)
- [fd(finder)](https://github.com/sharkdp/fd)
- 
- a nerd font (I'm using jetbrains mono nerd font)
- terminal of your choice<br>

Usage:
`git clone https://github.com/warden7383/.config/`
> [!TIP]
> Run a ```:checkhealth``` to see what else you need
Formatters:
`MasonInstall stylua clang_format`
- clang_format may not be needed if you have the .exe from LLVM
> [!NOTE]
> As of writing this readme, formatters must be escaped with quotations if the cmd path has spaces
##### Eye Candy
\[Insert eye candy here\]<br>
### Todo:
- highlights
- learn vim-fugitive, inc-rename, telescope-file-browser, 


> [!NOTE]
> If [leetcode.nvim](https://github.com/kawre/leetcode.nvim) is returning an error related to curl, check curl version as you may need to update curl to a newer version
