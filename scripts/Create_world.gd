extends Node2D

const world = preload("res://prefabs/world.tscn")
var w = null
func _ready():
	_spawn()

func _spawn():
	w = world.instance()
	get_node("worlds").add_child(w)

func _destroy ():
	w.queue_free()