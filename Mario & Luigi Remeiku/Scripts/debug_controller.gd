extends Node

func _onready():
	if GlobalSingleton.debug_active == false:
		print("debug not active")
