#! /usr/bin/env bash

git pull origin master

TrapOnExit()
{
git add .
git commit -m "[MaestroCI]: AutoSave ${date +%d-%m-%y\ %T}" --signoff
git push origin master
echo "Current Saves Pushed Successfully!"
sendTG "Server taking a reboot! I have committed world to GitHub"
}

trap TrapOnExit SIGINT SIGTERM

java -jar spigot-1.14.4.jar

