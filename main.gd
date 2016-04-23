
extends Node2D

var CO2_val = 10
var CO2_rate = 1
var temp_val = 20
var points_val = 20
var points_rate = 2
var year = 1
var actions = 2
var energy = {
	"solar" : [0,5,0,-0.4],
	"coal" : [3,5,1,0.5],
	"gas" : [3,5,0.5,0.5],
	"wind" : [0,5,0,-0.4],
	"nuclear" : [0,10,0,-1]
	}
var science = {
	"solar" : [0,5,0,0],
	"wind" : [0,5,0,0],
	"nuclear" : [0,5,0,0],
	"fossil" : [0,5,0,0]
	}
var law = {
	"forest": [0,5,0,0],
	"ecars": [0,5,0,0],
	"dtax": [0,5,0,0],
	"itax": [0,5,0,0] 
}
var temporary_dick = {}

#print(ultimate_dick["solar"])

#func _process(delta):
func _ready():
	set_process(true)	

func CO2_mod():
	var inc_CO2 = energy['solar'][0]*energy['solar'][2] + energy['coal'][0]*energy['coal'][2] +  energy['gas'][0]*energy['gas'][2] + energy['wind'][0]*energy['wind'][2] + energy['nuclear'][0]*energy['nuclear'][2] + science['solar'][0]*science['solar'][2] + science['wind'][0]*science['wind'][2] + science['nuclear'][0]*science['nuclear'][2] + science['fossil'][0]*science['fossil'][2] + law['forest'][0]*law['forest'][2] + law['ecars'][0]*law['ecars'][2] + law['dtax'][0]*law['dtax'][2] + law['itax'][0]*law['itax'][2]
	return inc_CO2
	
func points_mod():
	var inc_points = energy['solar'][0]*energy['solar'][3] + energy['coal'][0]*energy['coal'][3] +  energy['gas'][0]*energy['gas'][3] + energy['wind'][0]*energy['wind'][3] + energy['nuclear'][0]*energy['nuclear'][3] + science['solar'][0]*science['solar'][3] + science['wind'][0]*science['wind'][3] + science['nuclear'][0]*science['nuclear'][3] + science['fossil'][0]*science['fossil'][3] + law['forest'][0]*law['forest'][3] + law['ecars'][0]*law['ecars'][3] + law['dtax'][0]*law['dtax'][3] + law['itax'][0]*law['itax'][3]
	return inc_points
	
func _on_reduce_CO2_pressed():
	compute_action()
	#print(ultimate_dick['solar'])
	modifiers()

func compute_action():
	if actions > 0:
		actions -= 1
		CO2_rate -= 1
		get_node("action_value").set_text(str(actions))
		
func compute_world():
	var CO2_mod = CO2_mod()
	var points_mod = points_mod()
	CO2_rate += CO2_mod
	points_rate += points_mod
	CO2_val += CO2_rate 
	temp_val += CO2_val * 0.01
	points_val += points_rate
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

# Law buttons 
func _on_open_politics_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_politics/Politics_popup").popup()
	get_node("menu_popup/open_politics/Politics_popup").set_exclusive(true)

func _on_close_politics_pressed():
	get_node("menu_popup/open_politics/Politics_popup").hide()
	_on_open_menu_pressed()

func _on_forestry_pressed():
	if law['forest'][0] == 0:
		law['forest'][0] = 1
	print(law['forest'][0])
	get_node("menu_popup/open_politics/Politics_popup/forestry").set_opacity(0.2)
		
func _on_ecars_pressed():
	if law['ecars'][0] == 0:
		law['ecars'][0] = 1
	print(law['ecars'][0])
	get_node("menu_popup/open_politics/Politics_popup/ecars").set_opacity(0.2)

func _on_dtax_pressed():
	if law['dtax'][0] == 0:
		law['dtax'][0] = 1
	print(law['dtax'][0])
	get_node("menu_popup/open_politics/Politics_popup/dtax").set_opacity(0.2)

func _on_itax_pressed():
	if law['itax'][0] == 0:
		law['itax'][0] = 1
	print(law['itax'][0])
	get_node("menu_popup/open_politics/Politics_popup/itax").set_opacity(0.2)
	
# Energy buttons
func _on_open_facilities_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_facilities/Facilities_popup").popup()
	get_node("menu_popup/open_facilities/Facilities_popup").set_exclusive(true)

