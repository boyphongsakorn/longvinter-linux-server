#!/bin/bash
echo "Checking for updates..."

UpdateServer () {
        # systemctl is-active --quiet longvinter && echo "Server is running!"
        # sudo systemctl stop longvinter && echo "Server is now closed, now getting latest version.."
        echo "getting latest version.."
        git restore .
        sleep 1
        git stash
        git pull "https://github.com/Uuvana-Studios/longvinter-linux-server.git" main
        sleep 1
        echo "Starting server..."
        sudo chmod -R ugo+rwx /data/longvinter-linux-server/
        # sudo systemctl start longvinter && echo "Server is now running"
        echo "Server is now comeing soon to running"
}

cd /data/longvinter-linux-server

git fetch

if git merge-base --is-ancestor origin/main main ; then
        echo "Nothing to update.."
else
        echo "Change found, updating server.."
        UpdateServer
fi
