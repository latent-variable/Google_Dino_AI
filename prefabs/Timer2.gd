extends Label


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Global.Reward:
		set_text(str(Global.RewardTime))
	if Global.RewardTime ==0:
		set_text("2xSpeed")
		Global.Reward = false
		Engine.time_scale = 1


func _on_Timer_timeout():
	Global.RewardTime -= 1
	
