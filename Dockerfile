FROM alpine
WORKDIR /root
VOLUME "/root/quicklisp/local-projects/"
RUN passwd -d root
RUN echo >> /etc/securetty "ssh"
RUN apk update
RUN apk add sbcl
RUN apk add git
RUN apk add emacs
RUN apk add mc
# quicklisp setup
RUN wget https://beta.quicklisp.org/quicklisp.lisp
RUN sbcl --load "quicklisp" --eval "(quicklisp-quickstart:install)" --quit
# emacs setup
COPY requirements/.emacs .
RUN git clone https://github.com/slime/slime.git
# sbcl setup
COPY requirements/.sbclrc .
RUN sbcl --eval "(ql:quickload :iterate)"
RUN sbcl --eval "(ql:quickload :closer-mop)"
# sshd setup
RUN apk add openssh
RUN ssh-keygen -A
COPY requirements/ssh/sshd_config /etc/ssh/sshd_config
# entrypoint setup
COPY requirements/entrypoint.sh .
RUN chmod ug+x ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh
EXPOSE 4005 22
