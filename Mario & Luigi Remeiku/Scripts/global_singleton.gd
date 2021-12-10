extends Node2D

# TITLE SCREEN VARIABLES
onready var disabled_other_b = false

# OVERWORLD VARIABLES

# DEBUG VARIABLES
onready var debug_active = false
onready var is_drag = false

# MISC
func _process(delta):
	if Input.is_action_just_released("debug toggle"):
		GlobalSingleton.debug_active = !GlobalSingleton.debug_active
