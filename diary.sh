#!/bin/bash


if [ "$1" == "" ]; then
	f="now"
else
	f=$1
fi


if [ ! -e `date +%Y -d"${f}"` ]; then
	mkdir `date +%Y -d"${f}"`
fi
if [ ! -e `date +%Y/%m -d"${f}"` ]; then
	mkdir `date +%Y/%m -d"${f}"`
fi

p=`date +"%Y/%m/%d" -d"${f}"`

if [ ! -e ${p} ]; then
	date +"%Y年%m月%d日(%a)" -d"${f}" >> ${p}
fi
vim ${p}
