#main py
import argparse
import socket
import json 

host = "localhost"
port_start = 1 
port_end = 1024
timeout_secs = 0.5 # Seconds timer for per connection attempt
state_file_path = "ports.json" # File for saving previous scan
reset_base = False # Start fresh scan file
json_output = False 

pars = argparse.ArgumentParser("Portwatch CLI")

pars.add_argument("--host", type=str, default="localhost", help="Target host to scan")
pars.add_argument("--ports", type=str, default="1-1024", help="Port range, format start-end 1-1024")
pars.add_argument("--timeout", type=float, default=0.5, help="Seconds timer timeout between each port scan")
pars.add_argument("--state-file", type=str, default="ports.json", help="File to save/read from previous scan")
pars.add_argument("--reset", action="store_true", help="Start fresh scan file")
pars.add_argument("--json", action="store_true", help="Output JSON")

args = pars.parse_args()
host = args.host
ports = args.ports
timeout_secs = args.timeout
state_file_path = args.state_file
reset_base = args.reset
json_output = args.json

split_port_result = ports.split("-")
port_start = int(split_port_result[0])
port_end = int(split_port_result[1])

def scan_port(host, port):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(timeout_secs)
        s.connect((host, port))
        s.close()
        return True
    except:
        return False

for port in range(port_start, port_end + 1):
    print(f"Scanning port {port}...")
    if scan_port(host, port):
        print(f"Port {port} is OPEN!")

