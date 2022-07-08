extends Node2D

onready var nodeArrow = get_node("N2Dmod/AnimSprArrow")
onready var nodeButtonWhole = get_node("N2Dmod")

func _ready():
	nodeArrow.hide()

func _unhandled_input(event):
	if Input.is_action_pressed("ui_up"):
		nodeArrow.play("ArrUpN")
		nodeButtonWhole.modulate = Color("#ff67b2")
		nodeArrow.show()
	if Input.is_action_pressed("ui_down"):
		nodeArrow.play("ArrDownS")
		nodeButtonWhole.modulate = Color("#4cfbca")
		nodeArrow.show()
	if Input.is_action_pressed("ui_right"):
		nodeArrow.play("ArrRightF")
		nodeButtonWhole.modulate = Color("#4cc8f8")
		nodeArrow.show()
	if Input.is_action_pressed("ui_left"):
		nodeArrow.play("ArrLeftW")
		nodeButtonWhole.modulate = Color("#ffc556")
		nodeArrow.show()
