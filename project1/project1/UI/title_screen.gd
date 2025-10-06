extends Control

@onready var new_game : Button = $V/Newgame


func _ready() -> void:
	new_game.grab_focus()
	
func _on_newgame_pressed() -> void:
	get_tree().change_scene_to_file("res://project1/Scenes/node_2d.tscn")
	
func _on_exit_game_pressed() -> void:
	get_tree().quit()
