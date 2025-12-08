class_name newEnemy
extends CharacterBody2D

@onready var graphics : Node2D = $Graphics 
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_Machine : Node = $StateMachine

enum Direction{
	LEFT = -1,
	RIGHT= +1,
}
@export var direction : = Direction.LEFT:
	set(v):
		direction = v 
		graphics.scale.x = -direction
@export var max_speed: float = 180
@export var acceleration: float = 2000
