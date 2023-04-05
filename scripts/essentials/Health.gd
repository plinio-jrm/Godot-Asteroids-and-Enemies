class_name Health
extends Control

signal on_die_before_fade
signal on_die_after_fade
signal on_heal

const OFFSET_POSITION: Vector2 = Vector2(0, 70)
var _progressBar: ProgressBar

var _maximum: int
var _current: int
@export var health: int
@export var useProgressBar: bool = true
	
func _ready():
	_maximum = health
	_current = _maximum
	SetProgressBar()
	modulate.a = 0
	
func _process(delta):
	var parent = get_parent()
	global_position = parent.global_position + OFFSET_POSITION

func SetProgressBar() -> void:
	_progressBar = $"ProgressBar" as ProgressBar
	_progressBar.max_value = _maximum
	_progressBar.visible = useProgressBar
	ChangeHealth(_current)
	
func Damage(amount: int = 1) -> void:
	if _current - amount <= 0:
		emit_signal("on_die_before_fade")
	ChangeHealth(_current - amount)
	
func Heal(amount: int = 1) -> void:
	ChangeHealth(clamp(_current + amount, 0, _maximum))
	emit_signal("on_heal")

func ChangeHealth(amount: int) -> void:
	_current = amount
	_progressBar.value = _current
	Fade()

func Fade() -> void:
	modulate.a = 1
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1)
	tween.connect("finished", on_fade_finished)
	tween.play()

func on_fade_finished() -> void:
	if _current <= 0:
		emit_signal("on_die_after_fade")

func HP() -> int:
	return _current
