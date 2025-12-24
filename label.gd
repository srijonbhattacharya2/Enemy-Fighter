extends Label

func _process(_delta: float) -> void:
	if Global.health == 0:
		text = "Game Over"
