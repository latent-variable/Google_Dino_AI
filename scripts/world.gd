extends Node

var Dino_count = 0 

var Mplayer = AudioStreamPlayer.new()
func _ready():
	Global.Ground_speed = -600
	Global.score = 0
	
	self.add_child(Mplayer)
	get_viewport().audio_listener_enable_2d = true
	Mplayer.stream = load("res://assets/Sound/Scoreup.wav")

func _process(delta):
	Global.score += 1
	Global.Ground_speed -= 10*delta
	if Global.score % 1000 == 0:
		Mplayer.play()