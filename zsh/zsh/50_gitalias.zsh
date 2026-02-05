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
