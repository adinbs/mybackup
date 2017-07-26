#!/bin/bash
namafiledb=/path/to/your/webroot-$(date +%Y%m%d).sql
hapusfiledb=/path/to/your/webroot-$(date +%Y%m%d --date="7 days ago").sql
cd /path/to/your/webroot
rm -rf $namafiledb
echo "Backup Last database"
mysqldump --opt -u dbusername --password="dbpassword" dbname > $namafiledb
echo "done..."
git add .
//make this file
echo "commit to remote git"
git commit -am "web update"
git push -u origin master
echo "removing last week database file"
rm -rf $hapusfiledb
