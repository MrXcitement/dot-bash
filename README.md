bashrc
======

My personal 'bash' configuration files.

Configured to work on the following systems:

OS X 10.9
Linux (Raspian, Ubuntu)

### Startup file sourcing order
/etc/profile
~/.bash_profile
~/.profile (explicitly sourced by ~/.bash_profile)
~/.shrc (explicitly sourced by ~/.profile)
~/.bashrc (explicitly sourced by ~/.shrc if Bash)
/etc/bashrc (explicitly sourced by ~/.bashrc)
