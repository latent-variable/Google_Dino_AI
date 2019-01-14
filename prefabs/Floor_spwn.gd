extends Node2D
const f = preload("res://prefabs/Floor.tscn")

var obj = null
var first = true

func _ready():
	obj = null
	spawn()
	

func spawn():
	if first:
		first = false
		var f_instance = f.instance()
		obj = f_instance
		get_node("container").add_child(f_instance)
	else:
	
		var f_instance = f.instance()
		f_instance.position.x += 1490
		obj = f_instance
		get_node("container").add_child(f_instance)
		
		
func _process(delta):
	if obj.get_global_position().x < 1290:
		spawn()

		

	
