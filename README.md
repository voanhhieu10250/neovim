# My Neovim Config

I highly recommend that if you're using Windows then install **WSL**. 

**DON'T** use this Neovim config if you don't have Linux !!

If you still want to use Neovim on PowerShell then use [LunarVim](https://github.com/LunarVim/LunarVim) instead !


## Try out this config

Make sure to remove or move your current `nvim` directory

**IMPORTANT** Requires [Neovim](https://github.com/neovim/neovim#:~:text=%2C%20and%20more!-,Install%20from%20source,-See%20the%20Building) v0.8 or above
```
git clone https://github.com/voanhhieu10250/neovim-configuration.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 


## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

- On WSL install [win32yank.exe](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl:~:text=If%20Neovim%20is%20only%20installed%20within%20our%20WSL%20distribution%2C%20we%20can%20just%20install%20win32yank.exe%20manually%3A) in order for neovim to work with system clipboard.
  ```
  curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
  unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
  chmod +x /tmp/win32yank.exe
  sudo mv /tmp/win32yank.exe /usr/local/bin/
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)

After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

**NOTE:** (If you are seeing boxes without icons, try changing this line from `false` to `true`: [link](https://github.com/ChristianChiarulli/nvim/blob/ac41efa237caf3a498077df19a3f31ca4b35caf3/lua/user/icons.lua#L5))

## Java Debugging and Testing

```sh
git clone git@github.com:microsoft/java-debug.git
cd java-debug/
./mvnw clean install
```

```sh
git clone git@github.com:microsoft/vscode-java-test.git
cd vscode-java-test
npm install
npm run build-plugin
```

**NOTE:** You should use [Sdkman](https://sdkman.io/) to manage java versions. Please make sure that your java version is at least **version 17 or above**.

## References & Credit

[ChristianChiarulli/nvim](https://github.com/ChristianChiarulli/nvim)

[chris@machine](https://www.youtube.com/c/ChrisAtMachine)


---

> The computing scientist's main challenge is not to get confused by the complexities of his own making. 

\- Edsger W. Dijkstra

