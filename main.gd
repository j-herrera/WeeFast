
extends Node2D

var CO2_val = 10
var temp_val = 20
var year = 1
var actions = 2
var CO2_rate = 1
var energy = {
	"solar" : [0,5,0,-0.4],
	"coal" : [3,5,1,0.5],
	"gas" : [3,5,0.5,0.5],
	"wind" : [0,5,0,-0.4],
	"nuclear" : [0,10,0,-1]
	}
var science = {
	"solar" : [],
	"wind" : [],
	"nuclear" : [],
	"fossil" : []
	}
var law = {
	"forest": [0],
	"electric_cars": [],
	"lower_tax": [],
	"higher_tax": [] 
}
var temporary_dick = {}

#print(ultimate_dick["solar"])

#func _process(delta):
func _ready():
	set_process(true)	

func modifiers():
	var inc_CO2 = energy['solar'][0]*energy['solar'][2] + energy['coal'][0]*energy['coal'][2] +  energy['gas'][0]*energy['gas'][2] + energy['wind'][0]*energy['wind'][2] + energy['nuclear'][0]*energy['nuclear'][2]
	var inc_points = energy['solar'][0]*energy['solar'][3] + energy['coal'][0]*energy['coal'][3] +  energy['gas'][0]*energy['gas'][3] + energy['wind'][0]*energy['wind'][3] + energy['nuclear'][0]*energy['nuclear'][3]
	print(inc_CO2)
	
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
	pass # replace with function body

func _on_dtax_pressed():
	pass # replace with function body

func _on_itax_pressed():
	pass # replace with function body
	
# Energy buttons
func _on_open_facilities_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_facilities/Facilities_popup").popup()
	get_node("menu_popup/open_facilities/Facilities_popup").set_exclusive(true)

func _on_close_facilities_pressed():
	get_node("menu_popup/open_facilities/Facilities_popup").hide()
	_on_open_menu_pressed()


func _on_Coal1_pressed():
	pass # replace with function body


func _on_Coal2_pressed():
	pass # replace with function body


func _on_Coal3_pressed():
	pass # replace with function body


func _on_Gas1_pressed():
	pass # replace with function body


func _on_Gas2_pressed():
	pass # replace with function body


func _on_Gas3_pressed():
	pass # replace with function body


func _on_Solar1_pressed():
	pass # replace with function body


func _on_Solar2_pressed():
	pass # replace with function body


func _on_Solar3_pressed():
	pass # replace with function body


func _on_Nuclear1_pressed():
	pass # replace with function body


func _on_Nuclear2_pressed():
	pass # replace with function body


func _on_Nuclear3_pressed():
	pass # replace with function body


func _on_Wind1_pressed():
	pass # replace with function body


func _on_Wind2_pressed():
	pass # replace with function body


func _on_Wind3_pressed():
	pass # replace with function body
