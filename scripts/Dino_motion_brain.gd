extends KinematicBody2D

const up = Vector2(0,-1)
var motion = Vector2()
var gravity = 30
signal in_air
signal on_ground
signal _alive 
signal _dead
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
#var output3 = 0.0

#fitness use in to select best speciment 
var fitness = 0

func _ready():
	emit_signal("_alive")
	pos_y = position.y 
	#fill input 
	randomize()
	for i in range(3):
	    inputs.append(0.0)
		
	if Global.Rebirth:
		var coin_flip = rand_range(0,1)
		if coin_flip > 0:
			#genetic selecetion crossover and mutation 
			var coin_flip2= selection()
			crossover_mutation(coin_flip2)
		else:
			set_weights()
	else:
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
#	Layer2()
	output()

func get_input():
	var temp = Global.Inputs.duplicate()
	temp.sort()
	var speed = Global.Groung_speed
	var normalize  =1.0/4000
#	for i in range(temp.size()):
#		inputs[i] = (temp[i]*normalize)
	#+b 
	inputs[0] = (temp[0]*normalize)
	inputs[1] = speed
	inputs[2] =  rand_range(-1,1)
	
func set_weights():
	randomize()
	for i in range(9):
		weights1.append(rand_range(-1,1))
	for i in range(6):
		weights2.append(rand_range(-1,1))
#	for i in range(9):
#		weights3.append(rand_range(-.1,.1))
	
	
func Layer1():
	nodeL11 = 0
	nodeL12 = 0
	nodeL13 = 0
	for i in range(3):
		nodeL11 += inputs[i] * weights1[i]
	nodeL11 = tanh(nodeL11)
	for i in range(3,6):
		nodeL12 += inputs[i-3] * weights1[i]
	nodeL12 = tanh(nodeL12)
	for i in range(6,9):
		nodeL13 += inputs[i-6] * weights1[i]
	nodeL13 = tanh(nodeL13)
		
func output():
	output1 = 0
	output2 = 0
	output1 += nodeL11*weights2[0]
	output1 += nodeL12*weights2[1]
	output1 += nodeL13*weights2[2]
	output1 = tanh(output1)
	
	
	output2 += nodeL11*weights2[3]
	output2 += nodeL12*weights2[4]
	output2 += nodeL13*weights2[5]
	output2 = tanh(output2)
	
	if output1 > output2 :
		if output1 > 0:
			motion.y = -800
	elif output2 > output1 :
		if output1 > 0:
			motion.y = -900
#################################
#Getnetic Algo 
#################################
func selection():
	randomize()
	#50/50 of inherating all of one parent genes 
	var coin_flip = rand_range(0,1)
	if coin_flip > .4:
		weights1 = Global.Weights11.duplicate()
		weights2 = Global.Weights21.duplicate()
#		weights3 = Global.Weights31
	else:
		weights1 = Global.Weights12.duplicate()
		weights2 = Global.Weights22.duplicate()
#		weights3 = Global.Weights32
	return coin_flip
func crossover_mutation(coin_flip):
	randomize()
	if coin_flip >.4:
		for i in range(9):
			var chance = rand_range(0,1)
			var chance2 = rand_range(0,1)
			if chance > .9:	#1/9 in swapping genes
				weights1[i] = Global.Weights12[i]
			if chance2 > .90:
				weights1[i] += rand_range(-.5,.5)
		for i in range(6):
			var chance = rand_range(0,1)
			var chance2 = rand_range(0,1)
			if chance > .9:	#1/9 in swapping genes
				weights2[i] = Global.Weights22[i]
			if chance2 > .90:
				weights2[i] += rand_range(-.5,.5)
	else:
		for i in range(9):
			var chance = rand_range(0,1)
			var chance2 = rand_range(0,1)
			if chance > .9:	#1/9 in swapping genes
				weights1[i] = Global.Weights11[i]
			if chance2 > .90:
				weights1[i] += rand_range(-.5,.5)
			
		for i in range(6):
			var chance = rand_range(0,1)
			var chance2 = rand_range(0,1)
			if chance > .9:	#1/9 in swapping genes
				weights2[i] = Global.Weights21[i]
			if chance2 > .90:
				weights2[i] += rand_range(-.5,.5)

	
func _on_dino_area_area_entered(area):
	var m = Mutex.new()
	m.lock()
	Global.Dino_Count -= 1
	if Global.score > Global.Fitness1 :
		Global.Fitness1 = Global.score
		Global.Weights11 = weights1.duplicate()
		Global.Weights21 = weights2.duplicate()
#		Global.Weights31 = weights3
	elif Global.score > Global.Fitness2 :
		Global.Fitness2= Global.score
		Global.Weights12 = weights1.duplicate()
		Global.Weights22 = weights2.duplicate()
#		Global.Weights32 = weights3
	m.unlock()
#	print(get_name()+ " is dead")
	emit_signal("_dead")
	queue_free()

