extends KinematicBody2D

const up = Vector2(0,-1)
var motion = Vector2()
var gravity = 30
signal in_air
signal on_ground
signal _alive 
signal _dead
signal _duck
signal _stand
var pos_y = 0
var small_jump = false
var big_jump = false


func _ready():
	emit_signal("_alive")
	pos_y = position.y 
	

func _physics_process(delta):
	if position.y < pos_y:
		emit_signal("in_air")
	else:
		emit_signal("on_ground")
	
	motion.y += gravity
	
	if is_on_floor():
		if small_jump:
			motion.y -= 800
			small_jump = false
		if big_jump:
			motion.y -= 900
			big_jump = false
	motion = move_and_slide(motion, up)

func brain():
	pass

	
func _on_dino_area_area_entered(area):
	Global.PlayerScore = Global.score
	emit_signal("_dead")
	queue_free()



func _on_Up_button_pressed():
	small_jump = true


func _on_DoubleUp_button_pressed():
	big_jump = true


func _on_Down_button_button_down():
	emit_signal("_duck")


func _on_Down_button_button_up():
	emit_signal("_stand")
