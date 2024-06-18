function kconf --wraps='nvim .config/kitty/kitty.conf' --wraps='nvim ~/config/kitty/kitty.conf' --wraps='nvim ~/.config/kitty/kitty.conf' --description 'alias kconf=nvim ~/.config/kitty/kitty.conf'
  nvim ~/.config/kitty/kitty.conf $argv; 
end
