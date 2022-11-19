# Move to the selected directory from the results of find
cd-fzf-ls() {
    local DIR_OR_FILE
    # DIR_OR_FILlsE=$(gls -aF --group-directories-first --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
    DIR_OR_FILE=$(ls --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
    if [ -d "$DIR_OR_FILE" ]; then
        cd $DIR_OR_FILE
        ls
    fi
}
alias fcd=cd-fzf-ls

ls-fzf() {
    local DIR_OR_FILE
    # DIR_OR_FILlsE=$(gls -aF --group-directories-first --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
    DIR_OR_FILE=$(ls -a --color=always > /dev/null | fzf +m --tac --ansi --preview 'ls -al --color=always {}')
    if [ -d "$DIR_OR_FILE" ]; then
        cd $DIR_OR_FILE
    elif [ -f "$DIR_OR_FILE" ]; then
        vim $DIR_OR_FILE
    else
        ls -laF $DIR_OR_FILE
    fi
}
alias fl=ls-fzf

lslf-fzf() {
    local DIR_OR_FILE
    # DIR_OR_FILlsE=$(gls -aF --group-directories-first --color=always | fzf --tac --ansi --preview 'ls -al --color=always {}')
    DIR_OR_FILE=$(ls -laF --color=always > /dev/null | fzf +m --tac --ansi --preview 'ls -al --color=always {}')
    if [ -d "$DIR_OR_FILE" ]; then
        cd $DIR_OR_FILE
    elif [ -f "$DIR_OR_FILE" ]; then
        vim $DIR_OR_FILE
    else
        ls -laF $DIR_OR_FILE
    fi
}
alias fll=lslf-fzf


# Open the selected file from the result of find in Vim
vim-fzf-find() {
    local FILE=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | fzf +m --ansi --preview 'cat {}')
    if [ -n "$FILE" ]; then
        ${EDITOR:-vim} $FILE
    fi
}
alias fv=vim-fzf-find