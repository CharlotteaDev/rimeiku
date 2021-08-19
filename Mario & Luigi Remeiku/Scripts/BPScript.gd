extends Sprite

var totSP = 14

#HP numbers nodes
onready var xxoSP = get_node("./001S")
onready var xoxSP = get_node("./010S")
onready var oxxSP = get_node("./100S")

#HP numbers values/current frame
onready var x1 = xxoSP.frame
onready var x2 = xoxSP.frame
onready var x3 = oxxSP.frame

func _ready():

	xxoSP.set_animation("R")
	xoxSP.set_animation("R")
	oxxSP.set_animation("R")

	xxoSP.set_frame(4)
	xoxSP.set_frame(1)
	oxxSP.set_frame(0)

	#For making numbers disappear when they've reached 0, but not removing them when they're at 10 for example.
	if oxxSP.frame == 0:
		oxxSP.visible = false
	elif xoxSP.frame == 0:
		xoxSP.visible = false
	elif xxoSP.frame == 0:
		xxoSP.visible = false

	#For me to see the value for stuff is working
	print(totSP)
	print(x1)
	print(x2)
	print(x3)
