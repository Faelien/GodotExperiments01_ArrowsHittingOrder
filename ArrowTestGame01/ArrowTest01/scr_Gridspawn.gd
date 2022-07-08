extends Control

export var numOfArrows : int
export(String, FILE) var nodePrompt_path

onready var nGridCont := get_node("GridContainer")

var scene_instance_Prompt = preload("res://ArrowTest01/scn_turningpromptintocontrol.tscn")

export var arrayEnemy01 = [1, 2, 3, 4] #needs to be 1 - 4 or error

func _ready():
	_func_arrowSetup()

#-----------------

func _func_arrowSetup():
	for child in nGridCont.get_children():
		child.queue_free()
	
	for i in range(numOfArrows, 0, -1):
		var instance = scene_instance_Prompt.instance()
		nGridCont.add_child(instance)

#-----------------
func _on_Button_pressed():
	_func_arrowSetup()
