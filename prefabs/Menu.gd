extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Global.hideBanner()
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://prefabs/Heaven.tscn")


func _on_HSlider_value_changed(value):
	Global.Initial_Population = value


func _on_Crossover_slider_value_changed(value):
	Global.Crossover = value
	


func _on_Mutation_value_changed(value):
	Global.Mutation = value


func _on_Random_generation_value_changed(value):
	Global.Random_Population = value


func _on_Button2_pressed():
	get_tree().change_scene("res://prefabs/Player_world.tscn")
	


func _on_Admob_pressed():
	get_tree().change_scene("res://prefabs/Ads.tscn")
