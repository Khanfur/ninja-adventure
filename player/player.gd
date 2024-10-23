extends CharacterBody2D

@export var movementSpeed: int = 35

@onready var _animation_player = $playerMovement

func handleInput() -> void:
	var movementDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = movementDirection * movementSpeed

func updateAnimation() -> void:
	
	if velocity.length() == 0: _animation_player.stop()
	else:
		var inputDirection = "Down"
		
		if Input.is_action_pressed("ui_right"):
			inputDirection = "Right"
		elif Input.is_action_pressed("ui_left"):
			inputDirection = "Left"
		elif Input.is_action_pressed("ui_up"):
			inputDirection = "Up"
		_animation_player.play("walk" + inputDirection)

func _physics_process(delta: float) -> void:
	handleInput()
	move_and_slide()
	updateAnimation()
