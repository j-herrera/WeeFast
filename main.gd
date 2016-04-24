extends Node2D

var strtp
var CO2_val = 400 #ppm
var CO2_rate = 0
var temp_val = 14
var points_val = 50
var points_rate = 2
var year = 2015
var actions = 2
var energy = {
	"solar" : [0,5,0,-0.4],
	"coal" : [3,5,1,0.5],
	"gas" : [3,5,0.5,0.5],
	"wind" : [0,5,0,-0.4],
	"nuclear" : [0,10,0,-1]
	}
var science = {
	"solar" : [0,5,-0.2,0],
	"wind" : [0,5,-0.3,0],
	"nuclear" : [0,5,-0.3,0],
	"fossil" : [0,0,0.5,5]
	}
var law = {
	"forest": [0,5,-1,0],
	"ecars": [0,5,-0.6,0],
	"dtax": [0,0,0.8,5],
	"itax": [0,5,-0.8,0] 
}


#func _process(delta):
func _ready():
	set_process(true)	
	get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_opacity(0.2)
	get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_opacity(0.2)

#Research
	strtp = """Solar cells 
	First stage in solar research, you have the tecnology to manufacture solar cells which 
	are electrical devices that convert the energy of light directly into electricity."""
	strtp += "\n cost="+ str(science['solar'][1])
	strtp += "\n CO2 effect="+ str(science['solar'][2])
	get_node("menu_popup/open_research/Research_popup/Solartech1").set_tooltip(strtp)
	strtp = """Pointing array
Second stage in solar research: you are now able to use the solar cells at their
 full capability following the sun trajectory"""
	strtp += "\n cost="+ str(2*science['solar'][1])
	strtp += "\n CO2 effect="+ str(2*science['solar'][2])
	get_node("menu_popup/open_research/Research_popup/Solartech2").set_tooltip(strtp)
	strtp = """Mass production
Last stage in solar research:you have the tecnology necessary for mass production of solar
 arrays; this will increase your renewable energy source and decrease the CO2 level."""
	strtp += "\n cost="+ str(3*science['solar'][1])
	strtp += "\n CO2 effect="+ str(3*science['solar'][2])
	get_node("menu_popup/open_research/Research_popup/Solartech3").set_tooltip(strtp)
	strtp="""Materials
	First stage in wind research: you have the tecnology necessary to build 
	wind turbines so you can convert kinetic energy from the wind into electrical power."""
	strtp += "\n cost="+ str(science['wind'][1])
	strtp += "\n CO2 effect="+ str(science['wind'][2])
	get_node("menu_popup/open_research/Research_popup/Windtech1").set_tooltip(strtp)
	strtp = """Aerodinamics
Second stage in wind research: your knowledge in wind turbine 
aerodinamics is incresed, you can now increase the turbines efficiecy."""
	strtp += "\n cost="+str(2*science['wind'][1])
	strtp += "\n CO2 effect="+str(2*science['wind'][2])
	get_node("menu_popup/open_research/Research_popup/Windtech2").set_tooltip(strtp)
	strtp = """High efficiency bearing
Last stage in wind research: you reached maximum 
eficiency in your wind turbines."""
	strtp += "\n cost="+str(3*science['wind'][1])
	strtp += "\n CO2 effect="+str(3*science['wind'][2])
	get_node("menu_popup/open_research/Research_popup/Windtech3").set_tooltip(strtp)
	strtp = """Thorium salt
First stage in neclear research: you reached the tecnology level necessay 
to build a nuclear reactor which  initiates and controls a sustained nuclear chain reaction."""
	strtp += "\n cost="+ str(science['nuclear'][1])
	strtp += "\n CO2 effect="+ str(science['nuclear'][2])
	get_node("menu_popup/open_research/Research_popup/Nucleartech1").set_tooltip(strtp)
	strtp = """Waste reciclyng
Second stage in nuclear research: you are decreasing 
your waste production."""
	strtp += "\n cost="+str(2*science['nuclear'][1])
	strtp += "\n CO2 effect="+str(2*science['nuclear'][2])
	get_node("menu_popup/open_research/Research_popup/Nucleartech2").set_tooltip(strtp)
	strtp = """Fusion
Last stage in nuclear research: you are 
finally free from waste."""
	strtp += "\n cost="+str(3*science['nuclear'][1])
	strtp += "\n CO2 effect="+str(3*science['nuclear'][2])
	get_node("menu_popup/open_research/Research_popup/Nucleartech3").set_tooltip(strtp)
	strtp = """Fracking
First stage in fossil fuel research:the process of drilling down into the earth before a 
high-pressure water mixture is directed at the rock to release the gas inside. """
	strtp += "\n cost="+ str(science['fossil'][1])
	strtp += "\n CO2 effect="+ str(science['fossil'][2])
	get_node("menu_popup/open_research/Research_popup/Fossiltech1").set_tooltip(strtp)
	strtp = """Deep ocean drilling
Second stage in fossil fuel research:the process of oil and gas exploration in deep ocean;
 tecnologically more challenging than drilling on ground or shallow water, it increases your oil production."""
	strtp += "\n cost="+str(2*science['fossil'][1])
	strtp += "\n CO2 effect="+str(2*science['fossil'][2])
	get_node("menu_popup/open_research/Research_popup/Fossiltech2").set_tooltip(strtp)
	strtp = """Super extraction
Last stage in fossil fuel research: yuo are exstracting oil at your full capability, 
this produces many points but also has a major effect in CO2 levels."""
	strtp += "\n cost="+str(3*science['fossil'][1])
	strtp += "\n CO2 effect="+str(3*science['fossil'][2])
	get_node("menu_popup/open_research/Research_popup/Fossiltech3").set_tooltip(strtp)
