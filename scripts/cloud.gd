extends Sprite

var speed = -30
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	speed -= 10*delta
	position +=  Vector2(speed*delta,0)

