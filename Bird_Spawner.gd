extends Node2D

const bird = preload("res://prefabs/Pterodactyl.tscn")
var bird_pos = null
func _ready():
	bird_pos = null
	_spawn()

func _spawn():
	randomize()
	var b = bird.instance()
	var pos = Vector2()
	pos.x = 0
	pos.y = rand_range(0,-200)
	b.position = pos
	bird_pos = b
	get_node("bird_container").add_child(b)
		

func _process(delta):
	if bird_pos != null:
		Global.Inputs[4] = bird_pos.get_global_position()
		if bird_pos.get_global_position().x < 0:
			bird_pos = null
	else:
		_spawn()
		Global.Inputs[4] = (0)