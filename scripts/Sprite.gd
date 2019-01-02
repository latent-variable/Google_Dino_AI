extends Sprite

var speed = -600


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here\
	pass


func _process(delta):
	speed -= 10*delta
	Global.Groung_speed = -speed / 6000
	position += Vector2(speed*delta,0)
	if position.x <= -2390:
		position.x = 4778
