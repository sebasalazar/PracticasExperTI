#!/bin/bash
directorio="/tmp/repo"
date=`date +%Y%m%d%H%M`
if [ -d $directorio ] ; then
        directorio="/tmp/repo"
else
        mkdir $directorio
fi

git bundle create repo.bundle --all

mv repo.bundle $directorio

mysqldump -u root -pa+b=c 5f197c7b6ede3ff0 > dbdump.sql

mv dbdump.sql $directorio

tar -cJf repo$date.tar.xz $directorio

rm -fr $directorio
