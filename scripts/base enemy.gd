class_name BaseEnemy

extends RigidBody2D

@export var movement_speed: int
@export var rotate_speed: int
@export var rotation_curve: Curve

var target: Transform2D
@onready var player: Player = get_node("../Player") as Player

func _physics_process(delta):
	Controls(delta)

func Controls(delta):
	# rotation
	#var lookingAtAngle: float = transform.looking_at(target.get_origin()).get_rotation()
	var dir: Vector2 = player.position - position
	var final_angle = dir.angle() + deg_to_rad(90.0)
	print(final_angle)
	rotation = final_angle
