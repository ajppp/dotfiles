# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Conda default env
export AUTOSWITCH_DEFAULT_CONDAENV="base"

ZSH_DISABLE_COMPFIX="false"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

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

# Example exports
export icloud="/Users/jeth/Library/Mobile Documents/com~apple~CloudDocs"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vim="nvim"
alias vi="nvim"
alias cp="cp -r"
alias scp="scp -r"
alias l="exa --color=auto"
alias la="exa -a"
alias ll="exa -lah"
alias ls="exa --color=auto"
alias grep="grep -n --color"
alias cat="bat"
alias conda install="mamba install"
alias pip='noglob pip'
alias t='todo.sh'

# load starship
eval "$(starship init zsh)"

# load zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Plugins
zplug "b4b4r07/enhancd", use:init.sh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
#zplug "zsh-users/zsh-autosuggestions"
zplug "clvv/fasd"
zplug "junegunn/fzf"
zplug "chrissicool/zsh-256color"
zplug "olets/zsh-abbr"
zplug "Tarrasch/zsh-bd"
zplug "timothyrowan/betterbrew-zsh-plugin"
zplug "oldratlee/hacker-quotes"
zplug "zshzoo/cd-ls"
zplug "bartboy011/cd-reminder"
zplug "zdharma-continuum/fast-syntax-highlighting"
zplug "kjhaber/tm.zsh"
zplug "z-shell/zsh-diff-so-fancy", as:command, use:"bin/"
zplug "laggardkernel/zsh-iterm2"
#zplug "wting/autojump" downloaded using brew
zplug "robertzk/send.zsh"
zplug "davidtong/vsc.plugin.zsh"
zplug "zpm-zsh/clipboard"
zplug "zpm-zsh/colorize"
zplug "bckim92/zsh-autoswitch-conda"

# Plugins for completion
zplug "zsh-users/zsh-completions"
zplug "esc/conda-zsh-completion"
zplug "sudosubin/zsh-github-cli"
zplug "srijanshetty/zsh-pandoc-completion"
zplug "srijanshetty/zsh-pip-completion"
zplug "sunlei/zsh-ssh"
zplug "ctil/zargparse"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Then, source plugins and add commands to $PATH
zplug load

# autojump setup
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jeth/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jeth/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/jeth/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jeth/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/jeth/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/jeth/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
