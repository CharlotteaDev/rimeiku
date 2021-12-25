extends Area2D

onready var actor_mario = $"/root/StardustFields2/Mario"
onready var actor_mario_kine = $"/root/StardustFields2/Mario/ActorM"
onready var fade_animation : AnimationPlayer = $"/root/StardustFields2/Fade/ColorRect/AnimationPlayer"

onready var area_entered = false

func _on_stardust_fields_1_body_entered(body):
	area_entered = true
	actor_mario.visible = false
	GlobalSingleton.area_exit_direction = "up"

func _process(delta):
	if area_entered == true:
		GlobalSingleton.new_area_entered = true
		GlobalSingleton.current_area = "StardustFields1"
		actor_mario_kine.movement_disabled = true
		fade_animation.play("fade_out")
		yield(get_tree().create_timer(0.5), "timeout")
		area_entered = false
		get_tree().change_scene("./scenes/stardust_fields_1/stardust_fields_1.tscn")
