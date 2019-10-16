# My Personal Dotfiles

### Unix

- .vimrc should be symlinked to `~`
- .zshrc should be symlinked to `~`
- Vundle.vim should be symlinked to `~/.vim/bundle/`

### Windows

- .vimrc should be symlinked to `$HOME\_vimrc`
- Vundle.vim should be symlinked to either of the following:
	- `$HOME\vimfiles\plugins`
	- `$Home\vimfiles\bundle`
- You can also use .zshrc on windows if using [WSL](https://docs.microsoft.com/en-us/windows/wsl/faq) and should be symlinked to `~`

### Both

- customBuild.gradle should replace the default build file for most gradle builds, already has the defaults I usually use
