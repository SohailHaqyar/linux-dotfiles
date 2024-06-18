function awconfig --wraps='nvim ~/.config/awesome' --wraps='nvim ~/.config/awesome/rc.lua' --description 'alias awconfig=nvim ~/.config/awesome/rc.lua'
  nvim ~/.config/awesome/rc.lua $argv; 
end
