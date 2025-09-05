extends Area2D



func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	get_node("/root/Lab2").ins.score()
	pass # Replace with function body.
