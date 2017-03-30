#!/bin/bash
directorio="/tmp/repo"
date=`date +%Y%m%d%H%M`
destino="/tmp/backup"
if [ -d $directorio ] ; then
        directorio="/tmp/repo"
else
        mkdir $directorio
fi

if [ -d $destino ] ; then
        destino="/tmp/backup"
else
        mkdir $destino
fi

git bundle create repo.bundle --all

mv repo.bundle $directorio

mysqldump -u root -pa+b=c 5f197c7b6ede3ff0 > dbdump.sql

mv dbdump.sql $directorio

cp -r /home/experti/sources/frappe-bench/ $directorio

tar -cJf repo$date.tar.xz $directorio

mv repo$date.tar.xz $destino

rm -fr $directorio
