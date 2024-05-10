extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D
@export var speed: int = 35

func handleInput():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	handleInputAnimations(direction)
	velocity = direction * speed
	

func handleInputAnimations(input):
	if(input.x == 0 && input.y == 0):
		animated_sprite.play("idle")
		return
	
	if(input.x == -1):
		animated_sprite.play("move_left")
		return
	
	if(input.x == 1):
		animated_sprite.play("move_right")
		return
	
	if(input.y == -1):
		animated_sprite.play("move_up")
		return
	
	if(input.y == 1):
		animated_sprite.play("move_down")
		
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	
