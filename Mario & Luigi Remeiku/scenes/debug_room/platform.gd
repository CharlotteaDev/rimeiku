extends Area2D
class_name Platform

export (int) var z
export (int) var height

func _ready() -> void:
	height = z + height
