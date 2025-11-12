extends Node

@onready var main_mesh = $Ball/MeshInstance3D

func ray_select():
	main_mesh.get_active_material(0).next_pass.set_shader_parameter("outline_width", 10)
	pass
func ray_deselect():
	main_mesh.get_active_material(0).next_pass.set_shader_parameter("outline_width", 0)
	pass
