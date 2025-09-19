extends CharacterBody2D

func _process(delta: float) -> void:
	
	if (Input.is_action_pressed("left_player_up")):
		self.velocity.y = -100
		
	if (Input.is_action_pressed("left_player_down")):
		self.velocity.y = 100
	
	self.velocity.y *= .9
	
	move_and_slide()
