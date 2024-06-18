if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx NVM_DIR $HOME/.nvm
set -gx EDITOR nvim

zoxide init --cmd cd fish | source

fastfetch
set fish_greeting


