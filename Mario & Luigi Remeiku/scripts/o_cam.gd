extends Camera2D

onready var mario = get_parent()

func _ready():
	current = true

func _process(_delta):
	position.x = mario.kinemario.position.x
	position.y = mario.kinemario.position.y
