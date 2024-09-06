extends Node
var point:int = 0
@onready var score_label = $ScoreLabel



func add_point():
	point +=1
	score_label.text =  "You collected " + str(point)+ " coins!"
	
