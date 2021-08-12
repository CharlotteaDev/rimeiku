extends Button

onready var animationPlayerRect : AnimationPlayer = get_node("../AnimationPlayerRect")
onready var animationPlayer : AnimationPlayer = get_node("AnimationPlayer")
var delayTimer = 1.5

func _on_Button_pressed():
	animationPlayerRect.play("Fade out")
	animationPlayer.play("FadeOut")
	yield(get_tree().create_timer(delayTimer), "timeout")
	get_tree().change_scene("./Scenes/Main.tscn")
