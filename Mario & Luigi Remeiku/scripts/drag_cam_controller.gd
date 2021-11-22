extends Camera2D

func _ready():
	if GlobalSingleton.is_drag == true:
		current = true
	else:
		current = false
