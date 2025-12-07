extends Area2D

@export var keys_needed = 1
@export var scene_to_load : String

func _on_body_entered(body: Node2D) -> void:
	if Gamecontroller.keys >= keys_needed:
		get_tree().change_scene_to_file(scene_to_load)
	else:
		pass
