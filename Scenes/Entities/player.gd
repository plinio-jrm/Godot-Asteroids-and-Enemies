extends RigidBody2D

@export var acceleration: int = 300
var move_input: int = 0
var rotation_input: int = 0
@export var current_rotation: float

func _input(event):
	if event.is_action_pressed("speed_up"):
		move_input = 1
	elif event.is_action_pressed("speed_down"):
		move_input = -1
	else:
		move_input = 0

	if event.is_action_pressed("turn_left"):
		rotation_input = -1
	elif event.is_action_pressed("turn_right"):
		rotation_input = 1
	else:
		rotation_input = 0

func _process(delta):
	current_rotation = rotation

func _physics_process(delta):
	Process_Rotation(delta)
	#Process_Movement()
	return

func Process_Movement():
	if move_input == 0:
		return
	
	var direction_acceleration = Vector2(0, acceleration * move_input)
	print(direction_acceleration)
	var velocity = direction_acceleration.rotated(rotation)
	print(velocity)
	apply_force(velocity)
	
func Process_Rotation(delta):
	rotation += rotation_input * delta
	#rotate(rotation_input * delta)
	#apply_torque_impulse(rotation_input)
