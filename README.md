# my nvim config

##   Directory 
```shell
lua
    overseer
        components
        template
    Plugins
init.lua
lazy-lock.json
```
## Plugins
```commd 
:Lazy or into lazy-lock.json
```
## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/MMMMMMNM/nvim-config ~/.config/nvim -- linux
```
```shell
git clone --depth 1 https://github.com/MMMMMMNM/nvim-config $env:LOCALAPPDATA\nvim
# remove template's git connection to set up your own later
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```
#### 🚀 Start Neovim

```shell
nvim
```
