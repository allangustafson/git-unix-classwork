#!/bin/sh

# Allan Gustafson
# 12/3/24

printf "%-10s %-10s %-5s %-5s %-5s %-s \n" "Last" "First" "Job" "Old" "New" "Message"
while read DATA
do
        USER_ID=` echo $DATA | cut -d'|' -f1 `
        LAST_NAME=` echo $DATA | cut -d'|' -f2 `
        FIRST_NAME=` echo $DATA | cut -d'|' -f3 `
        JOB=` echo $DATA | cut -d'|' -f4 `
        OLD_NICE=` echo $DATA | cut -d'|' -f5 `
        PREFERRED_PASSWORD=` echo $DATA | cut -d'|' -f6 `
        FULL_NAME="$FIRST_NAME $LAST_NAME"
        case "$JOB" in
                "P") NEW_NICE=3 ;;
                "S") NEW_NICE=6 ;;
                *) NEW_NICE=7
        esac
        ENCRYPTED_PASSWORD=` echo "$PREFERRED_PASSWORD" | openssl passwd -1 -stdin `

        if [ -d "/home/$USER_ID" ]
        then
                MESSAGE="$USER_ID already setup"
        else
                useradd -m -c "$FULL_NAME" -p "$ENCRYPTED_PASSWORD" "$USER_ID"
                MESSAGE="$USER_ID created"
        fi
        if ! [ -d "/home/"$USER_ID"/"$LAST_NAME"_backup" ]
        then
                mkdir /home/"$USER_ID"/"$LAST_NAME"_backup
                chown $USER_ID:$USER_ID /home/"$USER_ID"/"$LAST_NAME"_backup
        fi
        printf "%-10s %-10s %-5s %-5s %-5s %-s \n" $LAST_NAME $FIRST_NAME $JOB $OLD_NICE $NEW_NICE "$MESSAGE"
done < test3_data.txt

