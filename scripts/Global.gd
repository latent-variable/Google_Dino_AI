extends Node

var Initial_Population = 50
var Random_Population = .1
var Rebirth = false
var dead = false
var score = 0
var High_score = 0
var Generation = 1
var Dino_Count = 0
var Fitness1 = 0
var Fitness2 = 0
var Inputs = []
var Groung_speed = 0.0
var pterodactyl_b = false

var Weights11 = []
var Weights21 = []
#var Weights31 = []

var Weights12 = []
var Weights22 = []
#var Weights32 = []

var Saved_weights1 = []
var Saved_weights2 = []

var Mutation = .1
var Crossover = .1

var EnemyScore = 0
var PlayerScore = 0


func _ready():
	for i in range(4):
	    Inputs.append(0)
	for i in range(12):
	    Saved_weights1.append(0)
	for i in range(9):
	    Saved_weights2.append(0)