extends Camera2D

func _process(delta):
	if GlobalSingleton.current_area == "DebugRoom":
		limit_left = -1184
		limit_right = 896
		limit_top = -712
		limit_bottom = 856
	if GlobalSingleton.current_area == "StardustFields1":
		limit_left = -413
		limit_right = 1023
		limit_top = -429
		limit_bottom = 415
