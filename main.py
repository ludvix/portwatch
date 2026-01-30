#main py
import argparse

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
print(args)