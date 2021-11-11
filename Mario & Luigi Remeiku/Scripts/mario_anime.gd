extends AnimationPlayer

onready var Mario = get_parent()
onready var stateMachine = "yourTurn"

onready var jumpExcel = 0
onready var jumpStrgt = 20
onready var Gravity = 0
#super mario galaxy

onready var delayTimerDisable = 3.7
onready var delayTimerJumpcool = 0.5
onready var disabled = true

func _ready():
	yield(get_tree().create_timer(delayTimerDisable), "timeout")
	disabled = false

func _input(event):
	if event.is_action_pressed("A"):# and !disabled:
		Mario.animation = "jump"
		Mario.move_local_y(-jumpStrgt)
		
		
		
		stateMachine = "jump"
		print("jumped")


#Dev notes

#I WAS WRONGGGGGGG, there actually isn't a difference between the jumping and falling
#No excelleration it looks like
#Shit weird yo!

#Don't forget dust particles soon
