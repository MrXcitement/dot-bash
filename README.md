# dot-bash
My personal 'sh' and 'bash' shell configuration files.

## System
Configured to work on the following systems:
* OS X 10.9+
* Linux (Raspian, Ubuntu)

## Startup file sourcing order
|No. | File                     | Sourced by                    |
|---:|--------------------------|-------------------------------|
|   1|/etc/profile              |'bash' or 'sh' shells          |
|   2|~/.bash_profile           |'bash' shell                   |
|   3|~/.profile                |~/.bash_profile or 'sh' shell  |
|   4|~/.profile.d/*.sh files   |~/.profile                     |
|   5|~/.shrc                   |~/.profile                     |
|   6|~/.bashrc.d/*.sh files    |~/.shrc                        |
|   7|~/.profile.d/*.bash files |~/.bash_profile                |
|   8|~/.bashrc                 |~/.bash_profile                |
|   9|/etc/bashrc               |~/.bashrc                      |
|  10|~/.bashrc.d/*.bash files  |~/.bashrc                      |
|----|--------------------------|-------------------------------|

## Usage
When you want to add some configuration information

Put files that define environment variables and startup programs into the .profile.d direcotry.
Put files that define aliases and functions into the .bashrc.d directory.

Files with a '.bash' extension will be loaded if the current shell is 'bash'
Files with a '.sh' extension will be loaded if the current shell is 'sh' or 'bash'
