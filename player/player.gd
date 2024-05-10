extends CharacterBody2D

@export var speed: int = 35

func handleInput():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	

