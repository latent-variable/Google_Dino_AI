extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


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
