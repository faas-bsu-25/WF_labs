extends CharacterBody2D

func _process(delta: float) -> void:
	
	self.velocity *= .99
	
	if Input.is_action_just_pressed("ui_right"):
		self.velocity.x= 100
		
	if Input.is_action_just_pressed("ui_left"):
		self.velocity.x= -100
		
	if Input.is_action_just_pressed("ui_up"):
		self.velocity.y= -100
		
	if Input.is_action_just_pressed("ui_down"):
		self.velocity.y= 100
		
	move_and_slide()
