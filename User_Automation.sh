#! /bin/bash
if [ $# -gt 0 ]; then
    USERNAME=$1
    EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
    if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
        echo "the user $USERNAME already exists"
    else
        echo "lets create user $USERNAME"
    fi
else
    echo "PLease provide valid arguments."
fi
