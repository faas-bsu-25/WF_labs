extends Label


func _ready() -> void:
	add_to_group("UI")
	update_score(0)   

func update_score(new_score: int) -> void:
	text = "Score: %d" % new_score
