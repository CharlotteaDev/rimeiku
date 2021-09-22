extends AnimationPlayer

onready var ManimationPlayer : AnimationPlayer = get_node("../AnimationPlayer")
onready var delayTimer = 1.2

func _ready():
	yield(get_tree().create_timer(delayTimer), "timeout")

func _input(event):
	if event.is_action_pressed("A"):
		ManimationPlayer.play("jump")
