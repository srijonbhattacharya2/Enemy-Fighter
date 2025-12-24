extends CheckButton

func _ready() -> void:
	visible = false


func _process(delta: float) -> void:
	if Global.sword == 1:
		visible = true
		
