extends Node2D

onready var nodeArrow := get_node("N2Dmod/AnimSprArrow")
onready var nodeButtonWhole := get_node("N2Dmod")

var numArrow
var ButtonPressed = false
var pressedCorrectButton = false

func _ready():
	func_setUpArrow()

func func_setUpArrow():
	nodeArrow.hide()
	func_set_randomNumber()
	func_show_correctArrow()
	nodeArrow.show()
	ButtonPressed = false

func _unhandled_input(event):
	if !ButtonPressed:
		if Input.is_action_pressed("ui_up"):
			func_check_CorrectButtonpress(1)
		if Input.is_action_pressed("ui_down"):
			func_check_CorrectButtonpress(2)
		if Input.is_action_pressed("ui_right"):
			func_check_CorrectButtonpress(3)
		if Input.is_action_pressed("ui_left"):
			func_check_CorrectButtonpress(4)
		if Input.is_action_pressed("ui_end"):
			print (event)

func func_set_reset():
	nodeArrow.hide()
	func_set_randomNumber()

func func_set_randomNumber():
	var random = RandomNumberGenerator.new()
	random.randomize()
	numArrow = random.randi_range(1, 4)
#	print ("Arrow input: ", numArrow)

func func_show_correctArrow():
	nodeButtonWhole.modulate = Color("#FFFFFF")
	match (numArrow):
		1:
			nodeArrow.play("ArrUpN")
			pass
		2:
			nodeArrow.play("ArrDownS")
			pass
		3:
			nodeArrow.play("ArrRightF")
			pass
		4:
			nodeArrow.play("ArrLeftW")
			pass
		_:
			print("Match case default choice!")

func func_check_CorrectButtonpress(var buttonPressed):
	ButtonPressed = true
	if (buttonPressed == numArrow):
		nodeButtonWhole.modulate = Color("#4cc8f8")
	else: nodeButtonWhole.modulate = Color("#000000")
	pass

#---- Connections

func _on_Button_pressed():
	func_setUpArrow()
