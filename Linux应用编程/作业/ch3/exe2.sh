#!/bin/bash
#编写脚本exe2，由用户输入一组数（以end表示输入结束），输出这些数的和，结果保留2位小数。
#要求使用函数做输入类型检查，并给出错误提示信息。
isLegal()
{
    if [ -n "$1" ]
    then
        if [[ $1 =~ ^[0-9]+$ ]]
        then
            return 0
        else
            return 1
        fi
    fi
}
read -p "Please input number:" -r num 
sum=0
while [ ! "$num" = "end" ]
do
    if isLegal $num
    then
        sum=$num+$sum
    else   
        echo "Type wrong, please input number."
    fi
    read -r num
done
echo "scale=2;$sum/1.0"|bc
