extends Sprite

onready var enemy = $"../Sprite2"
onready var width = 2.0

func _ready():
	print(enemy)

func _draw():
	draw_arc(Vector2(100,0), float(10), float(3), float(7), 1000, Color(1,1,1), width, true)
		   # Center          Radius     start_rad end_rad   width                      AA?
