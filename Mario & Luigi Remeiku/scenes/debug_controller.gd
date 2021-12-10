extends Node2D

onready var backdrop = $ColorRect/Backdrop
onready var backdrop_alt = $ColorRect/BackdropAlt
onready var theme = $ColorRect/Theme
onready var theme_alt = $ColorRect/ThemeAlt

onready var music_offset = 0/100

func _ready():
	backdrop.visible = true
	backdrop_alt.visible = false
	theme.playing = true
	theme_alt.playing = false

func _WHATFUCKINGFUNCTIONISTHISAAAAA(event):
	if event is InputEventKey:
		if GlobalSingleton.debug_active == true:
			backdrop.visible = false
			backdrop_alt.visible = true
			theme.playing = false
			theme_alt.playing = true
		else:
			backdrop.visible = true
			backdrop_alt.visible = false
			theme.playing = true
			theme_alt.playing = false
