extends KinematicBody2D

onready var paddle_size = $Color.rect_size
onready var Ball = load("res://Ball/Ball.tscn")
onready var HUD = get_node("/root/Game/HUD")

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()


func update_color():
	if HUD.color_paddle:
		$Color.color = Color8(230,73,128) #Pink 6
	else:
		$Color.color = Color(1,1,1,1)

func emit_particle(pos):
	if HUD.particle_paddle:
		get_parent().find_node("Particles2D").global_position = pos
		get_parent().find_node("Particles2D").emitting = true
		get_parent().find_node("Particles2D").look_at(pos)

func _on_HUD_changed():
	update_color()

func _physics_process(_delta):
	var target = get_viewport().get_mouse_position().x
	target = clamp(target, 0, get_viewport().size.x - paddle_size.x)

	position.x = target
