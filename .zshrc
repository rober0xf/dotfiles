export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/share/solana/install/active_release/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

ZSH_THEME="fwalch"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#c0c0c0'

source $ZSH/oh-my-zsh.sh

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
