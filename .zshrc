# enable colors for prompt
autoload -U colors && colors

# use pure prompt
autoload -U promptinit; promptinit
prompt pure
# enable auto completion 
autoload -Uz compinit && compinit
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

# autoload -U edit-command-line
# zle -N edit-comamand-line

# colors for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1
# edit current command in vim
# bindkey -M vicmd ' ' edit-command-line

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# use vim bindings
bindkey -v
export EDITOR="/usr/local/bin/nvim"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
export PATH="$PATH:$HOME/.npm-global/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/scripts"
# add ebook utilities to path
export PATH="$PATH:/Applications/calibre.app/Contents/MacOS"
# make clangd visible for coc
export PATH="$PATH:/usr/local/opt/llvm/bin/"

alias tmuxrc="nvim ~/.tmux.conf"
alias alarc="nvim ~/.config/alacritty/alacritty.yml"
alias mirror="wget -mkEpnp --directory-prefix=$HOME/mirrors "
alias p="ping 8.8.8.8"
alias sl="pmset sleepnow"
alias wifi="networksetup -setairportnetwork en0 "
alias ls="exa"
alias l="exa"
alias ll="exa -lh"
alias v="nvim"
alias vim="nvim"
alias lightsoff="wemo -h 10.0.0.36 -a OFF"
alias lightson="wemo -h 10.0.0.36 -a ON"
alias wifion="networksetup -setairportpower en0 on"
alias wifioff="networksetup -setairportpower en0 off"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias kararc="nvim ~/.config/karabiner/karabiner.json"
alias zshrc="nvim ~/.zshrc"
alias s="source $HOME/.zshrc"
alias octave="octave-cli"
alias closure="java -jar ~/scripts/closure-compiler-v20200719.jar"
alias cat="bat"
alias serve="live-server"

# start tmux automatically
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
# cd by typing directory name
setopt autocd
# list directory contents on cd
chpwd() {
    ls
}
base() {
    echo "obase=$3; ibase=$2; $1" | bc
}
# create a new directory and enter it
md() {
	mkdir -p "$@" && cd "$@"
}
# list all the directories
lsd() {
    ls -d */ | cut -f1 -d'/'
}
# cd on quit for nnn
n()
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

boom() {
    echo
    ls
    zle redisplay
}
bindkey -s '^h' '^ucd $HOME\n'
bindkey -s '^f' '^ufg\n'
bindkey -s '^o' '^ucd -\n'
bindkey -s '^y' '^ucd ..\n'
bindkey -s '^j' 'pushd ..^M'
bindkey -s '^k' 'popd^M'

# autojump configuration
export _Z_CMD="j"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/scripts/z/z.sh

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    
# add syntax highlighting (must go at the end) (brew installed)
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
