#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


# PS1='[\u@\h \W]\$ '
# PS1="[\w] -> "
# export PS1="\[\e[1;34m\]\n\w\n\[\e[32m\]→ \[\e[0m\]" 
# export PS1="\[\e[37m\]\n╭╴╴╴ \[\e[33m\]\W\n\[\e[37m\]╰╴> \[\e[36m\]" 
export PS1="  \[\e[1m\]\u \[\e[38;5;12;1m\]\w\[\e[m\] \[\033[32m\]\$(parse_git_branch)\[\033[00m\]
     \[\e[38;5;9;1m\]└───────➤ \[\e[m\]"


# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


HISTSIZE=-1
HISTFILESIZE=-1

# random
alias ls='ls -shN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias df='df -h'                                 # human-readable sizes
alias dfd='df -h -t ext4'
alias free='free -m'                             # show sizes in MB
alias windows='sudo efibootmgr -n 000A'
# alias fuck='sudo $(fc -ln -1)'
alias fuck='sudo $(history -p !!)'
alias psg='ps aux | grep'
alias mhz='watch -n 1 "cat /proc/cpuinfo | grep MHz"'
alias ram='ps axch -o cmd:15,%mem --sort=-%mem | head'
alias cpu='ps axch -o cmd:15,%cpu --sort=-%cpu | head'
alias '..'='cd ..'
alias 'update-grub'='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias gruvboxtheme='feh --bg-fill .cache/blurwal/frame-1.jpg && wal --theme base16-gruvbox-hard'

# pacman and yay
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias yaysua="yay -Sua"              # update only AUR pkgs
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias unlock="sudo rm /var/lib/pacman/db.lck"    # remove pacman lock
alias orphans="pacman -Qtdq"                     # orphaned packages
alias cachesize="du -sh /var/cache/pacman/pkg/"
alias cacheremove="sudo pacman -Sc"
alias aurcache="yay -Sc"

# confirm before overwriting something
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -i'
alias mkd="mkdir -pv"

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'


#########################
# pywal
########################
# # Import colorscheme from 'wal' asynchronously
# # &   # Run the process in the background.
# # ( ) # Hide shell job control messages.
# (cat ~/.cache/wal/sequences &)

# # Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# # To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh


# [ $DISPLAY ] && neofetch
pfetch


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION


alias config='/usr/bin/git --git-dir=/home/ado/.cfg/ --work-tree=/home/ado'
