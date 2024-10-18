#!/bin/bash
name=$1
isCommon()  #是否为普通文件
{
    fileName1=$name
    fileSuffix1=${fileName1##*.}  #文件后缀
    if [ ! "$fileSuffix1" = "gz" ]
    then
        if test -f $fileName1
        then
            cat  $fileName1
            echo
        fi
    fi
}
isRAR()  #是否为压缩文件
{
    fileName2=$name
    fileSuffix2=${fileName2##*.}
    fileJudge=${fileName2%%.*}  #判断文件是否已经存在
    if [ -e $fileJudge ] && [ "$fileSuffix2" = "gz" ]
    then
        echo "There is already a file with the same name"
        return 1
    elif [ "$fileSuffix2" = "gz" ]
    then
        tar -zxf $fileName2
    fi
}
isDocument()  #判断是否为目录
{
    fileName3=$name
    if [ -d $fileName3 ]
    then
        fileZip=$fileName3".tar.gz"
        if [ -e $fileZip ]
        then
            echo "There is already a file with the same name"
            return 1
        else
            tar -zcf $fileZip $fileName3
        fi
    fi
}
isExist()  #判断是否存在
{
    fileName4=$name
    if [ ! -e $fileName4 ]
    then
        echo "There is no such file"
    fi
}
isExist
isCommon
isRAR
isDocument
