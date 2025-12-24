extends Node2D

@onready var sprite: Sprite2D = $Sprite2D2

func _ready() -> void:
	# Make window borderless (removes minimize/maximize/close)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

	# Optional: force fullscreen or center window
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_position(Vector2i(
		(DisplayServer.screen_get_size().x - get_viewport().size.x) / 2,
		(DisplayServer.screen_get_size().y - get_viewport().size.y) / 2
	))

	# Start fade sequence
	play_splash_animation()


func play_splash_animation() -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

	# Step 1: Fade IN (0 -> 1 alpha)
	sprite.modulate.a = 0.0
	tween.tween_property(sprite, "modulate:a", 1.0, 1.0)

	# Step 2: Hold (pause for 1 second)
	tween.tween_interval(1.0)

	# Step 3: Fade OUT (1 -> 0 alpha)
	tween.tween_property(sprite, "modulate:a", 0.0, 1.0)

	# Step 4: After fade out completes, go to main menu
	tween.tween_callback(Callable(self, "_on_splash_finished"))


func _on_splash_finished() -> void:
	# Restore normal window border before switching
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)

	# Now switch to the main menu
	get_tree().change_scene_to_file("res://main_menu.tscn")
