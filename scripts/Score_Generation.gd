extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	set_text("Score: " + String(Global.score))
	newline()
	add_text("Enemy_Score: " + String(Global.EnemyScore))
	newline()
	add_text("Player_Score: " + String(Global.PlayerScore))
