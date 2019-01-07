extends AnimatedSprite

var ducking = false

func _ready():
	set_animation("running")
	self.set_modulate( Color(rand_range(0,1),rand_range(0,1),rand_range(0,1)))
	
func _input(event):
	
	if event.is_action_pressed("ui_down"):
		ducking = true
		set_animation("duck")
	elif event.is_action_released("ui_down"):
		ducking = false
		set_animation("running")

func _process(delta):
	if Global.dead:
		set_animation("dead")
	



func _on_Dino_in_air():
	set_animation("idel")
	


func _on_Dino_on_ground():
	if ducking:
		set_animation("duck")
	else:
		set_animation("running")


func _on_Dino__duck():
	ducking = true
	set_animation("duck")


func _on_Dino__stand():
	ducking = false
	set_animation("running")


func _on_DoubleUp_button_pressed():
	pass # replace with function body
