extends Control




func _on_restart_pressed() -> void:
	Global.sword = 0
	Global.health = 3
	Global.coins = 0
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_exit_pressed() -> void:
	await get_tree().create_timer(0.6).timeout
	get_tree().quit()
