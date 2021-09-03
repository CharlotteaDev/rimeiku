extends Sprite

#HP numbers nodes
onready var xxoHP = get_node("./001H")
onready var xoxHP = get_node("./010H")
onready var oxxHP = get_node("./100H")

#HP numbers values/current frame
onready var x1 = xxoHP.frame
onready var x2 = xoxHP.frame
onready var x3 = oxxHP.frame

var totHP = int()

func _ready():

	xxoHP.set_animation("N")
	xoxHP.set_animation("N")
	oxxHP.set_animation("N")

	xxoHP.set_frame(5)
	xoxHP.set_frame(1)
	oxxHP.set_frame(0)
	
# warning-ignore:unused_variable
# warning-ignore:unused_variable
	var totHP = int(str(x3) + str(x2) + str(x1))
	
	if Input.is_action_pressed("A"):
		xxoHP.set_frame(x1 + 5)

	#For making numbers disappear when they've reached 0, but not removing them when they're at 10 for example.
	if oxxHP.frame == 0:
		oxxHP.visible = false
	elif xoxHP.frame == 0:
		xoxHP.visible = false
	elif xxoHP.frame == 0:
		xxoHP.visible = false

func _on_001H_frame_changed():

	#For making numbers disappear when they've reached 0, but not removing them when they're at 10 for example.
	if oxxHP.frame == 0:
		oxxHP.visible = false
	elif xoxHP.frame == 0:
		xoxHP.visible = false
	elif xxoHP.frame == 0:
		xxoHP.visible = false

	#For me to see the value for stuff is working
	print(totHP)
	print(x1)
	print(x2)
	print(x3)
