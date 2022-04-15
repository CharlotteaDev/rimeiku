#extends Sprite
#
#onready var collision_shape : CollisionShape2D = $Area2D/CollisionShape2D
#
#func _on_Area2D_body_entered(body: KinematicBody2D):
#	GlobalSingleton.height_map_layer = "g2"
#
#func _on_Area2D_body_exited(body: KinematicBody2D):
#	if GlobalSingleton.height_map_layer != "g2":
#		collision_shape.disabled = true
#
#func _process(delta):
#	if GlobalSingleton.height_map_layer == "g2":
#		visible = true
#	else:
#		visible = false
