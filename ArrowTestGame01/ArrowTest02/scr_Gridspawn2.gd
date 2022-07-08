extends Control

export var numOfArrows : int
export(String, FILE) var nodePrompt_path

onready var nGridCont := get_node("CenterContainer/GridContainer")
var scene_instance_Prompt = preload("res://ArrowTest02/ArrowPrompted2.tscn")

export var arrayEnemy01 = [1, 2, 3, 4] #needs to be 1 - 4 or error
var setup_array = [1, 2, 3, 0, 1, 1, 1, 1, 0, 0, 2, 2] #0 - Random, 1 Up, 2 Down, 3 right, 4 left

signal sig_arrowValue(value)
var number = 3

func _ready():
	_func_arrowSetup()

#	print("Child Count of monte christo: ", nGridCont.get_child_count() -1)

var cursor_index : int = 0

#--------------


func get_current_item_at_index(index : int) -> Control:
	return nGridCont.get_child(index) as Control

#-----------------

func _func_arrowSetup():
	var setup_index = 0
	
	for child in nGridCont.get_children(): #Spring lceaning <3
		child.queue_free()
	
	for i in range(0, numOfArrows, +1):
		var instance = scene_instance_Prompt.instance()
		nGridCont.add_child(instance)
		
		var current_child := get_current_item_at_index(setup_index +numOfArrows)
		if current_child != null:
			if current_child.has_method("testGreeting"):
				current_child.testGreeting(setup_array[setup_index])
		setup_index += 1

#-----------------
func _on_Button_pressed():
	_func_arrowSetup()
