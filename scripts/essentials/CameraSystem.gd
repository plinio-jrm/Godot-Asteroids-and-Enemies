class_name CameraSystem
extends Camera2D

var player: Player
@export var damp_movement: float = 8

func _process(delta):
	FindPlayer()
	Follow(delta)

func FindPlayer() -> void:
	if player == null:
		player = $"../Player"

func Follow(delta) -> void:
	if player == null:
		pass
		
	position = lerp(position, player.position, damp_movement * delta)
