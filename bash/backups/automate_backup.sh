
#!/bin/bash

# Automate backup of directory, keeping only last 7 backups
date=$(date +"%H_%M_%S")
destination="/home/kacperjozwiak/bash-inter-2/backup_restore/backuped_dirs"
files_in_dest_num=$(find /home/kacperjozwiak/bash-inter-2/backup_restore/backuped_dirs -type f | wc -l)

printf "Provide directory for backup "
read dir_to_backup

if [[ ! -d $dir_to_backup ]]
then
        printf "Provided directory doesn't exist"
else
        tar -czf archive_$date.tar.gz $dir_to_backup
        printf "Directory has been compressed\n"
        mv archive_$date.tar.gz /home/kacperjozwiak/bash-inter-2/backup_restore/backuped_dirs
        if [[ -f $destination/archive_$date.tar.gz ]]
        then
                printf "Compressed file is moved and exist in destination"
        else
                printf "Something went wrong, compressed file not in destination"
        fi

        if (( $files_in_dest_num > 7 ))
        then
                printf "Number of files in destination is more than 7. First created backup will be removed"
                cd $destination
                ls -tp | grep -v '/$' | tail -n +8 | xargs -I {} rm -- {}

        else
                printf "Number of files didn't exceed 7 yet."
        fi
