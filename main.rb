require 'socket'

target = ARGV[0]
port_range = ARGV[1].split('-')

Socket.tcp(target, port_range.to_i) {|sock|
  sock.close_write
  puts sock.read

  puts "Hello, #{target} #{port_range}"
}
