extends Node

@onready var enemy2 = $"."
var keys = 0

var coins_collected = 0
signal coin_collected

func collect_key():
	keys += 1
	
func use_key():
	if(keys >= 0):
		keys -= 1

func collect_coin():
	coins_collected += 1
	coin_collected.emit()
	
func _ready():
	enemy2.connect("enemy_died", Callable(self, "_on_enemy2_died"))
	
func _on_enemy_2_enemy_died() -> void:
	show_victory_screen()
	
func show_victory_screen():
	get_tree().change_scene_to_file("res://assets/win_screen.tscn")
