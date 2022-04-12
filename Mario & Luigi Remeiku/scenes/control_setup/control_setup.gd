extends AnimatedSprite

onready var textbox = $"../Textbox/Textbox"
onready var textbox_ap : AnimationPlayer = $"../Textbox/Textbox/AnimationPlayer"

func _ready():
	textbox.visible = false
	yield(get_tree().create_timer(2), "timeout")
	textbox.visible = true
	textbox_ap.play("appear")
