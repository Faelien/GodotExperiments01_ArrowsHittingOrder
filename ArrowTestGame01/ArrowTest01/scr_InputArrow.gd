extends Node2D


func _ready():
	pass
	$SpriteArrow.hide()

# warning-ignore:unused_argument
func _unhandled_input(event):
	if Input.is_action_pressed("ui_up"):
		$SpriteArrow.show()
		$SpriteArrow.rotation_degrees = 0
	if Input.is_action_pressed("ui_down"):
		$SpriteArrow.rotation_degrees = 180
	if Input.is_action_pressed("ui_right"):
		$SpriteArrow.rotation_degrees = 90
	if Input.is_action_pressed("ui_left"):
		$SpriteArrow.rotation_degrees = -90
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left"):
		$SpriteArrow.rotation_degrees = -45
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right"):
		$SpriteArrow.rotation_degrees = 45
	if Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left"):
		$SpriteArrow.rotation_degrees = -140
	if Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right"):
		$SpriteArrow.rotation_degrees = 140
