abbr -a vim 'nvim'
abbr -a ls 'ls -l'
abbr -a la 'ls -la'

abbr -a pip 'pip3'
abbr -a python 'python3'

abbr -a status 'git status'
abbr -a fetch 'git fetch'
abbr -a glog 'git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit --date=relative --branches'

abbr -a watchtree 'watch -c \'tree -C -L 3\''

abbr -a fvim 'nvim (fzf-tmux -r)'

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3
set __fish_git_prompt_showupstream 'verbose'

# fzf.fish options
# set --export FZF_DEFAULT_OPTS --height 50% --margin 1

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

# export PATH=$PATH:~/.gem/bin
# export PATH=$PATH:~/.cargo/bin

set -U GEM_HOME '~/.gem'
set -U GEM_PATH '~/.gem'