#politics
	strtp = "Planting forest"
	strtp += "\n cost="+ str(law['forest'][1])
	strtp += "\n additional points="+ str(law['forest'][3])
	strtp += "\n CO2 effect="+ str(law['forest'][2])
	get_node("menu_popup/open_politics/Politics_popup/forestry").set_tooltip(strtp)
	strtp = "Electric cars politcs"
	strtp += "\n cost="+ str(law['ecars'][1])
	strtp += "\n additional points="+ str(law['ecars'][3])
	strtp += "\n CO2 effect="+ str(law['ecars'][2])
	get_node("menu_popup/open_politics/Politics_popup/ecars").set_tooltip(strtp)
	strtp = "Decrease oil taxes"
	strtp += "\n cost="+ str(law['dtax'][1])
	strtp += "\n additional points="+ str(law['dtax'][3])
	strtp += "\n CO2 effect="+ str(law['dtax'][2])
	get_node("menu_popup/open_politics/Politics_popup/dtax").set_tooltip(strtp)
	strtp = "Increase oil taxes"
	strtp += "\n cost="+ str(law['itax'][1])
	strtp += "\n additional points="+ str(law['itax'][3])
	strtp += "\n CO2 effect="+ str(law['itax'][2])
	get_node("menu_popup/open_politics/Politics_popup/itax").set_tooltip(strtp)
