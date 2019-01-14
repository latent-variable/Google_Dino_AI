extends Node

var Generation = 0
var m = Mutex.new()
var dcount = 0
onready var Dino = load("res://prefabs/Dino.tscn")
onready var world = $Create_world
onready var clouds = $Cloud_Spawner
var Dino_has_been_saved = false
var Mplayer = AudioStreamPlayer.new()

func _ready():
	Global.ShowBanner()
	Global.Fitness1 = 0.0
	Global.Fitness2 = 0.0
	Global.Generation = 1
	var Weights11 = []
	var Weights21 = []
	
	var Weights12 = []
	var Weights22 = []
	
	self.add_child(Mplayer)
	get_viewport().audio_listener_enable_2d = true
	Mplayer.stream = load("res://assets/Sound/New_High_score.wav")
	
	$Save.disabled = true
	spawn_dinos()

func _process(delta):
	if dcount != Global.Dino_Count:
		dcount = Global.Dino_Count
	if Global.Dino_Count == 0 or Global.Dino_Count == -1 or Global.Dino_Count == -2 or Global.Dino_Count == -3:
		Mplayer.play()
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
		$Save.disabled = false
		
		

func spawn_dinos():
	Global.Dino_Count = 0
	for i in range(Global.Initial_Population):
		m.lock()
		Global.Dino_Count += 1
		var d = Dino.instance()
		get_node("Jurassic_ParK").add_child(d)
		m.unlock()

func _on_Timer_timeout():
	clouds._spawn()
	
func _on_ReloadButton_pressed():
	get_tree().reload_current_scene()


func _on_Save_pressed():
	Dino_has_been_saved = true
	#save best weights to play against. 
	Global.Saved_weights1 = Global.Weights11.duplicate()
	Global.Saved_weights2 = Global.Weights21.duplicate()


func _on_Menu_pressed():
	if Dino_has_been_saved:
		Global.ShowInterstitial()
		get_tree().change_scene("res://prefabs/Menu.tscn")
		Engine.time_scale = 1
	else:
		Dino_has_been_saved = true
		$Menu/SavePanel2._Show()

func _on_DoubleSpeed_pressed():
	Global.ShowRewardVideo()
