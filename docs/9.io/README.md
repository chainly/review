# file
# stream
# socket

# http
## server
1. server_bind
2. server_activate
3. request(@TODO: fork/async)
	1. get_request
	2. process_request
	3. shutdown_request
	4. handle_error
4. service_actions

## application
一个http服务的具化实体(命名)

## IOStream
设置好的socket

## context
理解为request

## HTTP1ServerConnection
按http处理的socket

## handler
处理context的逻辑
