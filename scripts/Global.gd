extends Node

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

var Weights11 = []
var Weights21 = []
#var Weights31 = []

var Weights12 = []
var Weights22 = []
#var Weights32 = []

var Mutation = .05

func _ready():
	for i in range(4):
	    Inputs.append(0.0)
	