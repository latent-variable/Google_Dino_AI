extends Node2D

const cloud = preload("res://prefabs/Cloud.tscn")

var clouds = []
func _ready():
	_spawn()

func _spawn():
	randomize()
	var c = cloud.instance()
	var pos = Vector2()
	pos.x = 0
	pos.y = rand_range(50,-200)
	c.position = pos
	clouds.append(c)
	get_node("cloud_container").add_child(c)
	
	
func _destroy ():
	for c in clouds:
		c.queue_free()
	clouds = []