#! /bin/bash

stat_file_cnt(){
    cnt=0
    for file in `ls $1`
    do
       if [ -d $1"/"$file ] #注意此处之间一定要加上空格，否则会报错
       then
           stat_file_cnt $1"/"$file
       else
           echo $1"/"$file #在此处处理文件即可
           if [[ $file == *_gt.json* ]]
           then
               cnt=`expr ${cnt} + 1`
           fi
       fi
    done
    echo "目录\""$1\""下*_gt.json*文件数："$cnt
}

# 参数是指定的目录
stat_file_cnt $1
