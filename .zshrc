# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gs='git status '
alias ga='git add '
alias gb='git branch'
alias gbb='git branch | cat'
alias gc='git commit'
alias gca='git commit -a'
alias gd='git diff'
alias gdc='git diff --cached'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gpom='git push origin master'

alias vi='vi -p'
alias nvim='nvim -p'

alias ppwd='pwd|pbcopy'

alias snip='cd ~/Documents/code/snip'

alias b='~/.banjo/bin/banjo become nyx'

alias mhnote='cd ~/Documents/ben_franklin_labs/clients/mednote/mednote'
alias mis='cd ~/Documents/code_with_jason/mississippi_dot_com'
alias mot='cd ~/exosuit/mothership'
alias rtfb='cd ~/Documents/code_with_jason/rails_testing_for_beginners'
alias xx='cd ~/exosuit/exosuit'
alias dw='cd ~/Documents/code_with_jason/production_rails/discuss_with'
alias cluck='cd ~/Documents/code_with_jason/cluckr'
alias cwj='cd ~/Documents/code_with_jason'
alias cgrt='cd ~/Documents/code_with_jason/cgrt'
alias dfb='cd ~/Documents/code/docker_for_beginners'
alias cwjwp='cd ~/Documents/code/sfcoding'
alias scratch='cd ~/Documents/code/scratch'
alias videos='cd ~/Documents/code_with_jason/videos'

export PATH="$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS"
export PATH="$PATH:/usr/local/texlive/2018/bin/x86_64-darwin"
export PATH="$PATH:~/bin"
export PATH="~/Documents/ben_franklin_labs/clients/mednote/mednote:$PATH"

export EDITOR='vim'

alias drw='time docker compose run web'
alias drspec='docker compose run -e RAILS_ENV=test web rspec'
alias up='docker compose up'
alias down='docker compose down'

alias rspec='bundle exec rspec'

alias f='vim $(fzf)'

source ~/.config/openai

export VIM_RSPEC_COMMAND_HEADLESS='call Send_to_Tmux("rspec {spec}\n")'
export VIM_RSPEC_COMMAND_NON_HEADLESS='call Send_to_Tmux("SHOW_BROWSER=true rspec {spec}\n")'

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# for softcover
export PATH=/Library/TeX/texbin:/Applications/calibre.app/Contents/MacOS:$PATH

export PATH=~/Library/Python/3.9/bin:$PATH

export PATH=/opt/homebrew/bin:$PATH
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export PATH=$PATH:~/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
