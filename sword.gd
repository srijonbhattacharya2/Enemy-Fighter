extends Sprite2D

func _ready() -> void:
	visible = false


func _process(_delta: float) -> void:
	if Global.sword == 1:
		visible = true
	else:
		visible = false
