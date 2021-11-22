extends Button

var delay_timer = 1.5
onready var animation_player_rect : AnimationPlayer = get_node("../AnimationPlayerRect")
onready var animation_player : AnimationPlayer = get_node("AnimationPlayer")
onready var press_sfx = get_node("../ButtonSfx")
onready var pressable = false

func _ready():
	set_disabled(true)
	yield(get_tree().create_timer(delay_timer), "timeout")
	pressable = true
	set_disabled(false)

func _on_Button2_pressed():
	if pressable == true && GlobalSingleton.disabled_other_b == false:
			GlobalSingleton.disabled_other_b = true
			set_disabled(true)
			animation_player_rect.play("fade_out")
			press_sfx.playing = true
			animation_player.play("fade_out")
			yield(get_tree().create_timer(delay_timer), "timeout")
			# warning-ignore:return_value_discarded
			get_tree().change_scene("./scenes/castle_grounds_1/castle_grounds_1.tscn")
	else:
		set_disabled(true)
