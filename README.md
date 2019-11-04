# Introduction

Terraform provides a way to speed up the process of conquering a new machine. Right now this is a work in development.
Just run .install.sh and follow the current setup instructions below.


# CentOS install

Mounted external hard drive - https://www.rootusers.com/how-to-mount-a-windows-ntfs-disk-in-linux/
`/dev/sdc1 <mount_folder>  ntfs rw,nosuid,nodev,default_permissions 0 0`

`sudo yum install <google-chrome.rpm>` to install chrome.

Changed keyboard rate with `xset r rate 300 60`

Installed zsh: `sudo yum install zsh`

Ran `terraform-linux/install.sh`

Installed exa https://www.tecmint.com/exa-a-replacement-for-ls-command-linux/
```
curl https://sh.rustup.rs -sSf | sh
wget -c https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
```
Had some libc6 issues. On hold. Removed exa alias from zshrc.

Installed emacs from source - https://www.gnu.org/software/emacs/manual/html_node/efaq/Installing-Emacs.html
Had to install giflib to run configure. Downloaded gilib-devel.x86_64 4.1.6.9 and ran `sudo yum install <giflib.rpm>`
After that, `./configure` worked great, had to `sudo make install`

Installed spacemacs with regular `git clone -b develop https://github.com/syl20bnr/spacemacs`

Emacs for whatever reason did not by default point to .eamcs.d/init.el. Added an alias to manually do that from the command line.

Installed fasd  with `sudo yum install fasd`

Installed ripgrep (rg)
```
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlgeorge-ripgrep-epel-7.repo
sudo yum install ripgrep
```
Installed Kicad `sudo yum install kicad.x86_64`

Installed recent version of vim - https://phoenixnap.com/kb/how-to-install-vim-centos-7

Installed fd with:
- `sudo yum install cargo rustc`
- `cargo install fd-find`

Added zsh to `~/.bashrc` so that zsh opens by default

Typed `sudo visudo` and added `<user> ALL=(ALL) ALL` to give root access to <user>.
  
Installed zsh-syntax-highlighting:
```
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/CentOS_7/shells:zsh-users:zsh-syntax-highlighting.repo
yum install zsh-syntax-highlighting
```
Fixed incorrect timezone issue with `timedatectl set-ntp yes` and restarting the computer.
