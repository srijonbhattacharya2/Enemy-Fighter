extends Sprite2D

func  _ready() -> void:
	visible = true

func _process(_delta: float) -> void:
	if Global.health == 2:
		visible = false
