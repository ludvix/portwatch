# Portwatch

Portwatch is a port scanner made in Ruby, that detects open ports on a host.

## Usage (All platforms)

1. Clone the repo
2. cd repo
3. Make sure ruby is installed on your system
4. Run: 
```bash
ruby main.rb google.com 79-81
```
---

## Example output 
```bash
Port 79: Closed
Port 80: Open
Port 81: Closed
Scan complete - 1 ports open | Program finished in: 6.09 seconds
```