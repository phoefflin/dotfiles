alias git-no-hooks='git -c core.hooksPath=/dev/null'
alias gitn='git -c core.hooksPath=/dev/null'

alias git_tags_only_local='comm -23 <(git tag | sort) <(git ls-remote --tags origin | awk -F"/" "{print \$NF}" | sort)'
alias git_tags_only_remote='comm -13 <(git tag | sort) <(git ls-remote --tags origin | awk -F"/" "{print \$NF}" | sort)'

# see https://stackoverflow.com/questions/27693286/git-squash-entire-branch-one-line-squash-command/27693287#27693287
# Squash current branch from its departure point in main branch. You must run
# this command when on your branch's last commit.
function git-squash() {
    # https://stackoverflow.com/a/48524405/6320039
    local main_commit="$(git merge-base HEAD main)"
    local last_branch_commit="$(git rev-parse HEAD)"
    git reset --soft "$main_commit"
    # Preserve commits
    git commit -em "$(git log --reverse --format=%B ${main_commit}..${last_branch_commit})"
}


