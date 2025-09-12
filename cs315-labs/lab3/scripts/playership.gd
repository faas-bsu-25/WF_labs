extends CharacterBody2D

var speed = 400

@export var bullet_element : Resource
#var bullet_element = preload("res://lab3/elements/laser.tscn")另一个子弹方式

func _process(delta: float) -> void:
	var move_dir = Input.get_axis("left","right")
	
	self.velocity.x = move_dir * speed
	
	if Input.is_action_just_pressed("shoot"):
		#make the secen exist
		var newBullet = bullet_element.instantiate()
		
		#put it onto the screen
		get_node("/root").add_child(newBullet)
		
		#position bullet
		newBullet.position = self.position
	
	move_and_slide()
