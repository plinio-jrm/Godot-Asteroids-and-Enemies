class_name Weapon
extends Node2D

signal on_fire(bullet: Bullet)

@export var cooldown_time: float = 1
@export var bullet_load: PackedScene

var cooldown: Timer

func _ready():
	cooldown = $"Cooldown"
	cooldown.wait_time = cooldown_time

func Shoot(rotationAs) -> void:
	if not CanShoot():
		return
		
	Cooldown()
	var bullet = CreateBullet(rotationAs)
	emit_signal("on_fire", bullet)

func CanShoot() -> bool:
	if bullet_load == null:
		return false
	if not bullet_load.can_instantiate():
		return false
	if not cooldown.is_stopped():
		return false
	
	return true

func Cooldown() -> void:
	cooldown.start()

func CreateBullet(rotationAs) -> Bullet:
	var bullet = bullet_load.instantiate() as Bullet
	bullet.global_position = global_position
	bullet.rotation = rotationAs
	
	return bullet
