class_name BaseEnemy

extends RigidBody2D

@export var movement_speed: int
@export var rotate_speed: int
@export var rotation_curve: Curve

var target: Transform2D

func Set(target: Transform2D):
	self.target = target

func _physics_process(delta):
	Controls(delta)

func Controls(delta):
	# rotation
	var lookingAtAngle: float = transform.looking_at(target.get_origin()).get_rotation()
