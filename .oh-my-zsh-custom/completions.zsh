# kubectl, copied from the kubectl plugin.
# not using that plugin though because i don't want the aliases.
if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE || ! -s $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE
fi

# helm
if (( $+commands[helm] )); then
    __HELM_COMPLETION_FILE="${ZSH_CACHE_DIR}/helm_completion"

    if [[ ! -f $__HELM_COMPLETION_FILE || ! -s $__HELM_COMPLETION_FILE ]]; then
        helm completion zsh >! $__HELM_COMPLETION_FILE
    fi

    [[ -f $__HELM_COMPLETION_FILE ]] && source $__HELM_COMPLETION_FILE

    unset __HELM_COMPLETION_FILE
fi

# k9s
if (( $+commands[k9s] )); then
    __K9S_COMPLETION_FILE="${ZSH_CACHE_DIR}/k9s_completion"

    if [[ ! -f $__K9S_COMPLETION_FILE || ! -s $__K9S_COMPLETION_FILE ]]; then
        k9s completion zsh >! $__K9S_COMPLETION_FILE
    fi

    [[ -f $__K9S_COMPLETION_FILE ]] && source $__K9S_COMPLETION_FILE

    unset __K9S_COMPLETION_FILE
fi
