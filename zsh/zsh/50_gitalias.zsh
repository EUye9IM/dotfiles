alias ga='git add'
alias gl='git log --oneline --date=short --date-order --pretty=format:"%C(auto)%h%Creset %C(auto)%d%Creset %s %C(green)<%an>%Creset %C(bold cyan)(%as - %cr)" --color -n $((($(tput lines)-5)))'
alias gc="git commit"
alias gca="git commit --amend --reset-author --no-edit"
alias gp="git push"
alias gpf="git push -f"
alias gsw="git switch"
alias gswc="git switch -c"
alias gst="git status"
alias gb="git branch"
alias gcl="git clone --no-tags --single-branch"
alias gsh="git show --stat --stat-width=60 --stat-graph-width=120 --dirstat"
alias glg='git log --graph --oneline --date=short --date-order --pretty=format:"%C(auto)%h%Creset %C(auto)%d%Creset %s %C(green)<%an>%Creset %C(bold cyan)(%as - %cr)" --color'
gsyn() {
    git fetch origin "$1" || { echo "gsyn: failed to fetch '$1' from origin"; return 1; }
    if ! git rev-parse --verify "origin/$1" >/dev/null 2>&1; then
        echo "gsyn: origin/$1 does not exist"
        return 1
    fi
    if git rev-parse --verify "$1" >/dev/null 2>&1; then
        if [[ "$(git branch --show-current)" == "$1" ]]; then
            git rebase "origin/$1"
        else
            git branch -f "$1" "origin/$1"
        fi
    else
        git switch -c "$1" "origin/$1"
    fi
}
