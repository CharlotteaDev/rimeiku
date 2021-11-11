extends Button

onready var animationPlayerRect : AnimationPlayer = get_node("../AnimationPlayerRect")
onready var animationPlayer : AnimationPlayer = get_node("AnimationPlayer")
onready var pressSFX = get_node("../ButtonSfx")

onready var pressable = false
var delayTimer = 1.5

func _ready():
	set_disabled(true)
	yield(get_tree().create_timer(delayTimer), "timeout")
	pressable = true
	set_disabled(false)

func _on_Button_pressed():
	if pressable == true and GlobalSingleton.disabledOtherB == false:
			GlobalSingleton.disabledOtherB = true
			set_disabled(true)
			animationPlayerRect.play("Fade out")
			pressSFX.playing = true
			animationPlayer.play("FadeOut")
			yield(get_tree().create_timer(delayTimer), "timeout")
			get_tree().change_scene("./Scenes/b_arena.tscn")
	else:
		set_disabled(true)
