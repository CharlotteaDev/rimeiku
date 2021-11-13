extends Sprite

#CHARLOTTE WHAT IS THIS CRAPPY CODE BRUH REDO IT

##HP numbers nodes
#onready var xxoBP = get_node("./001S")
#onready var xoxBP = get_node("./010S")
#onready var oxxBP = get_node("./100S")
#
##HP numbers values/current frame
#onready var x1bp = xxoBP.frame
#onready var x2bp = xoxBP.frame
#onready var x3bp = oxxBP.frame
#
#var totBP = int()
#
#var delayTimer = 1.3
#
#func _ready():
#
#	xxoBP.set_animation("R")
#	xoxBP.set_animation("R")
#	oxxBP.set_animation("R")
#
#	xxoBP.set_frame(4)
#	xoxBP.set_frame(1)
#	oxxBP.set_frame(0)
#
#	var totBP = int(str(x3bp) + str(x2bp) + str(x1bp))
#
#	if Input.is_action_pressed("X"):
#		xxoBP.set_frame(x1bp + 1)
#
#	#For making numbers disappear when they've reached 0, but not removing them when they're at 10 for example.
#	if oxxBP.frame == 0:
#		oxxBP.visible = false
#	elif xoxBP.frame == 0:
#		xoxBP.visible = false
#	elif xxoBP.frame == 0:
#		xxoBP.visible = false
#
#func _on_001S_frame_changed():
#
#	#For making numbers disappear when they've reached 0, but not removing them when they're at 10 for example.
#	if oxxBP.frame == 0:
#		oxxBP.visible = false
#	elif xoxBP.frame == 0:
#		xoxBP.visible = false
#	elif xxoBP.frame == 0:
#		xxoBP.visible = false
#
#	#For me to see the value for stuff is working
#	yield(get_tree().create_timer(delayTimer), "timeout")
#
#	print(totBP, "BP")
#	print(x1bp, "BP1")
#	print(x2bp, "BP2")
#	print(x3bp, "BP3")
