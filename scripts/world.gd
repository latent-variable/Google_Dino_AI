extends Node

var Dino_count = 0 

func _ready():
	Global.score = 0
	# Called when the node is added to the scene for the first time.
	# Initialization here

func _process(delta):
	Global.score += 1