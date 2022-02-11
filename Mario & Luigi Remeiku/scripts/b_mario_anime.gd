extends AnimatedSprite

onready var state = "your_turn"
onready var disabled = true

func _ready():
	yield(get_tree().create_timer(3.7), "timeout")
	disabled = false

func _input(event):
	if event.is_action_pressed("A") && !disabled:
		pass
