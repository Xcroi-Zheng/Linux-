#!/bin/bash
#编写脚本exe3，该脚本对比两个目录dir1和dir2（通过参数给出）
#将dir2中符合下列条件的文件复制到dir1，并将每一条复制记录存储到文件record中：
#该文件不在dir1中
#该文件比dir1中的同名文件更新
touch record
copyDir()
{
    for prime_ in $2/*
    do
        prime=${prime_##*/}
        if [ ! -e $1"/"$prime ]
        then
            cp $2"/"$prime $1
            echo "Copy $prime from $2 to $1" >> record
        else
        if [ $1"/"$prime -ot $2"/"$prime ]
            then
                cp $2"/"$prime $1
                echo "Replace $prime in $1" >> record
            fi
        fi
    done
}
copyDir $1 $2