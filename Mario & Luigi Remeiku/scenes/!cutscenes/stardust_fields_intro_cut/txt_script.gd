extends Sprite

func _ready():
	$Label.visible = false
	visible = false
	yield(get_tree().create_timer(2), "timeout")
	visible = true
	$AnimationPlayer.play("appear")
	yield(get_tree().create_timer(0.25), "timeout")
	$Label.text = "General Starshade!\nA massive explosion\nhas been sighted!"
	$Label.visible = true
	yield(get_tree().create_timer(3), "timeout")
	visible = false
	_advance1()

func _advance1():
	$Label.visible = false
	visible = true
	$AnimationPlayer.play("appear")
	yield(get_tree().create_timer(0.25), "timeout")
	$Label2.text = "Confirmation!\nI need confirmation!"
	$Label2.visible = true
	yield(get_tree().create_timer(3), "timeout")
	visible = false
	_advance2()

func _advance2():
	pass

