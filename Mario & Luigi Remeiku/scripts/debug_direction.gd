extends Label

onready var actor_mario_kine = $"../../../ActorM"

func _process(delta):
	text = actor_mario_kine.facing_direction
