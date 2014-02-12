
## The most important git commands

### Configuration

Use these commands to configure git, before you use it.
(Fill in your own information.) See the [git
book](http://git-scm.com/book/en/Customizing-Git-Git-Configuration).

    git config --global user.name "Jane Doe"
    git config --global user.email "janedoe@wisc.edu"

    git config --global color.ui true

    git config --global core.editor emacs

    git config --global core.excludesfile ~/.gitignore_global

### Clone a repository

To clone your own GitHub repository, if you're using ssh, use

    git clone git@github.com:kbroman/qtl.git

If you're using http instead (I think you have to type your password
each time):

    git clone https://github.com/kbroman/qtl.git

To clone someone else's 

    git clone git://github.com/kbroman/qtl.git

### The basics

Most of the time, you'll be typing:

    git status
    git add
    git commit
    git push
    
You can use `git commit -a` to commit all changes to files that are
currently being tracked (skipping the `git add`).

Get a summary of previous commits with `git log`:

    git log
    git log -2                            # [last 2 commits]
    git log -2 -p                         # [-p shows what's changed]
    git log -2 --stat                     # [no. lines added/removed]
    git log --pretty=oneline              # [one-line summary]
    git log --pretty=format:"%h - %an, %ar : %s"

Diff is really useful for seeing what you've changed, and to see
what's changed between different versions.  You can refer to commits
by a tag (see next section), by the initial part of the "SHA hash", or by
branch. You can look at just changes in a given file. If you use
[GitX](http://gitx.frim.nl/) for Mac, you can pipe the `git diff`
output to gitx.

    git diff  
    git diff 7d9fbc
    git diff 7d9fbc 9952b
    git diff 1.16-6
    git diff 1.16-6 R/est.map.R
    git diff 1.16-6 R/est.map.R | gitx
    git diff --stat master devel

### Tagging

It can be useful to add tags for different commits. (For example,
versions that you've released to the public, or sent
to a collaborator, or submitted to a journal.)

    git tag -a -m "tagging version 1.11-7" 1.11-7
    git push --tags
    git tag -d 1.11-7                     # [deleting a tag]
    git push origin :refs/tags/1.11-7     # [remove tag from origin that I'd removed locally]


### Branching and merging

Branching is really useful

    git branch                            # [to see what branches there are]
    git branch -a                         # [also shows remote branches]
    git branch blah                       # [to create the 'blah' branch]
    git checkout blah                     # [to switch to the 'blah' branch
    git checkout master; git merge blah   # [merge blah into master]


### Going back

Sometimes you want to go back.

  git reset --hard                      # [throw all changes away]
  git checkout myfile.txt               # [throw away changes to myfile.txt]
  git commit --amend                    # [revise the last commit message]


### GitHub stuff

Some commands I use with GitHub.
  
   git remote add friend git://github.com/friend/repo.git
   git pull friend master

   git push --set-upstream origin <branch>
   git push origin <branch>
   git push origin --delete <branch>


Github remotes: see [the help page](http://help.github.com/remotes/)

In `.git/config`:

    [remote "friend]
	url = git://github.com/friend/repo.git
	fetch = +refs/heads/*:refs/remotes/pjotr/*

After pulling from origin, use the following to get access to a branch
only on origin:

    git checkout -b mybranch origin/mybranch


---

### Bitbucket

I had some trouble setting up ssh in Bitbucket; here's what seemed to work.
But it was a _long_ time ago, so I don't really know what any of this
means.

Have the ssh agent running:

    ssh-agent  

To check if you have any ssh identities:

    ssh-add -l 

To add the default identities:

    ssh-add

To remove all current identities:

    ssh-add -D

---

### Pull Requests at BitBucket

How to do a pull request on bitbucket (This only seems to work if
you've _forked_ someone's repository.)

1. push change to BitBucket

       make change
       git add, git commit
       git push

2. On the BitBucket website: go to _your_ version of the repository

3. Top right, Icon + "Pull request"

4. Your repository on left; person that you want to pull on right

5. Perhaps add a description.
