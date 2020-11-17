#!/bin/bash

wait_for_ssh() {
    for i in $(seq 1 30); do
        ssh -T -q -o BatchMode=yes -o ConnectTimeout=5 -o ConnectionAttempts=1 localhost -p 10022 -l root 'exit 0' > /dev/null 2>&1
        ret=$?
        if [ $ret -eq 0 ]; then
            return 0
        fi

        #echo "Waiting for ssh server to start..."
        sleep 1s
    done
    return 1
}

wait_for_ssh
ret=$?
[ $ret -ne 0 ] && { echo "Failed to connect to ssh server"; exit 1; }

ssh localhost -p 10022 -l root $@
