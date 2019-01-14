extends Sprite



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here\
	pass


func _process(delta):
	position.x += Global.Ground_speed*delta
