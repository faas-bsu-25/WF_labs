extends Node2D

var score = 0
@export var txtScore : Label

func _ready() -> void:
	txtScore.text = str(score)

func increment_score():
	score = score + 1
	txtScore.text = str(score)
	$SFEX.play()
