class_name Bullet
extends Area2D

@export var speed: int = 100
@export var lifetime: float = 1.0

@onready var lifetime_timer: Timer = $"lifetime"

func _ready():
	lifetime_timer.wait_time = lifetime

func _process(delta):
	var movement = Vector2.UP.rotated(rotation) * speed
	position += movement

func _on_lifetime_timeout():
	print("bullet over!")
	queue_free()
