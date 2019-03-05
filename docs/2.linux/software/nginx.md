# @TODO: more

# nginx
http://nginx.org/en/

## settings
```
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}
```

## http
```
http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;
}
```

## http.server
```
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
}

## http.server.location
```
# https://www.cnblogs.com/zhaof/p/5945576.html?utm_source=itdadao&utm_medium=referral
# http://nginx.org/en/docs/http/ngx_http_core_module.html#location
# 1.匹配前会urldecode(uri)
# 2.首先找出前缀最长匹配的
# 3.再按定义顺序匹配正则
# 4.3有的？3:2
# 5.特例: = 匹配的立即终止 以及 2为^~ 将会终止匹配正则

# rewrite && proxy_pass
# http://nginx.org/en/docs/http/ngx_http_rewrite_module.html#rewrite
# last: stop rewrite and relocate new uri
# break: stop rewrite
# redirect: 302
# permanent: 301
# 如果后者uri为url立刻重定向

# proxy_pass 无uri的附加，反之，直接返回后者
location ~ \.php$ {
    root           html;
    fastcgi_pass   127.0.0.1:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
    include        fastcgi_params;
}
```

# openresty
https://github.com/openresty/lua-nginx-module

