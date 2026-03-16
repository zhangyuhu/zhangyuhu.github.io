#!/bin/sh

# If a command fails then the deploy stops
set -e

username=$(whoami)
echo "当前用户名: $username"

if [ "$username" = "hulk" ]; then
    echo "当前用户是 hulk 执行 cp /Users/hulk/.ssh/config 操作..."
    cp /Users/hulk/.ssh/config ./Works/X-Humanoid/SYS/config
fi

echo "LOG DATE:" $(date +"%Y-%m-%d %H:%M:%S")
DATE=`date '+%Y%m%d-%H%M%S'`
echo $DATE

printf "\033[0;32mcheck and push to remote ...\033[0m\n"

# Add changes to git.
if [ -n "$(git status -s)" ];then
  git add ./
  # Commit changes.
  msg="update note $(date)"
  if [ -n "$*" ]; then
    msg="$*"
  fi
  git commit -m "$msg"
  git cazyh

  git pull --rebase
  git push origin master
fi

printf "\n\n"
printf "\033[0;32mDone\033[0m\n"
