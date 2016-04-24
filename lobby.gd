
extends Node2D

var udp = PacketPeerUDP.new()

func send_message(text):
	if (udp.is_listening()):
		udp.put_var(text)

func _ready():
	set_process(true)
	var err = udp.listen(5005)
	if (err != OK):
		print("Errorrrrr")
		return
	err = udp.set_send_address("127.0.0.1",5004)
	if (err != OK):
		print("Errorrrrr")
		return
	send_message("Player ready")
	

func _process(delta):
	if (udp.get_available_packet_count() > 0):
		get_tree().change_scene("res://multi.scn")