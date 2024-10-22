extends CharacterBody2D

@export var movementSpeed: int = 35

func handleInput():
	var movementDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = movementDirection * movementSpeed
	
func _physics_process(delta: float) -> void:
	handleInput()
	move_and_slide()
