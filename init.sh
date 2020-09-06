#!/usr/bin/env zsh

[[ -z "$PYENV_HOME" ]] && export PYENV_HOME="$HOME/.pyenv"
[[ -z "$PYENV_VIRTUALENV_DISABLE_PROMPT" ]] && export PYENV_VIRTUALENV_DISABLE_PROMPT=1

_zsh_pyenv_install() {
    if [[ `uname` == "Darwin" ]]; then
        brew install pyenv
    fi
}

_zsh_pyenv_load() {
    export PATH="$PYENV_HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

[[ ! -f "$PYENV_HOME/libexec/pyenv" ]] && _zsh_pyenv_install

[[ -f "$PYENV_HOME/libexec/pyenv" ]] && _zsh_pyenv_load
