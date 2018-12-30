extends Node2D
const cactuse = preload("res://prefabs/Cac1.tscn")
const cactuse2 = preload("res://prefabs/Cac3.tscn")
const cactuse3 = preload("res://prefabs/cac_s1.tscn")
const cactuse4 = preload("res://prefabs/Cac4.tscn")
const cactuse5 = preload("res://prefabs/Cac5.tscn")

var list = Array()
var count = 0
var obj = null

func _ready():
	obj = null
	list.append(cactuse)
	list.append(cactuse2)
	list.append(cactuse3)
	list.append(cactuse4)
	list.append(cactuse5)
	count = 5
	spawn()
	

func spawn():
	
	if get_global_position().x > 1000:
		randomize()
		var i = randi()%count
		var cac = list[i].instance()
		var pos = Vector2()
		pos.x = rand_range(-100,200)
		pos.y = -25
		cac.position = pos
		obj = cac
		get_node("container").add_child(cac)
#	yield(get_tree().create_timer(5), "timeout")

func _process(delta):
	if obj != null:
		Global.Inputs[2] = obj.get_global_position().x
		if obj.get_global_position().x < 0:
			obj = null
	else:
		
		Global.Inputs[2] = 4000
		



func _on_Timer_timeout():
	spawn()
