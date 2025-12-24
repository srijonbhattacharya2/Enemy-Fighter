extends Sprite2D

@export var target: CharacterBody2D
@export var speed := 250.0
@onready var Error: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"


func _physics_process(delta):
	if target == null:
		return

	self.global_position = self.global_position.move_toward(
		target.global_position,
		speed * delta
	)
	
	if Global.health < 1:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://game_over_screen.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # or body.is_in_group("player")
		if Global.sword == 1:
			if Global.sword_usage == 1:
				visible = false
				move_to_random_position()
				visible = true
			else:
				Global.health -= 1
				print("Health:", Global.health)
		else: 
			Global.health -= 1
			print("Health:", Global.health)
			Error.play()
		
func move_to_random_position():
	var viewport_size = get_viewport_rect().size

	# Pick a random position within screen bounds
	var random_x = randf_range(0, viewport_size.x)
	var random_y = randf_range(0, viewport_size.y)
	position = Vector2(random_x, random_y)
