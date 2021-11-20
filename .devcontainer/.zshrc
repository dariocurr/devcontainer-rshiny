# load antigen
source /home/vscode/.antigen/antigen.zsh

# load the oh-my-zsh's library
antigen use oh-my-zsh

# bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle dircycle
antigen bundle git
antigen bundle jsontools
antigen bundle pip

# syntax highlighting bundle
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# load the theme
antigen theme robbyrussell

# tell Antigen that you're done
antigen apply