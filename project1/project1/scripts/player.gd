extends CharacterBody2D

@export  var move_speed : float = 200
@export var Win_score: int = 100
@onready var GGsound: AudioStreamPlayer2D = $gameover
var score : int = 0

func _physics_process(delta: float) -> void:
	Input.get_vector("left","right","up","down")
	velocity = Input.get_vector("left","right","up","down") * move_speed
	
	#check speed and decide run or stay
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("run")
	
	#control run left or right direction
	var direction = Input.get_axis("left","right")
	if direction:
		velocity.x = direction * move_speed
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = direction < 0 
	else:
		velocity.x = move_toward(velocity.x,0,move_speed)
	
	move_and_slide()
	
	#about coin score
func add_score(points: int) -> void:
	score += points
	get_tree().call_group("UI", "update_score", score)
	if score >= Win_score:
		_game_over()
	#game over
func _game_over():
	get_tree().change_scene_to_file("res://project1/UI/gameoverscreen.tscn") 
