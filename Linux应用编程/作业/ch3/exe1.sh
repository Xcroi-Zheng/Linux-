#!/bin/bash
#编写脚本exe1，该脚本接收一个命令行参数，并根据其类型做以下操作：
#若参数为普通文件，则显示其内容
#若参数为压缩文件，则解压缩（如同目录下有同名文件则放弃）
#若参数为目录，则将其归档并压缩（如已有同名压缩文件则放弃）
#若参数不存在，给出错误提示并退出
name=$1
isCommon()
{
    fileName1=$name
    fileSuffix1=${fileName1##*.}
    if [ ! "$fileSuffix1" = "gz" ]
    then
        if test -f $fileName1
        then
            cat  $fileName1
        fi
    fi
}
isRAR()
{
    fileName2=$name
    fileSuffix2=${fileName2##*.}
    fileJudge=${fileName2%.*}
    if [ -e $fileJudge ] && [ "$fileSuffix2" = "gz" ]
    then
        echo "There is already a document with the same name"
        return 1
    elif [ "$fileSuffix2" = "gz" ]
    then
        tar -zxf $fileName2
    fi
}
isDocument()
{
    fileName3=$name
    if [ -d $fileName3 ]
    then
        fileZip=$fileName3".tar.gz"
        if [ -e $fileZip ]
        then
            echo "There is already a document with the same name"
            return 1
        else
            tar -zcf $fileZip $fileName3
        fi
    fi
}
isExist()
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
