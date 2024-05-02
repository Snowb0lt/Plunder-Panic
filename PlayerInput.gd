extends CharacterBody2D


@export var maxSpeed = 300

@export var Acceleration = 1500

@export var Friction = 1200

@onready var axis = Vector2.ZERO



func _physics_process(delta):
	move(delta)
	
	
	
func get_input_axis():
	axis.x = int(Input.is_action_just_pressed("moveRight")) - int(Input.is_action_just_pressed("moveLeft"))
	return axis.normalized()
	
	
	
func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(Friction * delta)
	
	else:
		apply_movement(axis * Acceleration * delta)
	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	
	else:
		velocity = Vector2.ZERO


func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(maxSpeed) 
