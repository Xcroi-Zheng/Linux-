#!/bin/bash
isLegal()  #判断输入是否合法
{
    if [ -n "$1" ]
    then
        if [[ $1 =~ ^[0-9]+$ ]] || [[ $1 = [0-9]*\.[0-9]* ]]  #利用正则表达式匹配
        then
            return 0
        else
            return 1
        fi
    fi
}
read -p "Please input number:" -r num  #逐行输入数字
sum=0
while [ ! "$num" = "end" ]
do
    if isLegal $num
    then
        sum=$num+$sum  #是数字则相加
    else   
        echo "Type wrong, please input number."  #否则输出错误信息
    fi
    read -r num
done
echo "scale=2;$sum/1.0"|bc  #保留两位小数
