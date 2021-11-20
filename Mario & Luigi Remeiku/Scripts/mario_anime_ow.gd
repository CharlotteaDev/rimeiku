extends KinematicBody2D

var direction = Vector2()
export var speed = 300
onready var facing_direction = "down"
onready var state = "idle"
onready var sprite : AnimatedSprite = $Mario
onready var sprite_frame = 24.0/60.0

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
			sprite.animation = "move_left_up"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "left_up"
			sprite.speed_scale = 6
		Vector2(-1,0):
			sprite.animation = "move_left"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "left"
			sprite.speed_scale = 6
		Vector2(-1,1):
			sprite.animation = "move_down_left"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "down_left"
			sprite.speed_scale = 6
		Vector2(1,-1):
			sprite.animation = "move_up_right"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "up_right"
		Vector2(1,0):
			sprite.animation = "move_right"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "right"
			sprite.speed_scale = 6
		Vector2(1,1):
			sprite.animation = "move_right_down"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "right_down"
			sprite.speed_scale = 6
		Vector2(0,-1):
			sprite.animation = "move_up"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "up"
			sprite.speed_scale = 6
		Vector2(0,1):
			sprite.animation = "move_down"
			sprite.frame = (int(sprite_frame) % sprite.frames.get_frame_count(sprite.animation))
			sprite.playing = false
			facing_direction = "down"
			sprite.speed_scale = 6
		Vector2(0,0):
			sprite.animation = ("idle_"+str(facing_direction))
			sprite.playing = true
			sprite.speed_scale = 3

	direction = direction.normalized() * speed

func _physics_process(_delta):
	get_input()
	direction = move_and_slide(direction)
	
func _process(_delta):
	sprite_frame += 24.0/60.0
