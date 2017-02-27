#! bin/zsh

source "$HOME/.zshrc"

function error() {
    printf "%b\n"
    printf "%b\n" "$fg_bold[red]Error: $* $reset_color"
    printf "%b\n"
    exit 1
}

function message() {
    printf "%b\n"
    printf "%b\n" "$fg_bold[green]Message: $* $reset_color"
    printf "%b\n"
}

REMOTE="https://github.com/raindeer44/vero"
THEME_PRE="$ZSH_CUSTOM/themes/vero"
THEME="$THEME_PRE/vero.zsh-theme"

# Create custom themes folder if it doesn't yet exist
[ -d $ZSH_CUSTOM/themes ] || mkdir $ZSH_CUSTOM/themes

cd $ZSH_CUSTOM/themes

if $(command -v git >/dev/null 2>&1); then
    git clone https://github.com/raindeer44/vero
else
    error "Git is unavailable! Please (re)install Git before installing Vero"
fi

sed -i "s/ZSH_THEME='*' /ZSH_THEME='vero/vero'/g" "$HOME/.zshrc" || \
error "Unable to change theme in ~/.zshrc. Please manually set ZSH_THEME='vero/vero'"

source "$HOME/.zshrc" || error "Unable to reload zsh. Please restart your terminal or source ~/.zshrc"

message "Done! Welcome to Vero! Press enter to see your new prompt.\n If it doesn't load right away, please restart your terminal"
