extends Control

onready var nodeArrow := get_node("N2Dmod/AnimSprArrow")
onready var nodeButtonWhole := get_node("N2Dmod")

var numArrow
var ButtonPressed = false
var pressedCorrectButton = false

func _ready():
#	func_setUpArrow(1)
	pass

func func_setUpArrow(number: int):
#	nodeArrow.hide()
	ButtonPressed = false
	if number == 0:
#		print ("Setting up random arrow image")
		func_show_correctArrow(func_set_randomNumber())
	if number <= 4 && number >= 1:
#		print ("Setting up arrow image ", number)
		func_show_correctArrow(number)
#	nodeArrow.show()

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

func func_set_randomNumber():
	var random = RandomNumberGenerator.new()
	random.randomize()
	numArrow = random.randi_range(1, 4)
#	print ("Arrow input: ", numArrow)
	return numArrow

func func_show_correctArrow(number : int):
#	print ("Number in Arrow display = ", number)
	nodeButtonWhole.modulate = Color("#FFFFFF")
	match (number):
		1:
			nodeArrow.play("ArrUpN")
#			print ("Arrow 1 display")
		2:
			nodeArrow.play("ArrDownS")
#			print ("Arrow 2 display")
		3:
			nodeArrow.play("ArrRightF")
#			print ("Arrow 3 display")
		4:
			nodeArrow.play("ArrLeftW")
#			print ("Arrow 4 display")
		_:
			print("Match case default choice!")
#	print ("Dispalyed this arrrow going on to the nextttt")

func func_check_CorrectButtonpress(var buttonPressed):
	ButtonPressed = true
	if (buttonPressed == numArrow):
		nodeButtonWhole.modulate = Color("#4cc8f8")
	else: nodeButtonWhole.modulate = Color("#000000")
	pass

#----------------

func testGreeting(value) -> void:
	print ("Successful test. Accessed arrow function. Test greeting, hi! I am test greeting number - - - ", value)
	func_setUpArrow(value)

#---- Connections

func _on_GridSpawn2_sig_arrowValue(value):
	print ("Signal received", value)
