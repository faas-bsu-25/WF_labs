extends Node2D

func _on_body_entered(body):
	if body.name == "Player":
		body.on_ladder = true

func _on_body_exited(body):
	if body.name == "Player":
		body.on_ladder = false