func _on_close_facilities_pressed():
	get_node("menu_popup/open_facilities/Facilities_popup").hide()
	_on_open_menu_pressed()


func _on_Coal1_pressed():
	if (actions > 0) and (energy['coal'][0] == 0 or energy['coal'][0] == 2):
		energy['coal'][0] = 1
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Coal1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_opacity(1)
	print(energy['coal'][0])

func _on_Coal2_pressed():
	if (actions > 0) and (energy['coal'][0] == 1 or energy['coal'][0] == 3):
		energy['coal'][0] = 2
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Coal1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_opacity(1)
	print(energy['coal'][0])

func _on_Coal3_pressed():
	if (actions > 0) and (energy['coal'][0] == 2):
		energy['coal'][0] = 3
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Coal1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_opacity(0.2)
	print(energy['coal'][0])

func _on_Gas1_pressed():
	if (actions > 0) and (energy['gas'][0] == 0 or energy['gas'][0] == 2):
		energy['gas'][0] = 1
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Gas1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_opacity(1)
	print(energy['gas'][0])

func _on_Gas2_pressed():
	if (actions > 0) and (energy['gas'][1] == 0 or energy['gas'][0] == 3):
		energy['gas'][0] = 2
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Gas1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_opacity(1)
	print(energy['gas'][0])

func _on_Gas3_pressed():
	if (actions > 0) and (energy['gas'][0] == 2):
		energy['gas'][0] = 3
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Gas1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_opacity(0.2)
	print(energy['gas'][0])

func _on_Solar1_pressed():
	if (actions > 0) and (energy['solar'][0] == 0 or energy['solar'][0] == 2):
		energy['solar'][0] = 1
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Solar1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar3").set_opacity(1)
	print(energy['solar'][0])

func _on_Solar2_pressed():
	if (actions > 0) and (energy['solar'][0] == 1 or energy['solar'][0] == 3):
		energy['solar'][0] = 2
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Solar1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar3").set_opacity(1)
	print(energy['solar'][0])

func _on_Solar3_pressed():
	if (actions > 0) and (energy['solar'][0] == 2):
		energy['solar'][0] = 3
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Solar1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar3").set_opacity(0.2)
	print(energy['solar'][0])

func _on_Nuclear1_pressed():
	if (actions > 0) and (energy['nuclear'][0] == 0 or energy['nuclear'][0] == 2):
		energy['nuclear'][0] = 1
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear3").set_opacity(1)
	print(energy['nuclear'][0])

func _on_Nuclear2_pressed():
	if (actions > 0) and (energy['nuclear'][0] == 1 or energy['nuclear'][0] == 3):
		energy['nuclear'][0] = 2
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear3").set_opacity(1)
	print(energy['nuclear'][0])

func _on_Nuclear3_pressed():
	if (actions > 0) and (energy['nuclear'][0] == 2):
		energy['nuclear'][0] = 3
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear3").set_opacity(0.2)
	print(energy['nuclear'][0])

func _on_Wind1_pressed():
	if (actions > 0) and (energy['wind'][0] == 0 or energy['wind'][0] == 2):
		energy['wind'][0] = 3
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Wind1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind3").set_opacity(1)
	print(energy['wind'][0])

func _on_Wind2_pressed():
	if (actions > 0) and (energy['wind'][0] == 1 or energy['wind'][0] == 3):
		energy['wind'][0] = 2
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Wind1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind3").set_opacity(1)
	print(energy['wind'][0])

func _on_Wind3_pressed():
	if (actions > 0) and (energy['wind'][0] == 2):
		energy['wind'][0] = 3
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Wind1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind3").set_opacity(0.2)
	print(energy['wind'][0]) 

# Research Buttons
func _on_Solartech1_pressed():
	pass # replace with function body


func _on_Solartech2_pressed():
	pass # replace with function body


func _on_Solartech3_pressed():
	pass # replace with function body


func _on_Windtech1_pressed():
	pass # replace with function body


func _on_Windtech2_pressed():
	pass # replace with function body


func _on_Windtech3_pressed():
	pass # replace with function body


func _on_Nucleartech1_pressed():
	pass # replace with function body


func _on_Nucleartech2_pressed():
	pass # replace with function body


func _on_Nucleartech3_pressed():
	pass # replace with function body


func _on_Fossiltech1_pressed():
	pass # replace with function body


func _on_Fossiltech2_pressed():
	pass # replace with function body


func _on_Fossiltech3_pressed():
	pass # replace with function body
