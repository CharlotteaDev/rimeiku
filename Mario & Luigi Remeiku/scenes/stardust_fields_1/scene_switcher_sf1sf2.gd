extends Area2D

onready var actor_mario = $"/root/StardustFields1/Mario"
onready var actor_mario_kine = $"/root/StardustFields1/Mario/ActorM"
onready var fade_rect = $"/root/StardustFields1/Fade/ColorRect"
onready var fade_animation : AnimationPlayer = $"/root/StardustFields1/Fade/ColorRect/AnimationPlayer"

onready var area_entered = false

func _on_stardust_fields_2_body_entered(body):
	print("new area entered")
	area_entered = true
	actor_mario.visible = false
	fade_rect.visible = true
	GlobalSingleton.area_exit_direction = "down"

func _process(delta):
	if area_entered == true:
		GlobalSingleton.new_area_entered = true
		GlobalSingleton.current_area = "StardustFields2"
		actor_mario_kine.movement_disabled = true
		fade_animation.play("fade_out")
		yield(get_tree().create_timer(0.5), "timeout")
		area_entered = false
		get_tree().change_scene("./scenes/stardust_fields_2/stardust_fields_2.tscn")
