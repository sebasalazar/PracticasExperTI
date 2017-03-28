#!/bin/bash
directorio="/tmp/repo"
date=`date +%Y%m%d%H%M`
if [ -d $directorio ] ; then
        directorio="/tmp/repo"
else
        echo `mkdir $directorio`
fi

echo `git bundle create repo.bundle --all`

echo `mv repo.bundle $directorio`

echo `mysqldump -u root -pa+b=c 5f197c7b6ede3ff0 > dbdump.sql`

echo `mv dbdump.sql $directorio`

echo `tar -cJf repo$date.tar.xz $directorio`

echo `rm -fr $directorio`
