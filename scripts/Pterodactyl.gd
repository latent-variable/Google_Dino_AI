extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	#print(get_global_position().x)
	if get_global_position().x <= 1100:
		var temp = Global.Inputs.duplicate()
		temp.sort()
		if temp[0] == get_global_position().x:
			Global.pterodactyl_b = true
	
	if get_global_position().x <= 0:
		Global.pterodactyl_b = false
		queue_free()