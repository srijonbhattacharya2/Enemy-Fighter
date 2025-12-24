extends CharacterBody2D

const SPEED = 200

var direction = 1

func _ready():
	$Timer.start()

func _physics_process(_delta):
	velocity.x = SPEED * direction
	move_and_slide()

func _on_timer_timeout():
	direction *= -1
