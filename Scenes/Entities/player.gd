extends Node2D

func _input(event):
	if event.is_action_pressed("speed_up"):
		print("accelerate")
	elif event.is_action_pressed("speed_down"):
		print("Deaccelerate")
