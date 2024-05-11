extends CharacterBody2D

var speed = 20
var limit = 0.5
@export var endPoint: Marker2D

var startPosition: Vector2
var endPosition: Vector2

@onready var animations = $AnimatedSprite2D

func _ready():
	startPosition = position
	
	if !endPoint:
		endPosition = startPosition + Vector2(0, 3*16)
		return
	
	endPosition = endPoint.global_position

func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length() < limit:
		position = endPosition
		changeDirection()
	velocity = moveDirection.normalized() * 20

func updateAnimation():
	if velocity.y > 0:
		animations.play("move_down")
	else: 
		animations.play("move_up")

func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()
