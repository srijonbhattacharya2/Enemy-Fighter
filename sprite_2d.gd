extends Sprite2D

func _process(_delta: float) -> void:
	if Global.health == 0:
		visible = false
