extends Node2D

onready var actor_mario = get_node("/root/"+str(GlobalSingleton.current_area)+"/Mario")
onready var actor_mario_kine = get_node("/root/"+str(GlobalSingleton.current_area)+"/Mario/ActorM")

onready var sprite = $PuppetMario

func _ready():
	visible = false

func _process(delta):
	if GlobalSingleton.new_area_entered == true:
		visible = true
		sprite.animation = ("move_"+str(GlobalSingleton.area_exit_direction))
		sprite.playing = true
		if GlobalSingleton.area_exit_direction == "down":
			position.y += 6
		if GlobalSingleton.area_exit_direction == "up":
			position.y -= 6
		sprite.speed_scale = 6
	else:
		visible = false
		position.x = actor_mario_kine.position.x * 2 # Times two to matchup with Mario's scaled movement
		position.y = actor_mario_kine.position.y * 2 # Times two to matchup with Mario's scaled movement
