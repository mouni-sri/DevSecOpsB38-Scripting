#! /bin/bash
SLACK_WEB="https://hooks.slack.com/services/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"
if [ $# -gt 0 ]; then
    for USERNAME in $@; do
        if [[ $USERNAME =~ [a-z]{3}[0-5]{3} ]]; then
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
            passwd -e ${USERNAME} >> /etc/null
            #echo "the temporary credentials are ${USERNAME} and $PASSWORD"
            curl -X POST $SLACK_WEB -sL -H 'Content-type: application/json' --data "{"text":\"The Username is\"}" >> /etc/null
            curl -X POST $SLACK_WEB -sL -H 'Content-type: application/json' --data "{"text":\"${USERNAME}\"}" >> /etc/null
            curl -X POST $SLACK_WEB -sL -H 'Content-type: application/json' --data "{"text":\"The Password is\"}" >> /etc/null
            curl -X POST $SLACK_WEB -sL -H 'Content-type: application/json' --data "{"text":\"${PASSWORD}\"}" >> /etc/null
        fi
        else
            echo "username must contain alphabets..."
        fi
        done
else
    echo "PLease provide valid arguments."
fi
