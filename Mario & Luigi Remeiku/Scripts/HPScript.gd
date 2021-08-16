extends Sprite

var totHP = 195

export var xxoHP_path : NodePath
export var xoxHP_path : NodePath
export var oxxHP_path : NodePath

onready var xxoHP = get_node(xxoHP_path)
onready var xoxHP = get_node(xoxHP_path)
onready var oxxHP = get_node(oxxHP_path)

func _ready(): 

	xxoHP.set_animation("K")
	xoxHP.set_animation("K")
	oxxHP.set_animation("K")

	xxoHP.set_frame(5)
	xoxHP.set_frame(9)
	oxxHP.set_frame(1)
