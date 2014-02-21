## Git/GitHub Lab

We'll work in pairs: **User A** and **User B**

### User A

- Set up a new repository, locally

        mkdir [directory]
        cd [directory]
        git init

- Create or copy over a file or two and add them to the repository.

        [create/copy files]
        git add [filenames]
        git commit

- Go to your GitHub account and create a new repository

- Connect and push your local repository to GitHub

        git remote add origin git@github.com:[userA]/[repo]

  or

        git remote add origin https://github.com/[userA]/[repo]

  add then

        git push -u origin master

### User B

- Fork user A's repository on GitHub: go to
  `http://github.com/[UserA]/[repo]` and click the "Fork" button.

- Clone _your_ version of that repository locally

        git clone git@github.com:[userB]/[repo]

  or

        git clone https://github.com/[userB]/[repo]

- Change a file, and another file

        [change/copy files]
        git add [filenames]
        git commit

- Push the changes to GitHub

        git push

- Make a pull request:

  - Go to _your_ version of the repository on GitHub
  (`http://github.com/[userB]/[repo]`)
  - Click "Pull requests"
  - Click "New pull request"
  - Click "Create pull request"
  - Optionally add a comment
  - Click "Send pull request"

### User A

- Connect to User B's repository

        git remote add [userB] git://github.com/[userB]/[repo]

- Fetch the changes from User B

        git fetch [userB]

- Checkout their version of the repo as a local branch

        git checkout -b [userB] [userB]/master

- Check that you like the changes

- Use `git branch` to see your branches; the asterisk indicates the
  one you're currently on.

- Switch back to ("`checkout`") your master branch

        git checkout master

- Note that the files are in the state that _you_ left them.

- Merge their work into your master branch.

        git merge userB

- Push the work to github.

        git push

- Make another change to the file; then `add`, `commit`, and `push`.

### User B

- Add a connection to User A's repo; the "main" repository is often
  called "`upstream`".

        git remote add upstream git://github.com/[userA]/[repo]

- Fetch User A's latest

        git fetch upstream

- Check it out as a local branch

        git checkout -b upstream upstream/master

- Test things

- Checkout your master, merge the change from User A, and push to
  github.

        git checkout master
        git merge upstream
        git push

### Users A and B

- Make simulateneous changes, then `add`, `commit`, and `push`.

### User B

- Pull User A's change

        git checkout upstream
        git pull

- Go back to your master branch and merge the change from User A.

        git checkout master
        git merge upstream

- Fix the merge conflict; then `add`, `commit`, `push`.

- Make another pull request

### User A

- Fetch User A's repo

        git checkout [userA]
        git pull

- Merge into your master branch

        git checkout master
        git merge [userA]

- Push back to github

        git push
