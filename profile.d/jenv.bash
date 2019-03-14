#!/bin/bash
# jenv.bash --- setup the jenv command line tool
# used to help you forget how to set the JAVA_HOME environment variable
# http://www.jenv.be/

if type jenv > /dev/null 2>&1; then
    eval "$(jenv init -)"
fi
