require 'socket'

target = ARGV[0]
port_range = ARGV[1].split('-')

(port_range[0].to_i..port_range[1].to_i).each do |port|
  Socket.tcp(target, port) {|sock|
  sock.close_write
  puts "Hello, #{target} #{port_range}"
}
end