
extends Node2D

var C02_val = 10


func _process(delta):
	C02_val = C02_val + 0.1*delta
	get_node("C02_value").set_text(str(C02_val))
	
	if C02_val > 11:
		get_tree().change_scene("res://lose.scn")
			


func _ready():
	set_process(true)	


