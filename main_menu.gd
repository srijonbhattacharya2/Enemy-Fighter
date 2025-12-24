extends Control

func _on_menu_button_pressed() -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")
