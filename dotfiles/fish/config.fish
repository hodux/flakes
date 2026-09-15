set -gx EDITOR nvim
fish_add_path -a $HOME/.krew/bin
fish_add_path -a $HOME/.lmstudio/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    direnv hook fish | source

    # aliases
    alias vim nvim
    # abbrs
    abbr k kubectl
    # pretty ls
    alias ls='eza --icons --group-directories-first'

end
