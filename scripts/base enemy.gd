class_name BaseEnemy

extends RigidBody2D

@export var movement_speed: int
@export var rotate_speed: int

var target: Transform2D
@onready var player: Player = get_node("../Player") as Player

func _physics_process(delta):
	Rotate(delta)

func Rotate(delta) -> void:
	var current_rotation = rad_to_deg(rotation) + 90
	var target_angle = angle_of() + 180
	var direction: float = target_angle - current_rotation
	
	direction = clamp(direction, -1.0, 1.0)
	
	if abs(direction) < 0.9:
		pass
	
	rotation += deg_to_rad(direction * delta * rotate_speed)

func angle_of() -> float:
	var x = player.global_position.x - global_position.x
	var y = player.global_position.y - global_position.y
	return rad_to_deg(atan2(y, x))
