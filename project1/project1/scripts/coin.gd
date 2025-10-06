extends Area2D

@onready var sound: AudioStreamPlayer2D = $Sound

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		if body.has_method("add_score"):
			body.add_score(1)
		sound.play()
		hide()
		await sound.finished
		queue_free()
