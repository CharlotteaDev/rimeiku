extends Sprite

func _ready():
	$Label.visible = false
	visible = false
	yield(get_tree().create_timer(2), "timeout")
	visible = true
	$AnimationPlayer.play("appear")
	yield(get_tree().create_timer(0.25), "timeout")
	$Label.visible = true
