#! /bin/bash
#don't want to print this command results so redirecting to null(black hole) folder
$1 >/dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "THE COMMAND WAS SUCCESSFULL"
else
    echo "THE COMMAND WAS FAILED"
fi
#! /bin/bash
export SYSTEMD_PAGER=
service nginx status > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "nginx is RUNNING"
else
    echo "nginx is NOT running"
    service nginx start
fi
