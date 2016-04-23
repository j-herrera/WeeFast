
extends Node2D


var CO2_val = 10
var temp_val = 20
var time_val = 0

# Define CO2 rates
var africa_CO2_rate = 1
var europe_CO2_rate = 1
var north_america_CO2_rate = 1
var south_america_CO2_rate = 1
var asia_CO2_rate = 1
var australasia_CO2_rate = 1


func _process(delta):
	var total_CO2_rate = africa_CO2_rate + europe_CO2_rate	
	CO2_val = CO2_val + total_CO2_rate*delta
	temp_val = temp_val + delta*CO2_val*0.05
	time_val = time_val + delta
	get_node("C02_value").set_text(str(CO2_val))
	get_node("Temp_value").set_text(str(temp_val))
	get_node("time_value").set_text(str(time_val))
	
	if temp_val > 25:
		get_tree().change_scene("res://lose.scn")
	elif time_val > 25:
		get_tree().change_scene("res://win.scn")

func _ready():
	set_process(true)	
	
func _on_reduce_pressed():
	CO2_val = CO2_val - 1

