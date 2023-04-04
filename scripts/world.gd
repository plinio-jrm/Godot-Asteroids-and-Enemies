class_name World
extends Node

@onready var bullets_holder = $"Bullets"
@onready var player: Player = $"Player" as Player

func _ready():
	player.weapon.connect("on_fire", _on_player_on_fire)

func _on_player_on_fire(bullet):
	bullets_holder.add_child(bullet)