extends Button

func _ready() -> void:
	update_text()

func _on_pressed() -> void:
	Global.sword_usage = 1 - Global.sword_usage
	update_text()

func update_text() -> void:
	text = "Turn OFF sword usage" if Global.sword_usage == 1 else "Turn ON sword usage"

func _process(_delta: float) -> void:
	if Global.sword == 0:
		visible = false

	if Global.sword == 1:
		visible = true