#Facilities
	strtp = "Coal"
	strtp += "\n starting number of facilities="+ str(energy['coal'][0])
	strtp += "\n stopping the facility cost="+ str(energy['coal'][1])
	strtp += "\n additional points per level="+ str(energy['coal'][2])
	strtp += "\n CO2 effect="+ str(energy['coal'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Coal1").set_tooltip(strtp)
	strtp = "Coal"
	strtp += "\n starting number of facilities="+ str(energy['coal'][0])
	strtp += "\n stopping the facility cost="+str(2*energy['coal'][1])
	strtp += "\n additional points per level="+str(2*energy['coal'][2])
	strtp += "\n CO2 effect="+str(2*energy['coal'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Coal2").set_tooltip(strtp)
	strtp = "Coal"
	strtp += "\n starting number of facilities="+ str(energy['coal'][0])
	strtp += "\n stopping the facility cost="+str(3*energy['coal'][1])
	strtp += "\n additional points per level="+str(3*energy['coal'][2])
	strtp += "\n CO2 effect="+str(3*energy['coal'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_tooltip(strtp)
	strtp = "Gas"
	strtp += "\n starting number of facilities="+ str(energy['gas'][0])
	strtp += "\n stopping the facility cost="+ str(energy['gas'][1])
	strtp += "\n additional points per level="+ str(energy['gas'][2])
	strtp += "\n CO2 effect="+ str(energy['gas'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Gas1").set_tooltip(strtp)
	strtp = "Gas"
	strtp += "\n starting number of facilities="+ str(energy['gas'][0])
	strtp += "\n stopping the facility cost="+str(2*energy['gas'][1])
	strtp += "\n additional points per level="+str(2*energy['gas'][2])
	strtp += "\n CO2 effect="+str(2*energy['gas'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Gas2").set_tooltip(strtp)
	strtp = "Gas"
	strtp += "\n starting number of facilities="+ str(energy['gas'][0])
	strtp += "\n stopping the facility cost="+str(3*energy['gas'][1])
	strtp += "\n additional points per level="+str(3*energy['gas'][2])
	strtp += "\n CO2 effect="+str(3*energy['gas'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_tooltip(strtp)
	strtp = "Solar"
	strtp += "\n starting number of facilities="+ str(energy['solar'][0])
	strtp += "\n building cost="+ str(energy['solar'][1])
	strtp += "\n additional points per level="+ str(energy['solar'][2])
	strtp += "\n CO2 effect="+ str(energy['solar'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Solar1").set_tooltip(strtp)
	strtp = "Solar"
	strtp += "\n starting number of facilities="+ str(energy['solar'][0])
	strtp += "\n building cost="+str(2*energy['solar'][1])
	strtp += "\n additional points per level="+str(2*energy['solar'][2])
	strtp += "\n CO2 effect="+str(2*energy['solar'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Solar2").set_tooltip(strtp)
	strtp = "Solar"
	strtp += "\n starting number of facilities="+ str(energy['solar'][0])
	strtp += "\n building cost="+str(3*energy['solar'][1])
	strtp += "\n additional points per level="+str(3*energy['solar'][2])
	strtp += "\n CO2 effect="+str(3*energy['solar'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Solar3").set_tooltip(strtp)
	strtp = "Nuclear"
	strtp += "\n starting number of facilities="+ str(energy['nuclear'][0])
	strtp += "\n building cost="+ str(energy['nuclear'][1])
	strtp += "\n additional points per level="+ str(energy['nuclear'][2])
	strtp += "\n CO2 effect="+ str(energy['nuclear'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Nuclear1").set_tooltip(strtp)
	strtp = "Nuclear"
	strtp += "\n starting number of facilities="+ str(energy['nuclear'][0])
	strtp += "\n building cost="+str(2*energy['nuclear'][1])
	strtp += "\n additional points per level="+str(2*energy['nuclear'][2])
	strtp += "\n CO2 effect="+str(2*energy['nuclear'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Nuclear2").set_tooltip(strtp)
	strtp = "Nuclear"
	strtp += "\n starting number of facilities="+ str(energy['nuclear'][0])
	strtp += "\n building cost="+str(3*energy['nuclear'][1])
	strtp += "\n additional points per level="+str(3*energy['nuclear'][2])
	strtp += "\n CO2 effect="+str(3*energy['nuclear'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Nuclear3").set_tooltip(strtp)
	strtp = "Wind"
	strtp += "\n starting number of facilities="+ str(energy['wind'][0])
	strtp += "\n building cost="+ str(energy['wind'][1])
	strtp += "\n additional points per level="+ str(energy['wind'][2])
	strtp += "\n CO2 effect="+ str(energy['wind'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Wind1").set_tooltip(strtp)
	strtp = "Wind"
	strtp += "\n starting number of facilities="+ str(energy['wind'][0])
	strtp += "\n building cost="+str(2*energy['wind'][1])
	strtp += "\n additional points per level="+str(2*energy['wind'][2])
	strtp += "\n CO2 effect="+str(2*energy['wind'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Wind2").set_tooltip(strtp)
	strtp = "Wind"
	strtp += "\n starting number of facilities="+ str(energy['wind'][0])
	strtp += "\n building cost="+str(3*energy['wind'][1])
	strtp += "\n additional points per level="+str(3*energy['wind'][2])
	strtp += "\n CO2 effect="+str(3*energy['wind'][3])
	get_node("menu_popup/open_facilities/Facilities_popup/Wind3").set_tooltip(strtp)
func CO2_mod():
	var inc_CO2 = energy['solar'][0]*energy['solar'][2] + energy['coal'][0]*energy['coal'][2] + energy['gas'][0]*energy['gas'][2] + energy['wind'][0]*energy['wind'][2] + energy['nuclear'][0]*energy['nuclear'][2] + science['solar'][0]*science['solar'][2] + science['wind'][0]*science['wind'][2] + science['nuclear'][0]*science['nuclear'][2] + science['fossil'][0]*science['fossil'][2] + law['forest'][0]*law['forest'][2] + law['ecars'][0]*law['ecars'][2] + law['dtax'][0]*law['dtax'][2] + law['itax'][0]*law['itax'][2]
	print(inc_CO2)
	return inc_CO2
	
func points_mod():
	var inc_points = energy['solar'][0]*energy['solar'][3] + energy['coal'][0]*energy['coal'][3] +  energy['gas'][0]*energy['gas'][3] + energy['wind'][0]*energy['wind'][3] + energy['nuclear'][0]*energy['nuclear'][3] + science['solar'][0]*science['solar'][3] + science['wind'][0]*science['wind'][3] + science['nuclear'][0]*science['nuclear'][3] + science['fossil'][0]*science['fossil'][3] + law['forest'][0]*law['forest'][3] + law['ecars'][0]*law['ecars'][3] + law['dtax'][0]*law['dtax'][3] + law['itax'][0]*law['itax'][3]
	print(inc_points)
	return inc_points

func compute_action():
	if actions > 0:
		actions -= 1
		get_node("action_value").set_text(str(actions))
		
func compute_world():
	var CO2_mod = CO2_mod()
	var points_mod = points_mod()
	CO2_val = CO2_val + CO2_rate + CO2_mod 
	temp_val = 0.008*CO2_val + 10.8
	print("before: ")
	print(points_val)
	points_val += points_rate + points_mod
	print("after: ")
	print(points_val)
	year += 1
	get_node("C02_value").set_text(str(CO2_val))
	get_node("Temp_value").set_text(str(temp_val))
	get_node("year_value").set_text(str(year))
	get_node("action_value").set_text(str(actions))
	get_node("points_value").set_text(str(points_val))
	
	get_node("AnimatedSprite").set_frame(int(0+(temp_val-20)*6))
	
	if temp_val > 18.76:
		get_tree().change_scene("res://lose.scn")
	elif year > 2100:
		get_tree().change_scene("res://win.scn")

func _acquireAssets(dict):
	points_val -= dict[0] * dict[1]
	get_node("points_value").set_text(str(points_val))


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


# Research buttons
func _on_open_research_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_research/Research_popup").popup()
	#get_node("menu_popup/open_research/Research_popup").set_exclusive(true)


func _on_close_research_pressed():
	get_node("menu_popup/open_research/Research_popup").hide()
	_on_open_menu_pressed()

func _on_Solartech1_pressed():
	if (actions > 0) and (science['solar'][0] == 0) and (points_val >= science['solar'][1]):
		science['solar'][0] = 1
		_acquireAssets(science['solar'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Solartech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Solartech2").set_opacity(1)
		get_node("menu_popup/open_research/Research_popup/Solartech3").set_opacity(1)
	print(science['solar'][0])

func _on_Solartech2_pressed():
	if (actions > 0) and (science['solar'][0] == 1) and (points_val >= 2 * science['solar'][1]):
		science['solar'][0] = 2
		_acquireAssets(science['solar'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Solartech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Solartech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Solartech3").set_opacity(1)
	print(science['solar'][0])


func _on_Solartech3_pressed():
	if (actions > 0) and (science['solar'][0] == 2) and (points_val >= 3 * science['solar'][1]):
		science['solar'][0] = 3
		_acquireAssets(science['solar'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Solartech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Solartech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Solartech3").set_opacity(0.2)
	print(science['solar'][0])


func _on_Windtech1_pressed():
	if (actions > 0) and (science['wind'][0] == 0) and (points_val >= science['wind'][1]):
		science['wind'][0] = 1
		_acquireAssets(science['wind'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Windtech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Windtech2").set_opacity(1)
		get_node("menu_popup/open_research/Research_popup/Windtech3").set_opacity(1)
	print(science['wind'][0])


func _on_Windtech2_pressed():
	if (actions > 0) and (science['wind'][0] == 1) and (points_val >= 2 * science['wind'][1]):
		science['wind'][0] = 2
		_acquireAssets(science['wind'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Windtech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Windtech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Windtech3").set_opacity(1)
	print(science['wind'][0])


func _on_Windtech3_pressed():
	if (actions > 0) and (science['wind'][0] == 2)  and (points_val >= 3 * science['wind'][1]):
		science['wind'][0] = 3
		_acquireAssets(science['wind'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Windtech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Windtech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Windtech3").set_opacity(0.2)
	print(science['wind'][0])


func _on_Nucleartech1_pressed():
	if (actions > 0) and (science['nuclear'][0] == 0) and (points_val >= science['nuclear'][1]):
		science['nuclear'][0] = 1
		_acquireAssets(science['nuclear'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Nucleartech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Nucleartech2").set_opacity(1)
		get_node("menu_popup/open_research/Research_popup/Nucleartech3").set_opacity(1)
	print(science['nuclear'][0])


func _on_Nucleartech2_pressed():
	if (actions > 0) and (science['nuclear'][0] == 1) and (points_val >= 2 * science['nuclear'][1]):
		science['nuclear'][0] = 2
		_acquireAssets(science['nuclear'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Nucleartech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Nucleartech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Nucleartech3").set_opacity(1)
	print(science['nuclear'][0])


func _on_Nucleartech3_pressed():
	if (actions > 0) and (science['nuclear'][0] == 2) and (points_val >= 3 * science['nuclear'][1]):
		science['nuclear'][0] = 3
		_acquireAssets(science['nuclear'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Nucleartech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Nucleartech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Nucleartech3").set_opacity(0.2)
	print(science['nuclear'][0])


func _on_Fossiltech1_pressed():
	if (actions > 0) and (science['fossil'][0] == 0) and (points_val >= science['fossil'][1]):
		science['fossil'][0] = 1
		_acquireAssets(science['fossil'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Fossiltech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Fossiltech2").set_opacity(1)
		get_node("menu_popup/open_research/Research_popup/Fossiltech3").set_opacity(1)
	print(science['fossil'][0])


func _on_Fossiltech2_pressed():
	if (actions > 0) and (science['fossil'][0] == 1) and (points_val >= 2 * science['fossil'][1]):
		science['fossil'][0] = 2
		_acquireAssets(science['fossil'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Fossiltech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Fossiltech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Fossiltech3").set_opacity(1)
	print(science['fossil'][0])


func _on_Fossiltech3_pressed():
	if (actions > 0) and (science['fossil'][0] == 2) and (points_val >= 3 * science['fossil'][1]):
		science['fossil'][0] = 3
		_acquireAssets(science['fossil'])
		compute_action()
		get_node("menu_popup/open_research/Research_popup/Fossiltech1").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Fossiltech2").set_opacity(0.2)
		get_node("menu_popup/open_research/Research_popup/Fossiltech3").set_opacity(0.2)
	print(science['fossil'][0])
	

# Law buttons 
func _on_open_politics_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_politics/Politics_popup").popup()
	#get_node("menu_popup/open_politics/Politics_popup").set_exclusive(true)

func _on_close_politics_pressed():
	get_node("menu_popup/open_politics/Politics_popup").hide()
	_on_open_menu_pressed()

func _on_forestry_pressed():
	if (actions > 0) and (law['forest'][0] == 0) and (points_val >= law['forest'][1]):
		law['forest'][0] = 1
		_acquireAssets(law['forest'])
		compute_action()
		get_node("menu_popup/open_politics/Politics_popup/forestry").set_opacity(0.2)
	print(law['forest'][0])
		
func _on_ecars_pressed():
	if (actions > 0) and (law['ecars'][0] == 0) and (points_val >= law['ecars'][1]):
		law['ecars'][0] = 1
		_acquireAssets(law['ecars'])
		compute_action()
		get_node("menu_popup/open_politics/Politics_popup/ecars").set_opacity(0.2)
	print(law['ecars'][0])

func _on_dtax_pressed():
	if (actions > 0) and (law['dtax'][0] == 0) and (points_val >= law['dtax'][1]):
		law['dtax'][0] = 1
		_acquireAssets(law['dtax'])
		compute_action()
		get_node("menu_popup/open_politics/Politics_popup/dtax").set_opacity(0.2)
	print(law['dtax'][0])
	
func _on_itax_pressed():
	if (actions > 0) and (law['itax'][0] == 0) and (points_val >= law['itax'][1]):
		law['itax'][0] = 1
		_acquireAssets(law['itax'])
		compute_action()
		get_node("menu_popup/open_politics/Politics_popup/itax").set_opacity(0.2)
	print(law['itax'][0])
	
# Energy buttons
func _on_open_facilities_pressed():
	_on_close_menu_pressed()
	get_node("menu_popup/open_facilities/Facilities_popup").popup()
	#get_node("menu_popup/open_facilities/Facilities_popup").set_exclusive(true)

func _on_close_facilities_pressed():
	get_node("menu_popup/open_facilities/Facilities_popup").hide()
	_on_open_menu_pressed()


func _on_Coal1_pressed():
	if (actions > 0) and (energy['coal'][0] == 0 or energy['coal'][0] == 2) and (points_val >= energy['coal'][1]):
		energy['coal'][0] = 1
		_acquireAssets(energy['coal'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Coal1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_opacity(1)
	print(energy['coal'][0])

func _on_Coal2_pressed():
	if (actions > 0) and (energy['coal'][0] == 1 or energy['coal'][0] == 3) and (points_val >= 2 * energy['coal'][1]):
		energy['coal'][0] = 2
		_acquireAssets(energy['coal'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Coal1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_opacity(1)
	print(energy['coal'][0])

func _on_Coal3_pressed():
	if (actions > 0) and (energy['coal'][0] == 2) and (points_val >= 3 * energy['coal'][1]):
		energy['coal'][0] = 3
		_acquireAssets(energy['coal'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Coal1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Coal3").set_opacity(0.2)
	print(energy['coal'][0])

func _on_Gas1_pressed():
	if (actions > 0) and (energy['gas'][0] == 0 or energy['gas'][0] == 2) and (points_val >= energy['gas'][1]):
		energy['gas'][0] = 1
		_acquireAssets(energy['gas'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Gas1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_opacity(1)
	print(energy['gas'][0])

func _on_Gas2_pressed():
	if (actions > 0) and (energy['gas'][1] == 0 or energy['gas'][0] == 3) and (points_val >= 2 * energy['gas'][1]):
		energy['gas'][0] = 2
		_acquireAssets(energy['gas'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Gas1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_opacity(1)
	print(energy['gas'][0])

func _on_Gas3_pressed():
	if (actions > 0) and (energy['gas'][0] == 2) and (points_val >= 3 * energy['gas'][1]):
		energy['gas'][0] = 3
		_acquireAssets(energy['gas'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Gas1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Gas3").set_opacity(0.2)
	print(energy['gas'][0])

func _on_Solar1_pressed():
	if (actions > 0) and (energy['solar'][0] == 0 or energy['solar'][0] == 2) and (points_val >= energy['solar'][1]):
		energy['solar'][0] = 1
		_acquireAssets(energy['solar'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Solar1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar3").set_opacity(1)
	print(energy['solar'][0])

func _on_Solar2_pressed():
	if (actions > 0) and (energy['solar'][0] == 1 or energy['solar'][0] == 3) and (points_val >= 2 * energy['solar'][1]):
		energy['solar'][0] = 2
		_acquireAssets(energy['solar'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Solar1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar3").set_opacity(1)
	print(energy['solar'][0])

func _on_Solar3_pressed():
	if (actions > 0) and (energy['solar'][0] == 2) and (points_val >= 3 * energy['solar'][1]):
		energy['solar'][0] = 3
		_acquireAssets(energy['solar'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Solar1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Solar3").set_opacity(0.2)
	print(energy['solar'][0])

func _on_Nuclear1_pressed():
	if (actions > 0) and (energy['nuclear'][0] == 0 or energy['nuclear'][0] == 2) and (points_val >= energy['nuclear'][1]):
		energy['nuclear'][0] = 1
		_acquireAssets(energy['nuclear'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear3").set_opacity(1)
	print(energy['nuclear'][0])

func _on_Nuclear2_pressed():
	if (actions > 0) and (energy['nuclear'][0] == 1 or energy['nuclear'][0] == 3) and (points_val >= 2 * energy['nuclear'][1]):
		energy['nuclear'][0] = 2
		_acquireAssets(energy['nuclear'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear3").set_opacity(1)
	print(energy['nuclear'][0])

func _on_Nuclear3_pressed():
	if (actions > 0) and (energy['nuclear'][0] == 2) and (points_val >= 3 * energy['nuclear'][1]):
		energy['nuclear'][0] = 3
		_acquireAssets(energy['nuclear'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Nuclear3").set_opacity(0.2)
	print(energy['nuclear'][0])

func _on_Wind1_pressed():
	print("miu")
	if (actions > 0) and (energy['wind'][0] == 0 or energy['wind'][0] == 2) and (points_val >= energy['wind'][1]):
		energy['wind'][0] = 1
		_acquireAssets(energy['wind'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Wind1").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind3").set_opacity(1)
	print(energy['wind'][0])

func _on_Wind2_pressed():
	if (actions > 0) and (energy['wind'][0] == 1 or energy['wind'][0] == 3) and (points_val >= 2 * energy['wind'][1]):
		energy['wind'][0] = 2
		_acquireAssets(energy['wind'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Wind1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind2").set_opacity(0.2)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind3").set_opacity(1)
	print(energy['wind'][0])

func _on_Wind3_pressed():
	if (actions > 0) and (energy['wind'][0] == 2) and (points_val >= 3 * energy['wind'][1]):
		energy['wind'][0] = 3
		_acquireAssets(energy['wind'])
		compute_action()
		get_node("menu_popup/open_facilities/Facilities_popup/Wind1").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind2").set_opacity(1)
		get_node("menu_popup/open_facilities/Facilities_popup/Wind3").set_opacity(0.2)
	print(energy['wind'][0]) 
