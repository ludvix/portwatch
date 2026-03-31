require 'socket'

target = ARGV[0]
port_range = ARGV[1].split('-')

(port_range[0].to_i..port_range[1].to_i).each do |port|
  begin 
    Socket.tcp(target, port) {|sock|
    sock.close_write
    puts "Port #{port}: Open"
    }
  rescue
    puts "Port #{port}: Closed"
  end
end
