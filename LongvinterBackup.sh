#!/bin/bash

CURRENTEPOCTIME=`date +"%s"`

BackupFolder () {
        if [[ -d /home/steam/longvinter-linux-server/Longvinter/Backup/ ]]
        then
            echo "The backup folder exists on your filesystem."
        else
                mkdir -p /home/steam/longvinter-linux-server/Longvinter/Backup
                echo "The back up folder has been created on your filesystem."
        fi
}

BackupServer () {
        systemctl is-active --quiet longvinter && echo "Server is running!"
        sudo systemctl stop longvinter && echo "Server is now closed, backing up..."
        tar --exclude=/home/steam/longvinter-linux-server/Longvinter/Saved/Logs -cvzf /home/steam/longvinter-linux-server/Longvinter/Backup/Saved-Backup-${CURRENTEPOCTIME}.tar.gz /home/steam/longvinter-linux-server/Longvinter/Saved
        sleep 1
        echo "Starting server..."
        sudo chmod -R ugo+rwx /home/steam/longvinter-linux-server/
        sudo systemctl start longvinter && echo "Server is now running!"
}


echo "WARNING: Starting backup script will close the server in order to fully save everything, make sure that no players are online."

read -p "Do you want to proceed? (yes/no) " yn

case $yn in
        yes ) echo "Starting backup script...";
                BackupFolder;
                BackupServer;;
        y ) echo "Starting backup script...";
                BackupFolder;
                BackupServer;;
        no ) echo "Aborting backup script...";
                exit;;
        n ) echo "Aborting backup script...";
                exit;;
        * ) echo "Invalid response.";
                exit 1;;
esac
