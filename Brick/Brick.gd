extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")
onready var target_y = position.y

var row = 0
var col = 0

export var appear_speed = 2
export var fall_speed = 1

var dying = false

var colors = [
	Color8(224,49,49)		#Red 8
	,Color8(253,126,20)		#Orange 6
	,Color8(255,224,102)		#Yellow 3
	,Color8(148,216,45)		#Lime 5
	,Color8(34,139,230)		#Blue 6
	,Color8(190,75,219)		#Violet 5
	,Color8(132,94,247)		#Grape 6
]
onready var textures = [
	load("res://Assets/smoke0.png")
	,load("res://Assets/smoke1.png")
	,load("res://Assets/smoke2.png")
	,load("res://Assets/smoke3.png")
]

func _ready():
	randomize()
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()

func _process(_delta):
	if dying and not $Particles2D.emitting and not $Tween.is_active() and not $Color_Tween.is_active():
		queue_free()


func start_brick():
	if HUD.blocks_appear:
		pass
	else:
		position = Vector2(position.x,target_y)





func update_color():
	if HUD.color_blocks:
		if row >= 0 and row < colors.size():
			$Color.color = colors[row]
	else:
		$Color.color = Color(1,1,1,1)

func emit_particle(pos):
	if HUD.particle_blocks:
		$Particles2D.texture = textures[randi() % textures.size()]
		$Particles2D.emitting = true
		$Particles2D.global_position = pos
	
	
func _on_HUD_changed():
	update_color()


func die():
	dying = true
	var target = Vector2(position.x, 768)
	var target_color = $Color.color
	target_color.a = 0
	var timing = randf()*fall_speed + 1

	if HUD.blocks_fall:
		pass
	if HUD.blocks_fade:
		pass
	if not HUD.blocks_fall and not HUD.blocks_fade:
		$Color.color = target_color


	collision_layer = 0
	collision_mask = 0
