extends Node2D

onready var backdrop = $ColorRect/Backdrop
onready var backdrop_alt = $ColorRect/BackdropAlt
onready var theme = $ColorRect/Theme
onready var theme_alt = $ColorRect/ThemeAlt

func _ready():
	backdrop.visible = true
	backdrop_alt.visible = false
	theme.playing = true
	theme_alt.playing = true
	theme.volume_db = 0
	theme_alt.volume_db = -80

func _process(delta):
	if Input.is_action_just_released("debug toggle"):
		if GlobalSingleton.debug_active == true:
			backdrop.visible = false
			backdrop_alt.visible = true
			theme.volume_db = -80
			theme_alt.volume_db = 0
		else:
			backdrop.visible = true
			backdrop_alt.visible = false
			theme.volume_db = 0
			theme_alt.volume_db = -80
