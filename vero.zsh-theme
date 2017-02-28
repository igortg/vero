# Vero
# Based on Bureau and Geometry
# Bureau: https://github.com/robbyrussel/oh-my-zsh/blob/master/themes/bureau.zsh-theme
# Geometry: https://github/com/frmendes/geometry

# nvm ( ⬡ 4.2.6 )
ZSH_THEME_NVM_PROMPT_PREFIX="( %B⬡%b "
ZSH_THEME_NVM_PROMPT_SUFFIX=" )"

_PATH="%{$fg_bold[white]%}%~%{$reset_color%} "

vero_set_command_title () {

}

vero_reset_title () {
    
}

vero_set_username_colors () {
    if [[ $EUID -eq 0 ]]; then
      _USERNAME="%{$fg_bold[red]%}%n"
      _LIBERTY="%{$fg[red]%}#"
    else
      _USERNAME="%{$fg_bold[white]%}%n"
      _LIBERTY="%{$fg[green]%}$"
    fi
    export _USERNAME="$_USERNAME%{$reset_color%}@%m"
    export _LIBERTY="$_LIBERTY%{$reset_color%}"
}

vero_plugin_setup () {

}

vero_prompt_render () {

}

vero_prompt_setup () {
    setopt PROMPT_SUBST
    autoload -U add-zsh-hook

    vero_set_username_colors

    if $PROMPT_VERO_ENABLE_PLUGINS; then
        vero_plugin_setup
    fi

    add-zsh-hook precmd vero_prompt_render

    if $PROMPT_VERO_ASYNC; then
        vero_async_setup
    fi
}

vero_prompt_setup
