extends Node2D

onready var animation_player : AnimationPlayer = $AnimationPlayer

onready var moving_timer = 0
onready var hidden = false

func _process(delta):
	if (
Input.is_action_pressed("left") or
Input.is_action_pressed("right") or
Input.is_action_pressed("up") or
Input.is_action_pressed("down")
):
		moving_timer += 1
		if moving_timer == 18:
			moving_timer = 18
			hidden = true
			animation_player.play("hide")
	else:
		moving_timer = 0
		if hidden == true:
			hidden = false
			yield(get_tree().create_timer(0.3), "timeout")
			animation_player.queue("unhide")
