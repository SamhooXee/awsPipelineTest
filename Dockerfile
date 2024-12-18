FROM nginx:alpine

# 将容器ID写入文件
RUN echo "$(cat /proc/self/cgroup | head -n 1 | cut -d '/' -f3)" > /usr/share/nginx/html/container-id.txt

# 添加自定义nginx配置
COPY nginx.conf /etc/nginx/nginx.conf

# 添加自定义location来返回容器ID
# RUN echo "location = /container-id { alias /usr/share/nginx/html/container-id.txt; }" >> /etc/nginx/nginx.conf

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]