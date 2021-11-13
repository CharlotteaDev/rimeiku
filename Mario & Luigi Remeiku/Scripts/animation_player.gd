extends AnimationPlayer

var current_animation_cmd = "start"

func _on_BlockAnimationPlayer_animation_finished(start):
	var current_animation_cmd = "idle"
	if current_animation_cmd == "idle":
		play("IdleSouth")
#redo this entire code when i have to, seriously charlotte wtf did you try doing here
