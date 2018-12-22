#!/bin/bash

printf "\n\n"
echo "STARTING NANOCD TEST ON TEST REPO"
printf "\n"

TEST_DIR='~/nano_test/'
DATE=`date +"%Y-%m-%d-%H-%M"`
FEATURE_BRANCH=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)

cp nanocd /usr/local/bin/nanocd
cd $TEST_DIR
git checkout -b $DATE
touch ${DATE}_test.txt
git add . && git add *
git commit -m $DATE
git push --set-upstream origin $FEATURE_BRANCH

nanocd -r https://github.com/tkjef/bash_test.git -l ~/nano_test -n nano_test -p
