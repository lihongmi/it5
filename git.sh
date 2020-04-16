#!/bin/bash
git add .
git commit -m 'xj--'$1
git push origin master
# 提交时只需要执行 bash git.sh '参数内容'即可完成提交操作