
# sh
#To run - github <filename>

!/bin/env bash

filename=$1

git clone https://melody-zhan:313f4fa8cf0d38e593d12d0f235fe6cb80ef05f3@concentrator.na.bigdata.intraxa:10199/$filename

# connect to github
git config --global http.sslVerify false

# fork github to bigplay personal account


# making dir
mkdir 
# remove a dir
rm -r filename
# get into dir
cd 
 
# When in git repo folder, check linkcopy
git remote -v

# then copy last version from github
git pull #branchname#

# get branch list 
git branch -a

# get remote branch to local
git fetch

# Switch to another branch
git checkout #master# 


# At start of day
•	git pull origin master



•	git push origin master


# When committing
•	git status
•	git add .  # include manually deletion: git add -A
•	git commit -m “comment”
•	git push origin branch
Pull requests from branch on local in GitHub Enterprise

# check log
git log

# create new file 
vim 
:edit filename

# give permission to run .sh file
chmod 700 pyspark-kernel.sh


# create New branch everytime before push to master

--create your branch locally:
git checkout -b <branch-name>

-- push local new branch to github new branch
git push <remote-name> <branch-name>
like git push -u origin your_branchls


# move file to New location
mv ETL_and_modelcreate.scala /home/mzhan/ia_distribution_graph/Cypher/

#	Make a new folder 
cp -r  jet_audit_20170828 jet_audit_20170930

# change file name
mv HENRY_20170331.sql HENRY_20170828.sql

# delete untrack file from local branch
Step 1 is to show what will be deleted by using the -n option:
git clean -n

Clean Step - beware: this will delete files:
git clean -f


# Delete both remote and local branch 
git push -d <remote_name> <branch_name>


#If you want to revert changes made to your working copy, do this:
git checkout .

#If you want to revert changes made to the index (i.e., that you have added), do this. Warning this will reset all of your unpushed commits to master!:
git reset

#If you want to revert a change that you have committed, do this:
git revert <commit 1> <commit 2>

#If you want to remove untracked files (e.g., new files, generated files):
git clean -f

#Or untracked directories (e.g., new or automatically generated directories):
git clean -fd
