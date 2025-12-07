extends Area2D

@onready var sound: AudioStreamPlayer2D = $sound

func _on_body_entered(body: Node2D) -> void:
	sound.play()
	Gamecontroller.collect_key()
	await sound.finished
	self.queue_free()
	pass # Replace with function body.
