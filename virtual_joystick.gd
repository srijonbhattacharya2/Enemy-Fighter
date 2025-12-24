extends Control
class_name VirtualJoystick

@export var radius: float = 100.0
@onready var knob = $Knob
@onready var base = $Base

var _dragging := false
var _output := Vector2.ZERO  # Normalized direction (-1 to 1)

func _ready():
	knob.position = base.size / 2 - knob.size / 2

func _gui_input(event):
	# Touch or mouse down
	if event is InputEventScreenTouch and event.pressed:
		_dragging = true
		_update_knob(event.position)
	elif event is InputEventScreenDrag:
		if _dragging:
			_update_knob(event.position)
	elif event is InputEventScreenTouch and not event.pressed:
		_reset_knob()

func _update_knob(pos: Vector2):
	var local_pos = pos - global_position
	var center = base.size / 2
	var offset = local_pos - center

	if offset.length() > radius:
		offset = offset.normalized() * radius

	knob.position = center + offset - knob.size / 2
	_output = offset / radius  # normalized vector

func _reset_knob():
	_dragging = false
	knob.position = base.size / 2 - knob.size / 2
	_output = Vector2.ZERO

func get_output() -> Vector2:
	return _output
