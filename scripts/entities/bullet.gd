class_name Bullet
extends Area2D

@export var speed: int = 100
@export var lifetime: float = 1.0
@export var damage: int = 1

@onready var lifetime_timer: Timer = $"lifetime"

func _ready():
	lifetime_timer.wait_time = lifetime
	lifetime_timer.start()

func _process(delta):
	var movement = Vector2.UP.rotated(rotation) * speed
	position += movement

func _on_lifetime_timeout():
	queue_free()

func _on_body_entered(body):
	if body.health != null:
		(body.health as Health).Damage(damage)
		queue_free()
