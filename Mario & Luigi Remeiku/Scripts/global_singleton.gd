extends Node2D

# OVERWORLD VARIABLES
onready var current_area = "DebugRoom"
onready var new_area_entered = false
onready var area_exit_direction = "down"
onready var height_map_layer = "undefined"

# DEBUG VARIABLES
onready var debug_active = false
onready var is_dragging = false

# MISC
func _process(delta):
	if Input.is_action_just_released("debug toggle"):
		debug_active = !debug_active

	if new_area_entered == true:
		yield(get_tree().create_timer(0.5), "timeout")
		new_area_entered = false
