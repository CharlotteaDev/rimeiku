extends Node2D

func _ready():
	visible = false
	if GlobalSingleton.debug_active == true:
		visible = true
	else:
		visible = false

func _process(delta):
	if Input.is_action_just_released("debug toggle"):
		visible = !visible
