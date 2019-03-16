# django-admin startproject xx
django.bin.django-admin

django.core.management
	execute_from_command_line
	ManagementUtility.execute
		CommandParser
		django.setup()
			@TODO
		ManagementUtility.autocomplete
			@pass
		ManagementUtility.fetch_command(subcommand).run_from_argv(self.argv)
			# fetch_command(sys.argv[1]='startproject')
			get_commands()
				'django.core(@TODO).management.commands'

# python manager.py runserver
django.core.management 同上
django.core.management.commands.runserver.Command
	run_from_argv
	execute
	handle
	run
	inner_run
	get_handler-> django.core.servers.basehttp.get_internal_wsgi_application
		default/project.wsgi.py-> django.core.wsgi.get_wsgi_application
			django.core.handlers.wsgi.WSGIHandler
				__init__
					self.load_middleware()
						# join together into a chain
					        handler = convert_exception_to_response(self._get_response)
						for middleware in settings.MIDDLEWARE:
							mw_instance = middleware(handler)
							handler = convert_exception_to_response(mw_instance)
						self._middleware_chain = handler
				__call__
					request = self.request_class(environ)
						pass
					response = self.get_response(request)
						response = self._middleware_chain(request)
						
	django.core.servers.basehttp.run()
		httpd = httpd_cls(server_address, WSGIRequestHandler, ipv6=ipv6)
			__init__
		httpd.set_app(wsgi_handler)
		httpd.serve_forever()
			# http.server.HTTPServer
			# socketserver.TCPServer
			# socketserver.BaseServer
			__init__
				self.socket = socket.socket
				self.server_bind
					self.socket.bind
				self.server_activate
					self.socket.listen
				self.server_close
					self.socket.close
			run_forever
				selector.select(poll_interval)
				self._handle_request_noblock()
					get_request
						self.socket.accept
					process_request
						# 请求处理
						finish_request: self.RequestHandlerClass=WSGIRequestHandler(request)
							@TODO: WSGIRequestHandler.handle()
						handle_error
						shutdown_request
					shutdown_request
					handle_error
				self.service_actions()
					# 请求结束后的额外工作
					collect_children
	
