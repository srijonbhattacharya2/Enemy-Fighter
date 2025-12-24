extends Sprite2D

func _ready() -> void:
	visible = false


func _process(_delta: float) -> void:
	if Global.gun == 1:
		visible = true
		
	# Get the mouse position in the global coordinate space
	var mouse_position: Vector2 = get_global_mouse_position()
	
	# Compute the direction vector from sprite to mouse
	var direction: Vector2 = mouse_position - global_position
	
	# Rotate the sprite to face that direction
	rotation = direction.angle()
