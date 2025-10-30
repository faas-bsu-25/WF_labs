extends Control

func _on_newgame_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/world/leve_2_world.tscn")
	
func _on_exitgame_pressed() -> void:
	get_tree().quit()
