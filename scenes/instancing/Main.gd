extends Node2D

onready var Ball = preload("res://scenes/instancing/Ball.tscn")

func _ready():
	pass
	
func _input(event):
	var mouse_position:Vector2 = get_viewport().get_mouse_position()
	if event.is_pressed():
		var ball = Ball.instance()
		ball.position = mouse_position
		ball.weight=98
		add_child(ball)
