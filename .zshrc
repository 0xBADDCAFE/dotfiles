# autocorrect
autoload -U compinit;
# コマンドにsudoを付けてもきちんと補完出来るようにする。Ubuntuだと/etc/zsh/zshrcで設定されている。
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
			     # /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# 大文字・小文字を区別しないで補完出来るようにするが、大文字を入力した場合は区別する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# zsh-completionsを利用する Github => zsh-completions  
[ -d $HOME/.zsh-completions/src ] && fpath=( $fpath ~/.zsh-completions/src )
compinit

# リストを詰めて表示
setopt list_packed

# set encode
export LANG=ja_JP.UTF-8

# prompt settings
autoload colors
colors
PROMPT="[%n@%m %{${fg[green]}%}%~%{${reset_color}%}] 
$ "
PROMPT2='[%n]> ' 

# history settings
# history file
HISTFILE="$HOME/.zsh_history"

# history size on memory
HISTSIZE=10000
# numbers of saved history
SAVEHIST=10000

# share many shell's command history
setopt share_history

# ignore dupligation command hist
setopt hist_ignore_dups

# do not add history when having space in head
setopt hist_ignore_space

# history-search and set cursor end
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end 

# cd settings
# autocd(when execute only directory)
setopt auto_cd

# auto pushd and get list cd-[tab]
setopt auto_pushd

# correcting miss type
setopt correct

# do not add when duplicate
setopt pushd_ignore_dups

#$B%?!<%_%J%k$N%?%$%H%k(B
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}\007"
    }
    ;;
esac 

# ls colors
# http://news.mynavi.jp/column/zsh/009/index.html
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

#alias
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias vi='vim'
alias macvim='/usr/local/Cellar/macvim-kaoriya/HEAD/MacVim.app/Contents/MacOS/Vim -g --remote-tab-silent'

setopt nobeep

# 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

