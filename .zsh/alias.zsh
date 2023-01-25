# Move to the selected directory from the results of find
cd-fzf-fd() {
    local DIR_OR_FILE
    # DIR_OR_FILlsE=$(gls -aF --group-directories-first --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
    DIR_OR_FILE=$(fd -t d -H --max-depth 1 --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
    if [ -d "$DIR_OR_FILE" ]; then
        cd $DIR_OR_FILE
        ls
    fi

}
alias fdc=cd-fzf-fd

ls-fzf() {
    local DIR_OR_FILE
    # DIR_OR_FILlsE=$(gls -aF --group-directories-first --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
    DIR_OR_FILE=$(fd -t f -t l -H --max-depth 1 --color=always | fzf +m --tac --ansi --preview 'ls -al --color=always {}')
    if [ -d "$DIR_OR_FILE" ]; then
        cd $DIR_OR_FILE
    elif [ -f "$DIR_OR_FILE" ]; then
        view $DIR_OR_FILE
    else
        ls -laF $DIR_OR_FILE
    fi
}
alias fl=ls-fzf

#lslf-fzf() {
#    local DIR_OR_FILE
#    # DIR_OR_FILlsE=$(gls -aF --group-directories-first --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
#    DIR_OR_FILE=$(ls -laF --color=always > /dev/null | fzf +m --tac --ansi)
#    echo $DIR_OR_FILE
#}
alias ll='ls -laF --color=always'


# Open the selected file from the result of find in Vim
vim-fzf-find() {
    local FILE=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | fzf +m --ansi --preview 'cat {}')
    if [ -n "$FILE" ]; then
        ${EDITOR:-vim} $FILE
    fi
}
alias fv=vim-fzf-find

local-git-checkout() {
  git branch --color | fzf --ansi | xargs git checkout
}
alias lg=local-git-checkout

remote-git-checkout() {
  git branch -a --color | fzf --ansi | xargs git checkout
}
alias rg=remote-git-checkout