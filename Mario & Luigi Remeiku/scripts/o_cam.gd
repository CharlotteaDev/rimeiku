extends Camera2D

onready var mario = get_node("../Mario")

func _ready():
	current = true

func _process(_delta):
	position.x = mario.position.x
	position.y = mario.position.y
