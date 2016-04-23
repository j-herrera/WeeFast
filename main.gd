
extends Node2D


var CO2_val = 10

# Define CO2 rates
var africa_CO2_rate = 1
var europe_CO2_rate = 1
var north_america_CO2_rate = 1
var south_america_CO2_rate = 1
var asia_CO2_rate = 1
var australasia_CO2_rate = 1

func _init():
    	var europe = continent.new()

func _process(delta):
	var total_CO2_rate = africa_CO2_rate + europe_CO2_rate
	CO2_val = CO2_val + total_CO2_rate*delta
	
	get_node("CO2_value").set_text(str(CO2_val))
	
	print(europe.CO2_rate)
	
	if CO2_val > 100:
		get_tree().change_scene("res://lose.scn")
	
func _ready():
	set_process(true)	
	
func _on_reduce_pressed():
	CO2_val = CO2_val - 1






