"# dotfiles-neovim-windows" 

`git clone %USERPROFILE%\AppData\Local\nvim`

Para que funcione packer.nvim:

`git clone https://github.com/wbthomason/packer.nvim.git C:\tools\neovim\Neovim\bin`

De manera que quede una estructura de tal forma:

```text
📂 C:\tools\neovim\Neovim\bin
├── 📁 bearer
├── 📁 iconengines
├── 📁 imageformats
├── 📂 lua
│  ├── 📂 packer
│  │  ├── 📂 plugin_types
│  │  │  ├── 🌑 git.lua
│  │  │  └── 🌑 local.lua
│  │  ├── 🌑 async.lua
│  │  ├── 🌑 clean.lua
│  │  ├── 🌑 compile.lua
│  │  ├── 🌑 display.lua
│  │  ├── 🌑 handlers.lua
│  │  ├── 🌑 install.lua
│  │  ├── 🌑 jobs.lua
│  │  ├── 🌑 load.lua
│  │  ├── 🌑 log.lua
│  │  ├── 🌑 luarocks.lua
│  │  ├── 🌑 plugin_types.lua
│  │  ├── 🌑 plugin_utils.lua
│  │  ├── 🌑 result.lua
│  │  ├── 🌑 update.lua
│  │  └── 🌑 util.lua
│  └── 🌑 packer.lua
├── 📁 platforms
├── 📁 styles
└── 📁 translations