#!/bin/bash

# set -x

STOP_CONT="no"

# create user
function add_user() { 
    echo Create user with
    echo "  user id = $CURRENT_UID"
    echo "  user name = $CURRENT_USER"
    echo "  user passwd = $CURRENT_PASSWORD"
    useradd -u $CURRENT_UID --shell /bin/bash $CURRENT_USER

    echo "${CURRENT_USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${CURRENT_USER} && \
    chmod 0440 /etc/sudoers.d/${CURRENT_USER}

}


# handler for term signal
function sighandler_TERM() {
    echo "signal SIGTERM received\n"

    echo "terminate postgresql"
    service postgresql stop

    STOP_CONT="yes"
}


function run (){ 
    # add handler for signal SIHTERM
    trap 'sighandler_TERM' 15

    add_user

    echo "wait for terminate signal"
    while [  "$STOP_CONT" = "no"  ] ; do
      sleep 1
    done

    exit 0
}

run