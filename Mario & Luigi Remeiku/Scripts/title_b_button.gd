extends Button

onready var pressable_b = false
onready var volume = 100.0/100.0
onready var button_pressed = false

onready var bg_theme = $"../Theme"
onready var press_sfx = $"../ButtonSfx"
onready var animation_player_rect : AnimationPlayer = $"../AnimationPlayerRect"
onready var adventure_button = $"../Button2"

func _ready():
	set_disabled(true)
	yield(get_tree().create_timer(1.5), "timeout")
	pressable_b = true
	set_disabled(false)

func _on_Button_pressed():
	if pressable_b && adventure_button.pressable_a:
			button_pressed = true
			pressable_b = false
			adventure_button.pressable_a = false
			animation_player_rect.play("fade_out")
			press_sfx.playing = true
			yield(get_tree().create_timer(1.5), "timeout")
			# warning-ignore:return_value_discarded
			get_tree().change_scene("./scenes/b_arena.tscn")

func _process(_delta):
	if  button_pressed == true:
		bg_theme.volume_db = volume
		volume -= 25.0/100.0

	if !pressable_b:
		set_disabled(true)
