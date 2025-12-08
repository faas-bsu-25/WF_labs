extends Control

@onready var hp_bar: TextureProgressBar = $TextureProgressBar

func update_health(current: int, max: int) -> void:
	hp_bar.max_value = max
	hp_bar.value = current
