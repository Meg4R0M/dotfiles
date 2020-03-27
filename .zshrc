# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/meg4r0m/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="rkj-repos"
ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias pythonenvansible="source ~/.local/virtualenv/ansible/bin/activate"

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls' 					
alias l.="ls -A | egrep '^\.'"      

#fix obvious typo's
alias cd..='cd ..'
alias sl="ls"
alias pdw="pwd"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pmsyu="sudo pacman -Syu --color=auto"
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syu'

# pacaur or pc
alias pcsyu="pacaur -Syu"

#ps
alias ps="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# yaourt keeps tmp folder cleaner than packer
alias pks="yaourt -S --noconfirm "
alias pksyu="yaourt -Syu --noconfirm"
alias pksyua="yaourt -Syu  --aur --noconfirm"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias fc='sudo fc-cache -fv'

#get fastest mirrors in your neighborhood 
alias mirror="sudo reflector --protocol https --latest 50 --number 20 --sort rate --save /etc/pacman.d/mirrorlist"
alias mirrors=mirror

export PATH=~/.local/bin:$PATH

#agent_pids="$(ps -ef |grep "ssh-agen[t]" |awk '{print($2)}')"
#if [[ -z "$agent_pids" ]]; then
#    eval $(ssh-agent -s)
#    ssh-add
#else
#    for agent_pid in $agent_pids; do
#        agent_ppid="$(($agent_pid - 1))"
#        agent_sock="$(find /tmp -maxdepth 2 -path "*ssh-*" -type s -iname "agent.$agent_ppid" 2>/dev/null)"
#        export SSH_AGENT_PID="$agent_pid"
#        export SSH_AUTH_SOCK="$agent_sock"
#        if ssh-add -l >/dev/null 2>&1; then
#            break
#        fi
#    done
#fi
#if ! ssh-add -l ;then
#    killall ssh-agent
#    eval $(ssh-agent -s)
#    ssh-add
#fi

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

source $HOME/.antigen/antigen.zsh

# Chargement de oh-my-zsh comme librairie par défaut (robbyrussell/oh-my-zsh).
antigen use oh-my-zsh

# Récupération de "bundles" depuis la librairie par défaut
antigen bundle brew
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle pip
antigen bundle command-not-found
antigen bundle docker-compose
antigen bundle node
antigen bundle kubectl

# Récupération de "bundles" depuis github
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle bobsoppe/zsh-ssh-agent

# Appliquer le theme
antigen theme denysdovhan/spaceship-prompt

# Appliquer l'ensemble des changements
antigen apply

export ANDROID_HOME=/home/meg4r0m/Android/Sdk
export ANDROID_SDK_ROOT=/home/meg4r0m/Android/Sdk
export ANDROID_AVD_HOME=/home/meg4r0m/.android/avd

cat /etc/motd

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/home/meg4r0m'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET
