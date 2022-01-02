extends Label

onready var actor_mario_kine = $"../../../ActorM"

func _process(delta):
	text = str(actor_mario_kine.movement_disabled)
