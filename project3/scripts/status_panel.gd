extends HBoxContainer

@export var stats :CharacterBody2D

@onready var health_bar : TextureProgressBar = $health

func _ready() -> void:
	stats.health_changed.connect(update_health)
	update_health()

func update_health() -> void:
	var percentage: float = stats.health / float(stats.max_health)
	health_bar.value = percentage
	print("update_health CALLED! HP =", stats.health)
