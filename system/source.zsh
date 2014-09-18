# Load `nvm`
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh

# Load `pyenv`
[[ -s $HOME/.pyenv ]] && export PYENV_ROOT=$HOME/.pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Add RVM to PATH for scripting
[[ -s $HOME/.rvm ]] && export PATH=$PATH:$HOME/.rvm/bin
# Load RVM into a shell session *as a function*
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm 
