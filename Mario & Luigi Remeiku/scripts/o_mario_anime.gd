extends KinematicBody2D

# misc variables
var direction = Vector2()

export var speed = 300
onready var facing_direction = "down"
onready var state = "idle"
onready var walk_frame = 24.0/60.0

onready var movement_disabled = false
onready var in_free_fall = false
# reference variables
onready var collision_mario = $CollisionShape2D
onready var sprite : AnimatedSprite = $Mario
# debug variables
var dragging = false
onready var particles_drag = $ParticlesDrag

func _ready():
	particles_drag.emitting = false
	sprite.playing = false
	sprite.speed_scale = 3
	dragging = false

func get_input():
	direction = Vector2()

	if Input.is_action_pressed("right") and !movement_disabled:
		direction.x += 1
	if Input.is_action_pressed("left") and !movement_disabled:
		direction.x -= 1 
	if Input.is_action_pressed("down") and !movement_disabled:
		direction.y += 1 
	if Input.is_action_pressed("up") and !movement_disabled:
		direction.y -= 1 

	if Input.is_action_pressed("A") and !movement_disabled:
		direction.y -= 10

	match direction:
		Vector2(-1,-1):
			if dragging == false:
				sprite.animation = "move_up_left"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "up_left"
				sprite.speed_scale = 6
		Vector2(-1,0):
			if dragging == false:
				sprite.animation = "move_left"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "left"
				sprite.speed_scale = 6
		Vector2(-1,1):
			if dragging == false:
				sprite.animation = "move_down_left"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "down_left"
				sprite.speed_scale = 8
		Vector2(1,-1):
			if dragging == false:
				sprite.animation = "move_up_right"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "up_right"
		Vector2(1,0):
			if dragging == false:
				sprite.animation = "move_right"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "right"
				sprite.speed_scale = 6
		Vector2(1,1):
			if dragging == false:
				sprite.animation = "move_down_right"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "down_right"
				sprite.speed_scale = 6
		Vector2(0,-1):
			if dragging == false:
				sprite.animation = "move_up"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "up"
				sprite.speed_scale = 6
		Vector2(0,1):
			if dragging == false:
				sprite.animation = "move_down"
				sprite.frame = (int(walk_frame) % sprite.frames.get_frame_count(sprite.animation))
				sprite.playing = false
				facing_direction = "down"
				sprite.speed_scale = 6
		Vector2(0,0):
			if dragging == false:
				sprite.animation = ("idle_"+str(facing_direction))
				sprite.playing = true
				sprite.speed_scale = 3

	direction = direction.normalized() * speed

func _input(event):
	if event is InputEventMouseButton && GlobalSingleton.debug_active == true: # DEBUG CODE (Disabled on inactive debug)
		if event.button_index == BUTTON_LEFT && not event.pressed: # DEBUG CODE (Disabled on inactive debug)
			dragging = false # DEBUG CODE (Disabled on inactive debug)


func _physics_process(_delta):
	get_input()

	if dragging == false: # DEBUG CODE (Ignore for regular code)
		particles_drag.emitting = false # DEBUG CODE (Disabled on inactive debug)
		collision_mario.disabled = false # DEBUG CODE (Disabled on inactive debug)
		GlobalSingleton.is_dragging = false # DEBUG CODE (Disabled on inactive debug)
		direction = move_and_slide(direction)
	else: # DEBUG CODE (Disabled on inactive debug)
		GlobalSingleton.is_dragging = true # DEBUG CODE (Disabled on inactive debug)
		particles_drag.emitting = true # DEBUG CODE (Disabled on inactive debug)
		collision_mario.disabled = true # DEBUG CODE (Disabled on inactive debug)

	if dragging: # DEBUG CODE (Disabled on inactive debug)
		global_position = lerp(global_position, get_global_mouse_position(), 5 * _delta) # DEBUG CODE (Disabled on inactive debug)
		global_position = lerp(global_position, get_global_mouse_position(), 5 * _delta) # DEBUG CODE (Disabled on inactive debug)

func _process(_delta):
	walk_frame += 24.0/60.0

	if in_free_fall == true:
		if sprite.animation != ("fall_"+str(facing_direction)):
			sprite.playing = true
			sprite.speed_scale = 3
			sprite.animation = ("fall_"+str(facing_direction))

	if GlobalSingleton.height_map_layer == "g1":
		sprite.offset.y = 0
	if GlobalSingleton.height_map_layer == "g2":
		sprite.offset.y = -10

	if dragging == false: # DEBUG CODE (Disabled on inactive debug)
		movement_disabled = false # DEBUG CODE (Disabled on inactive debug)
	if GlobalSingleton.debug_active == true:
		if Input.is_action_just_pressed("feature test key (changes based on current test)"):
			# CHANGE CODE BASED ON FEATURE BEING TESTED
			in_free_fall = !in_free_fall

func _on_Area2D_input_event(viewport, event, shape_idx): # DEBUG CODE (Disabled on inactive debug)
	if Input.is_action_just_pressed("mouse") && GlobalSingleton.debug_active == true: # DEBUG CODE (Disabled on inactive debug)
		dragging = true # DEBUG CODE (Disabled on inactive debug)
		if dragging == true: # DEBUG CODE (Disabled on inactive debug)
			movement_disabled = true # DEBUG CODE (Disabled on inactive debug)
			sprite.speed_scale = 3 # DEBUG CODE (Disabled on inactive debug)
			sprite.playing = true # DEBUG CODE (Disabled on inactive debug)
			sprite.animation = "drag" # DEBUG CODE (Disabled on inactive debug)
