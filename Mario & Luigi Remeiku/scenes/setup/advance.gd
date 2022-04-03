extends Label

var state = 0
# STATES
# 0: label
# 1: movement

onready var music : AudioStreamPlayer = $"../../BGMusic"
onready var rect = $"../../Fade/ColorRect"
onready var rect_ap = $"../../Fade/ColorRect/AnimationPlayer"
onready var rect2_ap = $"../../Fade2/ColorRect/AnimationPlayer"
onready var card_ap = $"../../Card/AnimationPlayer"
var can_advance = false

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	can_advance = true

func _input(event):
	if event is InputEventKey and event.pressed and can_advance == true:
		if state == 0:
			state = 1
			print(state)
			rect_ap.play_backwards("fade_in")
			yield(get_tree().create_timer(1), "timeout")
			self.visible = false
			music.playing = true
			rect_ap.play("fade_in")
			rect2_ap.play("fade_in")
			yield(get_tree().create_timer(1), "timeout")
			card_ap.play("drop_in")
			
