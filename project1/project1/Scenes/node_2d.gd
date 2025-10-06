extends Node2D

@export var coin_scene: PackedScene
@export var coin_count: int = 300
@export var map_width: int = 4200
@export var map_height: int = 1100

func _ready():
	spawn_coins()

func spawn_coins():
	randomize()
	for i in range(coin_count):
		var coin = coin_scene.instantiate()
		var x = randi() % map_width
		var y = randi() % map_height
		coin.position = Vector2(x,y)
		add_child(coin)
	
