extends Node2D


func _on_enemy_2_enemy_died() -> void:
	show_victory_screen()
	
func show_victory_screen():
	get_tree().change_scene_to_file("res://assets/win_screen.tscn")
