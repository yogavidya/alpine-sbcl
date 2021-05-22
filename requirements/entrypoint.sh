/usr/sbin/sshd
sbcl \
    --eval "(ql:quickload :swank)" \
    --eval "(setf swank::*loopback-interface* \"0.0.0.0\")" \
    --eval "(swank:create-server :dont-close t)" 
