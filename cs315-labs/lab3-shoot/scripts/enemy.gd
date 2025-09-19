extends CharacterBody2D

@export var move_dir = Vector2(0,0)


func _ready() -> void:
	self.velocity = Vector2(0,40)
	
func  _process(delta: float) -> void:
	move_and_slide() 
