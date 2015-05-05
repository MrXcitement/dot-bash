#bashrc
##Description
My personal 'sh' and 'bash' shell configuration files.
##System
Configured to work on the following systems:
-OS X 10.9+
-Linux (Raspian, Ubuntu)
##Startup file sourcing order
/etc/profile
~/.bash_profile					sourced by 'bash'
~/.profile.d/*.bash files		sourced by ~/.bash_profile
~/.profile						sourced by ~/.bash_profile or 'sh' shell
~/.profile.d/*.sh files 		sourced by ~/.profile
~/.shrc							sourced by ~/.profile
~/.bashrc.d/*.sh files			sourced by ~/.shrc
~/.bashrc						sourced by ~/.shrc, only if 'bash' shell
~/.bashrc.d/*.bash files		sourced by ~/.bashrc
/etc/bashrc						sourced by ~/.bashrc
##Usage
When you want to add some configuration information

Put files that define environment variables and startup programs into the .profile.d direcotry.
Put files that define aliases and functions into the .bashrc.d directory.

Files that have the .bash extension will be loaded only if the current shell is 'bash'
Files that hace the .sh extension will be loaded if the current shell is 'sh' or 'bash'
