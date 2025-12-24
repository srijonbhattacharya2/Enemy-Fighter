extends Sprite2D

var SPEED = 300

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
	
	if Input.is_action_pressed("ui_space"):
		var rot = rotation
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
