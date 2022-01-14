extends Sprite

onready var collision_poly : CollisionPolygon2D = $Area2D/CollisionPolygon2D

func _on_Area2D_body_entered(body: KinematicBody2D):
	GlobalSingleton.height_map_layer = "g1"

func _on_Area2D_body_exited(body: KinematicBody2D):
	if GlobalSingleton.height_map_layer != "g1":
		collision_poly.disabled = true

func _process(delta):
	if GlobalSingleton.height_map_layer == "g1":
		visible = true
	else:
		visible = false
