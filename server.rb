require 'socket' # Provides TCPServer and TCPSocket classes

server = TCPServer.new('localhost', 2000)

loop do
  socket = server.accept
  request = socket.gets

  # Log the request to the console for debugging
  STDERR.puts request
  
  response = "<html>" +
								"<head>" +
								  "<title>Welcome</title>" +
								"</head>" +
								"<body>" +
								  "<h1>Hello World</h1>" +
								"</body>" +
							"</html>"

  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"
  socket.print response
  socket.close
end
