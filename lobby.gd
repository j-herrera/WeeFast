
extends Node2D

var udp = PacketPeerUDP.new()
var numer = 0

func send_message(text):
	if (udp.is_listening()):
		udp.put_var(text)

func _ready():
	set_process(true)
	var err = udp.listen(5005)
	if (err != OK):
		print("Errorrrrr")
		return
	err = udp.set_send_address("134.168.36.150",5004)
	if (err != OK):
		print("Errorrrrr")
		return
	send_message("Player ready")


func _process(delta):
	numer = numer + 1
	if (udp.get_available_packet_count() > 0):
		get_tree().change_scene("res://multi.scn")
		if delta*numer >=30:
			send_message("Player ready")
			numer = 0
