extends Control

@export var DURATION: int = 20
@export var NUMBER_OF_DOTS: int = 3

var count = 0
var dots = 0

func _ready():
	set_process_unhandled_input(false)

func _process(_delta):
	if dots <= NUMBER_OF_DOTS:
		if count <= DURATION:
			count += 1
		else:
			$ColorRect/Label.text += "."
			count = 0
			dots += 1
	else:
		$ColorRect/Label.text = "Loading"
		count = 0
		dots = 0
