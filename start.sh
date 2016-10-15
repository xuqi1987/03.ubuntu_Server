#!/bin/sh
#rm *.log *.out
rm -rf /data/html
if [ ! -d /data ]; then

	mkdir -p /data/photo	
	mkdir -p /data/database
	mkdir -p /data/download
	rm -rf /data/html
	cp -rf html/ /data/
	chmod -R 755 /data

fi;

rm -f /data/html
cp -rf html/ /data/
chmod  -R 755 /data
cd weixin

python app.py
nginx -s reload
aria2c --enable-rpc --rpc-listen-all
#sqlite_web data/database/database.db
