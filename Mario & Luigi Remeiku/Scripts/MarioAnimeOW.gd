extends KinematicBody2D

onready var facingDirection = "south"
onready var stateMachine = "idle"
onready var sprite : AnimatedSprite = $Mario

func _ready():
	sprite.speed_scale = 2

func  _input(event):
	if Input.is_action_pressed("down"):
		sprite.play("moveSouth")
		sprite.speed_scale = 6
		print("moving south")
	else:
		sprite.play("idle")
		sprite.speed_scale = 2
		print("idle")
