extends Sprite

onready var pos = 1

func _ready():
	if Input.is_action_pressed("right"):
		print("right")
