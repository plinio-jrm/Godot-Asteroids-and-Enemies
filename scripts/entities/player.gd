class_name Player_V2
extends CharacterBody2D

var input_vector: float
var rotation_dir: int

@export var acceleration: int = 500
@export var max_speed: int = 200
@export var rotation_speed: float = 3.5
@export var friction_weight: float = 3

func _process(delta):
	Handle_Inputs()
	Rotation()

func _physics_process(delta):
	Movement(delta)
	move_and_slide()

func Handle_Inputs():
	input_vector = Input.get_axis("speed_up", "speed_down")
	rotation_dir = 0
	if Input.is_action_pressed("turn_left"):
		rotation_dir += -1
	if Input.is_action_pressed("turn_right"):
		rotation_dir += 1	
	
func Movement(delta):
	velocity += Vector2(0.0, input_vector * acceleration * delta).rotated(rotation)
	velocity = velocity.limit_length(max_speed)
	
	if input_vector == 0 and velocity.length() != 0:
		velocity = velocity.move_toward(Vector2.ZERO, friction_weight)

func Rotation():
	rotate(deg_to_rad(rotation_dir * rotation_speed))
