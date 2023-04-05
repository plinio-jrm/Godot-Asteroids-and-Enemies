class_name Health
extends Node

signal on_die
signal on_heal

var _maximum: int
var _current: int
@export var health: int
	
func _ready():
	_maximum = health
	_current = _maximum
	
func Damage(amount: int = 1) -> void:
	_current -= amount
	if _current <= 0:
		emit_signal("on_die")
	
func Heal(amount: int = 1) -> void:
	_current = clamp(_current + amount, 0, _maximum)
	emit_signal("on_heal")

func HP() -> int:
	return _current
