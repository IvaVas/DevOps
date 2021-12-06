#!/bin/bash

# Where to backup to.
dest="/home/ivan/Documents"

# Create archive filename.
day=$(date +%F_%T)

archive_file="$day.sql"

# Backup the files using tar.
mysqldump --no-tablespaces -u cool_user -p1234567890 for_dump > $dest/$archive_file



