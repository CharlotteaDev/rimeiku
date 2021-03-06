extends Button

onready var pressable_a = false
onready var volume = 100.0/100.0
onready var button_pressed = false

onready var bg_theme = $"../Theme"
onready var animation_player_rect : AnimationPlayer = $"../AnimationPlayerRect"
onready var press_sfx = $"../ButtonSfx"
onready var battle_button = $"../Button"

func _ready():
	set_disabled(true)
	yield(get_tree().create_timer(1.5), "timeout")
	pressable_a = true
	set_disabled(false)

func _on_Button2_pressed():
	if pressable_a && battle_button.pressable_b:
			button_pressed = true
			pressable_a = false
			battle_button.pressable_b = false
			animation_player_rect.play("fade_out")
			press_sfx.playing = true
			yield(get_tree().create_timer(1.5), "timeout")
			# warning-ignore:return_value_discarded
			get_tree().change_scene("./scenes/stardust_fields_1/stardust_fields_1.tscn")

func _process(_delta):
	if  button_pressed == true:
		bg_theme.volume_db = volume
		volume -= 75.0/100.0

	if !pressable_a:
		set_disabled(true)
