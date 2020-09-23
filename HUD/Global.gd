extends Node

onready var HUD = get_node("/root/Game/HUD")

func _process(delta):
	if Input.is_action_just_pressed("menu"):	
		if HUD.visible:
			HUD.hide()
		else:
			HUD.show()
