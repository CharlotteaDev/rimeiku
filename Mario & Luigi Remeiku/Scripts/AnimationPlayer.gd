extends AnimationPlayer

var currentAnimation = "start"

func _on_BlockAnimationPlayer_animation_finished(start):
	var currentAnimation = "idle"
	print(currentAnimation)
	#just for me to see if it's actually loading correctly
	if currentAnimation == "idle":
		play("IdleSouth")
	#plays the idle animation after the start animation
	
