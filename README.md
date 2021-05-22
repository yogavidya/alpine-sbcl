# alpine-sbcl
A docker container with Emacs+SBCL, also exposing a swank server

### Use case: 
- for Common Lisp development, you need to constantly switch from, say, LispWorks on Windows to SBCL on Linux.
- you'd love the two implementation to share the same project files

### Requirements:
- docker

### Installation:
- clone the repository
- add in the root of the cloned directory a .env file
- edit the .env file to contain this line: 
  `LOCAL_PROJECTS=[your-home-dir]/quicklisp/local-projects`
- in the cloned directory,
  `docker-compose build`
  `docker-compose up`
- configure your favorite SSH client to connect to **root@localhost:4006** (no password required)

### Usage:
1. You can open the above ssh connection and use Emacs+slime. You will actually be working on your local project files.
2. If you simply need a REPL, you can open your local Emacs and `M-x slime-connect RET 4006 RET`: this is the resident SBCL service.

### Notes:
- If you connect to the alpine-sbcl REPL with a local Emacs via swank, you can open your local-projects files, but your REPL won't interact with them via SLIME (sorry: I'd love to implement this feature, but the problem of path mapping is beyond what I'm willing to invest in this project.)
- *This is meant to be used as a facility for local SBCL development on a Windows machine - DON'T EXPOSE the ssh server or the swank server out of your local network, security is nonexistent!*