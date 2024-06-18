function nr --wraps='npm run dev:' --wraps='npm run' --description 'alias nr=npm run'
  npm run $argv; 
end
