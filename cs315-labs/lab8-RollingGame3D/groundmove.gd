extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_dir = Input.get_vector("left","right","down","up")
	self.rotate_x(player_dir.x * delta)
	self.rotate_x(player_dir.y * delta)
	
	self.rotation.x = clamp(self.rotation.x , -.5,5)
	self.rotation.z = clamp(self.rotation.x , -.5,5)
