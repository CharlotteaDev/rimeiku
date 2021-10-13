extends AnimationPlayer

onready var ManimationPlayer : AnimationPlayer = get_node("../AnimationPlayer")
onready var Mario = get_node("./Mario")

onready var delayTimerDisable = 3.7
onready var delayTimerJumpcool = 0.5
onready var disabled = true
onready var stateMachine = "yourTurn"

func _ready():
	yield(get_tree().create_timer(delayTimerDisable), "timeout")
	disabled = false
	Mario.frames

func _input(event):
	if event.is_action_pressed("A") and !disabled:
	
		print("jumped")
