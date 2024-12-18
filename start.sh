#!/bin/sh

# 将当前日期写入文件
date > /usr/share/nginx/html/container-id.txt

# 启动 nginx
nginx -g "daemon off;"