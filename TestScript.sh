#Script to delete remote git branches
##

# Fetch the remote resources
git fetch
git pull

# Loop through all remote merged branches
for branch in $(git branch -r --merged  | grep -v HEAD | grep -v QA | grep -v QA | egrep -v "(^\*|donotdelete)" | sed /\*/d); do
           if [ -z "$(git log -1 --since='date -d "-01 days" + "%Y %m %d"' -s ${branch})" ]; then
                           echo -e `git show --format="%ci %cr %an" ${branch} | head -n 1` \\t$branch
                           remote_branch=$(echo ${branch} | sed 's#origin/##' )
                                                                        #git push origin --delete ${remote_branch}
            fi
          done
