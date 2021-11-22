extends Camera2D

func _ready():
	if $Mario.is_drag == true:
		current = true
	else:
		current = false
