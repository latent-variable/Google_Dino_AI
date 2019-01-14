extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	modulate.a = 0
	pass

func _process(delta):
	modulate.a -= .5*delta


func _on_Save_pressed():
	modulate.a = 1
