extends Node2D

onready var Ball = load("res://Ball/Ball.tscn")

func _ready():
	start_ball()

func start_ball():
	for c in get_children():
		c.queue_free()
	var ball = Ball.instance()
	ball.position = Vector2(512, 650)
	ball.name = "Ball"
	ball.apply_central_impulse(Vector2(250,-250))
	add_child(ball)
