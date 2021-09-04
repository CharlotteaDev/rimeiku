extends Sprite

onready var posX = 1
onready var posY = 1

func _input(event):

	if event.is_action_pressed("right"):
		posX = posX+1
		print("x",posX)
		frame = 2
	if posX == 3:
		posX = posX-1

	if event.is_action_pressed("left"):
		posX = posX-1
		print("x",posX)
	if posX == -1:
		posX = posX+1

	if event.is_action_pressed("up"):
		posY = posY-1
		print("y",posY)
	elif posY == 1:
		posY = 0

	if event.is_action_pressed("down"):
		posY = posY+1
		print("y",posY)
	elif posY == 0:
		posY = 1
