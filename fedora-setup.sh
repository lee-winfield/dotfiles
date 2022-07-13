# Symlink Dotfiles
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# Enable RPM Fusion Repositories
sudo dnf install \
 https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install \
 https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Install Plugins for Playing Movies and Music
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y

sudo dnf install lame\* --exclude=lame-devel -y

sudo dnf group upgrade --with-optional Multimedia -y

# Install Vim
dnf search vim -y
dnf search vim | egrep -i 'enhanced|enhancements' -y

sudo dnf install vim-enhanced -y

# Install ZSH 
sudo dnf install zsh -y
sudo dnf install wget curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
