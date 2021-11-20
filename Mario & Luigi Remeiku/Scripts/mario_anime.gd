extends AnimationPlayer

onready var mario = get_parent()
onready var state = "your_turn"
onready var jump_excel = 0
onready var jump_strgt = 20
onready var gravity = 0
onready var delay_timer_disable = 3.7
onready var delay_timer_jumpcool = 0.5
onready var disabled = true

func _ready():
	yield(get_tree().create_timer(delay_timer_disable), "timeout")
	disabled = false

func _input(event):
	if event.is_action_pressed("A") && !disabled:
		mario.animation = "jump"
		mario.move_local_y(-jump_strgt)
		state = "jump"
		print("jumped")

# Dev notes

# I WAS WRONGGGGGGG, there actually isn't a difference between the jumping and falling
# No acceleration/decceletation (in animation) it looks like
# Don't forget dust particles soon
