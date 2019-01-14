extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	modulate.a = 0
	pass

func _process(delta):
	modulate.a -= .4*delta


func _Show():
	modulate.a = 1
