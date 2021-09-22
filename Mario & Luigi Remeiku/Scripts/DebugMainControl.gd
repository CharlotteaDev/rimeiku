extends Sprite

func _ready():
	visible = false

func _input(event):
	#toggling for debug visiblity with "tab"
	if event.is_action_pressed("tab"):
		visible = !visible
