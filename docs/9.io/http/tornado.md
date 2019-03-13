app = tornado.web.Application(route)
	set	
	router
		pass
	autoreload: 检查已使用源文件的修改时间
	
app.listen
	tornado.httpserver.HTTPServer.listen(self --> app)
		self.add_sockets(sockets=bind_sockets(port, address=address))
			# 添加到ioloop
			self._sockets[sock.fileno()] = sock
			tornado.netutil.add_accept_handler(nock, self._handle_connection, io_loop=self.io_loop)
				io_loop.add_handler(sock, accept_handler, IOLoop.READ)
				accept_handler
					callback(connection, address)  # self._handle_connection
						# ssl
						pass
						IOStream
						future = self.handle_stream(stream, address)
							tornado.httpserver.HTTPServer.handle_stream
								context = _HTTPRequestContext
								conn = HTTP1ServerConnection
								self._connections.add(conn)
								conn.start_serving(self)
									HTTP1ServerConnection._server_request_loop
										conn = HTTP1Connection
										tornado.httpserver.HTTPServer.start_request
											delegate = self.request_callback.start_request(server_conn, request_conn)  # `instance.initialize(*args self=app, **init_kwargs)`
											@jump: app.start_request(server_conn, request_conn)
										ret = yield conn.read_response(delegate=_RoutingDelegate)
											conn._read_message
												read_until_regex  # headers
												delegate.headers_received(start_line, headers)
												@jump _RoutingDelegate.headers_received
												_read_body
													_read_fixed_body
														delegate.data_received(body)
														@jump:  _RoutingDelegate.data_received
												delegate.on_connection_close()
												@jump _RoutingDelegate.on_connection_close
												self._clear_callbacks()

						self.io_loop.add_future(gen.convert_yielded(future), lambda f: f.result())


app.start_request
	tornado.routing.Router.start_request
		_RoutingDelegate(router=self, server_conn, request_conn)

_RoutingDelegate.headers_received
	self.delegate = self.router.find_handler(request)  # handler
	@jump app.find_handler
	self.delegate.headers_received

_RoutingDelegate.data_received
	return self.delegate.data_received(chunk)

app.find_handler
@TODO: 太虚化了，next time, 主要应该是中间件处理,找到对应handler并转换到prepare,get...

tornado.web.RequestHandler.

tornado.ioloop.IOLoop.current().start()
