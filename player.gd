extends CharacterBody2D

const SPEED := 350.0

func _physics_process(_delta):
	var dir := Vector2.ZERO
	move_and_slide()
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
	move_and_slide()
	velocity = dir * SPEED
	
