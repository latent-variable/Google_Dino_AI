extends Node2D
const cactuse = preload("res://prefabs/Cac1.tscn")
const cactuse2 = preload("res://prefabs/Cac3.tscn")
const cactuse3 = preload("res://prefabs/cac_s1.tscn")
const cactuse4 = preload("res://prefabs/Cac4.tscn")
const cactuse5 = preload("res://prefabs/Cac5.tscn")
const pterodactyl = preload("res://prefabs/Pterodactyl.tscn")

var list = Array()
var count = 0
var a =0

func _ready():
	list.append(cactuse)
	list.append(cactuse2)
	list.append(cactuse3)
	list.append(cactuse4)
	list.append(cactuse5)
	list.append(cactuse4)
	list.append(cactuse5)
	list.append(pterodactyl)
	count = 8
	spawn()
	

func spawn():
	randomize()
	a = rand_range(-200,0)
	var i = randi()%count
	var enemy
	if i == 7: #check for ptreodactyl	
		enemy = list[i].instance()
		var pos = Vector2()
		pos.x = rand_range(-200,1000)
		pos.y = rand_range(-85,-150)			#special y pos
		enemy.position = pos
	else:
		enemy = list[i].instance()
		var pos = Vector2()
		pos.x = rand_range(-200,1000)
		pos.y = -25
		enemy.position = pos
	Global.obstacle = enemy
	get_node("container").add_child(enemy)

func _process(delta):
	if Global.obstacle == null:
			spawn()
	
	
