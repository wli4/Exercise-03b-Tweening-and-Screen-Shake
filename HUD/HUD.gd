extends Control

var color_paddle = false
var color_ball = false
var color_blocks = false
var color_background = false

var particle_paddle = false
var particle_walls = false
var particle_blocks = false

signal changed

func _ready():
	pass

func reset_values():
	emit_signal("changed")


func _on_Reset_pressed():
	get_node("/root/Game/Bricks").start_bricks()
	get_node("/root/Game/Ball_Container").start_ball()
	reset_values()


func _on_Quit_pressed():
	get_tree().quit()



func _on_Color_toggled(button_pressed):
	var t = $Menu/Color/Color.is_pressed()
	color_paddle = t
	color_ball = t
	color_blocks = t
	color_background = t
	emit_signal("changed")



func _on_Particles_toggled(button_pressed):
	var t = $Menu/Particles/Particles.is_pressed()
	particle_paddle = t
	particle_walls = t
	particle_blocks = t
	emit_signal("changed")
