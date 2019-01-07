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

#Weights in the neural network 
var weights1 = []
var weights2 = []
var inputs = []

#3 Nodes in the hinden layer
var nodeL11 = 0.0
var nodeL12	= 0.0
var nodeL13 = 0.0

#Two outputs small jump long jump 
var output1 = 0.0
var output2 = 0.0
var output3 = 0.0

#fitness use in to select best speciment 
var fitness = 0

func _ready():
	emit_signal("_alive")
	pos_y = position.y 
	#fill input 
	randomize()
	for i in range(4):
	    inputs.append(0.0)
	set_weights()

func _physics_process(delta):
	if position.y < pos_y:
		emit_signal("in_air")
	else:
		emit_signal("on_ground")
	
	motion.y += gravity
	
	if is_on_floor():
		brain()
	motion = move_and_slide(motion, up)

func brain():
	#basic brain random input
#	randomize()
#	var n = rand_range(0,1)
#	if n > .98:
#		motion.y = -800
	get_input()
	Layer1()
	output()

func get_input():
	var temp = Global.Inputs.duplicate()
	temp.sort()
	var speed = Global.Groung_speed
	var normalize  =1.0/4000
	inputs[0] = (temp[0]*normalize)
	inputs[1] = speed
	if Global.pterodactyl_b == true:
		inputs[2] = 1
	else:
		inputs[2] =0
	inputs[3] =  rand_range(-1,1)
func set_weights():
	weights1 = Global.Saved_weights1.duplicate()
	weights2 = Global.Saved_weights2.duplicate()
	
func Layer1():
	nodeL11 = 0
	nodeL12 = 0
	nodeL13 = 0
	for i in range(4):
		nodeL11 += inputs[i] * weights1[i]
	nodeL11 = tanh(nodeL11)
	for i in range(4,8):
		nodeL12 += inputs[i-4] * weights1[i]
	nodeL12 = tanh(nodeL12)
	for i in range(8,12):
		nodeL13 += inputs[i-8] * weights1[i]
	nodeL13 = tanh(nodeL13)
		
func output():
	output1 = 0
	output2 = 0
	output3 = 0
	
	output1 += nodeL11*weights2[0]
	output1 += nodeL12*weights2[1]
	output1 += nodeL13*weights2[2]
	output1 = tanh(output1)
	
	
	output2 += nodeL11*weights2[3]
	output2 += nodeL12*weights2[4]
	output2 += nodeL13*weights2[5]
	output2 = tanh(output2)
	
	output3 += nodeL11*weights2[6]
	output3 += nodeL12*weights2[7]
	output3 += nodeL13*weights2[8]
	output3 = tanh(output2)
	
	if output1 > output2 :
		if output1 > 0:
			motion.y = -800
	elif output2 > output1 :
		if output1 > 0:
			motion.y = -900
	if output3 > .3: #hiher treshold to prevent ducking 
		emit_signal("_duck")
	else:
		emit_signal("_stand")

	
func _on_dino_area_area_entered(area):
	Global.EnemyScore = Global.score
	emit_signal("_dead")
	queue_free()

