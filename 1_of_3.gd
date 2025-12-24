extends Sprite2D

func  _ready() -> void:
	visible = false

func _process(_delta: float) -> void:
	if Global.health == 1:
		visible = true

	if Global.health == 0:
		visible = false
