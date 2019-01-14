extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.hide()
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Initial_p0_pressed():
	self.show()


func _on_Back_pressed():
	self.hide()
