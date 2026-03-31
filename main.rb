require 'socket'

Socket.tcp("www.ruby-lang.org", 80) {|sock|
  sock.close_write
  puts sock.read
}
