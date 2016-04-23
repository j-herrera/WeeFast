
extends Node2D

var CO2_val = 10
var temp_val = 20
var year = 1
var actions = 2
var CO2_rate = 1


#func _process(delta):
func _ready():
	set_process(true)	

func _on_reduce_CO2_pressed():
	compute_action()


func compute_action():
	if actions > 0:
		actions -= 1
		CO2_rate -= 1
		get_node("action_value").set_text(str(actions))
		
func compute_world():
	CO2_val += CO2_rate
	temp_val += CO2_val * 0.01
	year += 1
	get_node("C02_value").set_text(str(CO2_val))
	get_node("Temp_value").set_text(str(temp_val))
	get_node("year_value").set_text(str(year))
	get_node("action_value").set_text(str(actions))
	
	if temp_val > 25:
		get_tree().change_scene("res://lose.scn")
	elif year > 200:
		get_tree().change_scene("res://win.scn")
	


func _on_close_menu_pressed():
	get_node("open_menu").show()
	get_node("menu_popup").hide()
	
func _on_open_menu_pressed():
	get_node("menu_popup").popup()
	get_node("menu_popup").set_exclusive(true)

func _on_next_turn_pressed():
	compute_world()
	actions = 2
	get_node("action_value").set_text(str(actions))

func _on_open_research_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_research/Research_popup").popup()
	get_node("menu_popup/open_research/Research_popup").set_exclusive(true)


func _on_close_research_pressed():
	get_node("menu_popup/open_research/Research_popup").hide()
	_on_open_menu_pressed()

func _on_open_politics_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_politics/Politics_popup").popup()
	get_node("menu_popup/open_politics/Politics_popup").set_exclusive(true)


func _on_close_politics_pressed():
	get_node("menu_popup/open_politics/Politics_popup").hide()
	_on_open_menu_pressed()

func _on_open_facilities_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_facilities/Facilities_popup").popup()
	get_node("menu_popup/open_facilities/Facilities_popup").set_exclusive(true)


func _on_close_facilities_pressed():
	get_node("menu_popup/open_facilities/Facilities_popup").hide()
	_on_open_menu_pressed()

