extends Area2D

onready var animation_player = get_node("../AnimationPlayer")
onready var mario = get_node(".../Mario")

func _on_Area2D_body_entered(body: Node2D):
	animation_player.play("jitter")
