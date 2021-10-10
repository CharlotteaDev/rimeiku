extends AnimationPlayer

onready var ManimationPlayer : AnimationPlayer = get_node("../AnimationPlayer")
onready var delayTimer = 3.7
onready var disabled = true

func _ready():
	yield(get_tree().create_timer(delayTimer), "timeout")
	disabled = false

func _input(event):
	if event.is_action_pressed("A") and !disabled:
		ManimationPlayer.play("jump")
		print("jumped")
