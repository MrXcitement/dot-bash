#!bash
# git-subrepo.bash --- initialize the git-subrepo command if installed
# Mike Barker <mike@thebarkers.com>
# August 20th 2018

GIT_SUBREPO_RC="${HOME}/src/github/ingydotnet/git-subrepo/.rc"
if [[ -f "${GIT_SUBREPO_RC}" ]]; then
    source "${GIT_SUBREPO_RC}"
fi
