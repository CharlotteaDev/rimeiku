extends AnimatedSprite

onready var facingDirection = "south"
onready var stateMachine = "idle"

func _ready():
	speed_scale = 3

func  _input(event):
	if event.is_action_pressed("down"):
		animation = "moveSouth"
		speed_scale = 20
	else:
		animation = "idle"
		speed_scale = 3
