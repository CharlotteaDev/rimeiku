extends AnimationPlayer

func _on_ready():
	var current_animation_cmd = "start"

func _on_BlockAnimationPlayer_animation_finished(_start):
	# warning-ignore:shadowed_variable
	var current_animation_cmd = "idle"
	if current_animation_cmd == "idle":
		play("idle_down")
