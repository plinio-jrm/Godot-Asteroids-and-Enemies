extends RigidBody2D

@export var speed: int = 400
@export var max_acceleration: int = 20
@export var max_break: int = -10
@export var turn_speed: int = 20

var acceleration: int

var current_acceleration: float = 0
var turn_input: int

func _ready():
	current_acceleration = 0
	turn_input = 0

func _physics_process(delta):
	Handle_Inputs()
	Process_Inputs(delta)
	Controls(delta)

func Handle_Inputs():
	acceleration = 0
	if Input.is_action_pressed("speed_up"):
		acceleration = 1
	if Input.is_action_pressed("speed_down"):
		acceleration = -1
		
	turn_input = 0
	if Input.is_action_pressed("turn_right"):
		turn_input = 1
	if Input.is_action_pressed("turn_left"):
		turn_input = -1

func Process_Inputs(delta):
	# acceleration input
	if acceleration == 0:
		current_acceleration = lerp(current_acceleration, 0.0, 0.5 * delta)
	else:
		current_acceleration += acceleration * delta
		current_acceleration = clampf(current_acceleration, max_break, max_acceleration)

func Controls(delta):
	# rotation
	var turn: float = turn_input * turn_speed
	apply_torque_impulse(turn)
	
	# movement
	var force: Vector2 = Vector2.UP.rotated(rotation) * current_acceleration * speed
	linear_velocity = force;
