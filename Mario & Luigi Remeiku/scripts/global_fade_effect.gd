extends Node2D

onready var animation_player = get_node("ColorRect/AnimationPlayer")

func _process(delta):
	if GlobalSingleton.new_area_entered == true:
		animation_player.play("fade_out")
