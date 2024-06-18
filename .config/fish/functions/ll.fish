function ll --wraps=ls --wraps='ls -l --no-time --no-user --no-permissions --git-repos' --description 'alias ll=ls -l --no-time --no-user --no-permissions --git-repos'
  ls -l --no-time --no-user --no-permissions --git-repos $argv; 
end
