extends Label

onready var actor_mario_anime = $"../../../ActorM/Mario"

func _process(delta):
	text = str(actor_mario_anime.speed_scale)
