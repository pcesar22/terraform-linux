source ~/.companyrc

# Source zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# PATH variable search path
export PATH="/Users/paulo/anaconda3/bin:$PATH"

export PATH="/Users/paulo/anaconda2/bin:$PATH"




export PATH="/Applications/MATLAB_R2016b.app/bin:$PATH"

export PATH=$HOME/wpilib/simulation:$PATH

export PATH=~/.local/bin:$PATH

export PATH=/Library/TeX/texbin:$PATH

export PATH="/usr/local/opt/gcc-arm-none-eabi-6-2017-q2-update/bin:$PATH"

export PATH="/usr/local/Cellar/emacs-mac/emacs-26.1-z-mac-7.4/bin:$PATH"

# GTAGS
# export GTAGSCONF=~/.globalrc

# export GTAGSLABEL=new-ctags

export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

 #Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="paulo"

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
plugins=(git z zsh-autosuggestions brew rsync npm nmap lua zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

function goto_directory(){
    cd ${$(which $1)%/*}
}
alias goto=goto_directory

function read_and_open(){
    getfile $1 .
    name=${$1##*/}
    echo $name
    open $name
}
alias ro=read_and_open

# alias ls="ls -GFh"
# export LSCOLORS="di=31:ln=31:so=31:pi=31:ex=31:bd=31;41:cd=31;41:su=31;41:sg=31;41:tw=31;41:ow=31;41:"
# zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
# Auto suggestions

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# nrfSDK

# NRF SDK installation
export NRF_SDK_ROOT="/usr/local/opt/nRF5_SDK_15.0.0_a53641a"
alias nrfhere="ln -s $NRF_SDK_ROOT/ $(pwd)"

#lualatex
alias lualatex=/Library/TeX/texbin/lualatex

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias gs="git status"
alias zshconfig="vim ~/.zshrc"
alias ls="exa"
alias l="exa -lB --color-scale --all -H"
alias l2="exa -lB --color-scale --all -H -T --level 2"
alias l3="exa -lB --color-scale --all -H -T --level 3"
alias ff="fd"
alias fg="rg"
alias v="vim \$(fzf)"
alias c="fzf | pbcopy"
alias go="cd \$(sd)"

# FZF configs
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Ranger stuff
alias t='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# Start fasd
fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache


# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

# open in ranger mode
t

