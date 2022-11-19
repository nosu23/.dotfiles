
# Search history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Fuzzy finder command
bindkey '^L' cd-fzf-ghqlist
bindkey '^O' checkout-fzf-gitbranch
bindkey '^R' buffer-fzf-history
bindkey '^\' ssh-fzf-sshconfig
bindkey '^r' select-history
bindkey "^t" tree_select_buffer