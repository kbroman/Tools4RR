## Git/GitHub Lab

We'll work in pairs: **User A** and **User B**

### First exercise


#### User A

- Set up a new repository, locally

  ```
  mkdir [directory]
  cd [directory]
  git init
  ```
       
- Create or copy over a file or two and add them to the repository.
 
  ```
  [create/copy files]
  git add [filenames]
  git commit
  ```
       
- Go to your GitHub account and create a new repository
 
- Connect and push your local repository to GitHub
 
  ```
  git remote add origin git@github.com:[userA]/[repo]
  ```
       
  or
   
  ```
  git remote add origin https://github.com/[userA]/[repo]
  ```
       
  add then
   
  ```
  git push -u origin master
  ```
       
#### User B

- Fork user A's repository on GitHub
 
- Clone _your_ version of that repository locally
 
  ```
  git clone git@github.com:[userB]/[repo]
  ```
       
  or
   
  ```
  git clone https://github.com/[userB]/[repo]
  ```
       
- Change a file, and another file
 
  ```
  [change/copy files]
  git add [filenames]
  git commit
  ```
       
- Push the changes to GitHub
 
  ```
  git push
  ```
       
- Make a pull request on GitHub       

#### User A
1. connect to B's fetch, test, merge, push
1. further change, push, pull request(?)

#### User B
2. fetch, test, merge, push

2. further change, ...

#### User A 
1. fetch, test, merge, push

#### User A and B
1 & 2 simulateneous changes

#### User B 
2: pull request

#### User A 
1. fetch, test, merge, deal with conflict, push

#### User B

2.: fetch, test, merge, push



### Whole thing in reverse?

reverse

### Branching and merging

each: branch, change a couple of times
change master, merge master
change branch
merge branch into master
