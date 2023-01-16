#!/bin/bash

# =========================================================================================
# create Workshop--DC-7.3/directory
# clone remote git Workshop--DC-7.3 repository
# copy files over to /etc/ansible/playbooks
# tidy up directory..
# dont forget to close and open VSC ..
# 
# If you reboot the server, clone_workshop.service will reset the /etc/ansible
# 16/01/2023
# =========================================================================================

# set variables
remoteHost=github.com
remoteUser=jporeilly
localUser=installer
remoteDir=Workshop--DC-7.3
remoteRepo=https://$remoteHost/$remoteUser/$remoteDir
localDirW=/home/installer/Workshop--DC-7.3
ansPlaybooks=/etc/ansible/playbooks
mod_01E=$localDirW/01--Infrastructure/01-Environment
mod_01A=$localDirW/01--Infrastructure/02-Ansible
mod_02=$localDirW/02--Preflight
mod_03=$localDirW/03--Data-Catalog
mod_04=$localDirW/04--Workshop

# check to see if local directory exists
if [ -d "$localDirW" -a ! -h "$localDirW" ]
then
    echo "Directory $localDirW exists .." 
    echo "Deleting $localDirW .."
         rm -rf $localDirW
else
    echo "Error: Directory $localDirW does not exists .."
fi
    echo "Creating $localDirW directory .."
         mkdir $localDirW
         git clone $remoteRepo $localDirW
         chown -R $localUser $localDirW
    echo "Deleting $ansPlaybooks .."
         rm -rfv $ansPlaybooks/*
    echo "Copying over Module 01 - Infrastructure .."
         cp -rfp $mod_01E/*  $ansPlaybooks
         cp -rfp $mod_01A/*  $ansPlaybooks
    echo "Copying over Module 02 - Preflight .."
         cp -rfp $mod_02/*  $ansPlaybooks
    echo "Copying over Module 03 - Data Catalog .."
         cp -rfp $mod_03/*  $ansPlaybooks
    echo "Copying over Module 04 - Workshop .."
         cp -rfp $mod_04/*  $ansPlaybooks
    echo "Copy over ansible configuration files .."
    echo "Tidying up directory .."
         rm -rfv $ansPlaybooks/*.md
    echo "Latest Workshop--Data-Catalog copied over .. close and open VSC .."