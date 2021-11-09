extends KinematicBody2D

onready var facingDirection = ""
onready var stateMachine = ""
onready var sprite : AnimatedSprite = $Mario

export var speed = 300
var direction = Vector2()

func _ready():
	sprite.speed_scale = 3

func  get_input():
	direction = Vector2()

	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1 
	if Input.is_action_pressed("down"):
		direction.y += 1 
	if Input.is_action_pressed("up"):
		direction.y -= 1 

	match direction:
		Vector2(-1,-1):
			sprite.animation = "moveWestNorth"
			facingDirection = "WestNorth"
			sprite.speed_scale = 6
		Vector2(-1,0):
			sprite.animation = "moveWest"
			facingDirection = "West"
			sprite.speed_scale = 6
		Vector2(-1,1):
			sprite.animation = "moveSouthWest"
			facingDirection = "SouthWest"
			sprite.speed_scale = 6
		Vector2(1,-1):
			sprite.animation = "moveNorthEast"
			facingDirection = "NorthEast"
			sprite.speed_scale = 6
		Vector2(1,0):
			sprite.animation = "moveEast"
			facingDirection = "East"
			sprite.speed_scale = 6
		Vector2(1,1):
			sprite.animation = "moveEastSouth"
			facingDirection = "EastSouth"
			sprite.speed_scale = 6
		Vector2(0,-1):
			sprite.animation = "moveNorth"
			facingDirection = "North"
			sprite.speed_scale = 6
		Vector2(0,1):
			sprite.animation = "moveSouth"
			facingDirection = "South"
			sprite.speed_scale = 6
		Vector2(0,0):
			sprite.animation = ("idle"+str(facingDirection))
			sprite.speed_scale = 3

	direction = direction.normalized() * speed

func _physics_process(_delta):
	get_input()
	direction = move_and_slide(direction)
