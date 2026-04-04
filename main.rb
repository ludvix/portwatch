require 'socket'

target = ARGV[0]
port_range = ARGV[1].split('-')
total_ports_open = 0

(port_range[0].to_i..port_range[1].to_i).each do |port|
  begin 
    Socket.tcp(target, port, connect_timeout: 3) {|sock|
    sock.close_write
    puts "Port #{port}: Open"
    total_ports_open += 1
    }
  rescue
    puts "Port #{port}: Closed"
  end
end
puts "Scan complete - #{total_ports_open} port open"
