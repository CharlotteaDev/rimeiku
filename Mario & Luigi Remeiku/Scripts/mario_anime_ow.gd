extends KinematicBody2D

onready var facingDirection = ""
onready var stateMachine = ""
onready var sprite : AnimatedSprite = $Mario
onready var spriteFrame = 24.0/60.0
export var speed = 300
var direction = Vector2()

func _ready():
	sprite.playing = false
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

	if Input.is_action_pressed("A"):
		direction.y -= 10

	match direction:
		Vector2(-1,-1):
			sprite.animation = "moveWestNorth"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "WestNorth"
			sprite.speed_scale = 6
		Vector2(-1,0):
			sprite.animation = "moveWest"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "West"
			sprite.speed_scale = 6
		Vector2(-1,1):
			sprite.animation = "moveSouthWest"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "SouthWest"
			sprite.speed_scale = 6
		Vector2(1,-1):
			sprite.animation = "moveNorthEast"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "NorthEast"
		Vector2(1,0):
			sprite.animation = "moveEast"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "East"
			sprite.speed_scale = 6
		Vector2(1,1):
			sprite.animation = "moveEastSouth"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "EastSouth"
			sprite.speed_scale = 6
		Vector2(0,-1):
			sprite.animation = "moveNorth"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "North"
			sprite.speed_scale = 6
		Vector2(0,1):
			sprite.animation = "moveSouth"
			sprite.frame = (int(spriteFrame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facingDirection = "South"
			sprite.speed_scale = 6
		Vector2(0,0):
			sprite.animation = ("idle"+str(facingDirection))
			sprite.playing = true
			sprite.speed_scale = 3

	direction = direction.normalized() * speed

func _physics_process(_delta):
	get_input()
	direction = move_and_slide(direction)
	
func _process(_delta):
	spriteFrame += 24.0/60.0
