extends Node2D

var edead = false
var pdead = false
var pwins = false

var Mplayer = AudioStreamPlayer.new()
func _ready():
	Global.Ground_speed = -600
	Global.score = 0
	Global.ShowBanner()
	$world/PlayerWins.hide()
	$world/AIwins.hide()
	
	self.add_child(Mplayer)
	get_viewport().audio_listener_enable_2d = true
	Mplayer.stream = load("res://assets/Sound/New_High_score.wav")
	
func _process(delta):
	Global.Ground_speed -= 10*delta
	if edead and pdead:
		Global.score -= 1
		Global.Ground_speed = 0
		if pwins:
			$world/PlayerWins.show()
		else:
			$world/AIwins.show()

func _on_Button_pressed():
	Global.ShowInterstitial()
	get_tree().change_scene("res://prefabs/Menu.tscn")
	

func _on_ReloadButton_pressed():
	get_tree().reload_current_scene()


func _on_Dino_Player__dead():
	pdead = true
	if edead == false:
		pwins = false
	else:
		pwins = true
		Mplayer.play()


func _on_Dino_enemy__dead():
	edead = true
	if pdead:
		Mplayer.play()