#! /bin/bash
SLACK_WEB="https://hooks.slack.com/services/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"
if [ $# -gt 0 ]; then
    for USERNAME in $@;
    do
    EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
    if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
        echo "the user $USERNAME already exists"
    else
        echo "lets create user $USERNAME"
        sudo useradd -m ${USERNAME} --shell /bin/bash
        sudo usermod -aG sudo ${USERNAME}
        echo '${USERNAME} ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
        SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${SPEC}"
        echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
        passwd -e ${USERNAME}
        #echo "the temporary credentials are ${USERNAME} and $PASSWORD"
        curl -X POST -H 'Content-type: application/json' --data '{"text":'$USERNAME ------ $PASSWORD'}' $SLACK_WEB
    fi
    done
else
    echo "PLease provide valid arguments."
fi
