extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#flip the sprite because it's supposed to come 
	
	var randomX = randi_range(500,700)
	var randomY = randi_range(-300, -700)
	var body = $RigidBody2D
	body.apply_central_impulse(Vector2(randomX, randomY))
	body.apply_torque(400000)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
