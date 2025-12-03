# dotfiles

ln -sf "$(pwd)/.ideavimrc" ~/ && ln -sf "$(pwd)/.zshrc" ~/ && ln -sf "$(pwd)/init.lua" ~/

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Seinh/git-prune.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-prune

brew install neovim
