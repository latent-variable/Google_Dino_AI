extends Node

var Generation = 0
var m = Mutex.new()
var dcount = 0
onready var Dino = load("res://prefabs/Dino.tscn")
onready var world = $Create_world
onready var clouds = $Cloud_Spawner

func _ready():
	spawn_dinos()
	pass

func _process(delta):
	if dcount != Global.Dino_Count:
		dcount = Global.Dino_Count
		print("Dinos Alive " + str(dcount))
	if Global.Dino_Count == 0 or Global.Dino_Count == -1 or Global.Dino_Count == -2:
		if Global.score > Global.High_score:
			Global.High_score = Global.score
		Global.Rebirth = true
		Global.Fitness1 = 0.0
		Global.Fitness2 = 0.0
		world._destroy()
		clouds._destroy()
		world._spawn()
		clouds._spawn()
		spawn_dinos()
		Global.Generation += 1
		

func spawn_dinos():
	for i in range(100):
		m.lock()
		Global.Dino_Count += 1
		var d = Dino.instance()
		get_node("Jurassic_ParK").add_child(d)
		m.unlock()



func _on_Timer_timeout():
	clouds._spawn()
	
