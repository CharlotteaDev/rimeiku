extends KinematicBody2D

onready var facingDirection = "south"
onready var stateMachine = "idle"
onready var sprite : AnimatedSprite = $Mario

func _ready():
	if stateMachine == "idle":
		sprite.speed_scale = 2
		sprite.play("idle")
	if stateMachine == "movingS":
		sprite.speed_scale = 6
		sprite.play("moveSouth")


func  _input(event):
	if Input.is_action_pressed("down") and !Input.is_action_pressed("left"):
		facingDirection = "south"
		stateMachine = "movingS"
		position.x + 1
