extends ColorRect

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	visible = false
