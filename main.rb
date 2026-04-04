require 'socket'

target = ARGV[0]
port_range = ARGV[1].split('-')
total_ports_open = 0
start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
targeted_ports = [ # Common ports used by malware and tools
  4444,
  1337,
  31337,
  5555,
  6666,
  6667,
  9001,
  9050,
  3333,
  7777,
  8888
]

(port_range[0].to_i..port_range[1].to_i).each do |port|
  begin 
    Socket.tcp(target, port, connect_timeout: 3) {|sock|
    sock.close_write
    total_ports_open += 1
    if targeted_ports.include?(port)
      puts "WARNING! following port(s) #{port} is open"
    else
      puts "Port #{port}: Open"
    end
    }
  rescue
    puts "Port #{port}: Closed"
  end
end
stop_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
time_total = stop_time - start_time
puts "Scan complete - #{total_ports_open} port(s) open | Program finished in: #{time_total.round(2)} seconds"
