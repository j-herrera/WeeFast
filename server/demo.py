import socket
import time
 
UDP_IP_IN = "127.0.0.1"
UDP_PORT_IN = 5004

UDP_PORT_OUT = 5005

sock_out = socket.socket(socket.AF_INET, # Internet
		socket.SOCK_DGRAM) # UDP

sock_in = socket.socket(socket.AF_INET, # Internet
		socket.SOCK_DGRAM) # UDP
sock_in.bind(('', UDP_PORT_IN))

# Lobby
ip1 = ""
ip2 = ""
msg = "Match!"
while True:
	data, addr = sock_in.recvfrom(1024)
	print(addr[0])
	if (ip1 == ""):
		ip1 = addr[0]
	elif (ip1 != addr[0]):
		ip2 = addr[0]
		sock_out.sendto(msg.encode(encoding='UTF-8',errors='strict'), (ip1, UDP_PORT_OUT))
		sock_out.sendto(msg.encode(encoding='UTF-8',errors='strict'), (ip2, UDP_PORT_OUT))
		break

# Game
nm = 0
while True:
	data, addr = sock_in.recvfrom(1024)
	
	print(data)
	print(addr[0])
	
	if (addr[0] == ip1):
		data1 = data
		nm += 1
	
	if (addr[0] == ip2):
		data2 = data
		nm += 1
	
	if nm == 2:
		sock_out.sendto(data1, (ip2, UDP_PORT_OUT))
		sock_out.sendto(data2, (ip1, UDP_PORT_OUT))
		nm = 0

