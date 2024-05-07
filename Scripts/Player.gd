extends CharacterBody2D


const SPEED = 600

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if !GameManager.isMatchOver:
		var direction = Input.get_axis("moveLeft", "moveRight")
		var moveSpeed
		if Input.is_action_pressed("Accel"):
			moveSpeed = SPEED * 2
		else:
			moveSpeed = SPEED

		if direction:
			velocity.x = direction * moveSpeed
		else:
			velocity.x = move_toward(velocity.x, 0, moveSpeed)
		flip_sprite()


func flip_sprite():
	# Flip Sprite when moving to the left
	if Input.is_action_pressed("moveLeft"):
		$Sprite2D.flip_h = true
	if Input.is_action_pressed("moveRight"):
		$Sprite2D.flip_h = false

	move_and_slide()

func _on_catch_area_body_entered(body):
	if body.is_in_group("Coin"):
		body.apply_central_impulse(Vector2(200,-1500))
	if body.is_in_group("Bomb"):
		#end the run
		$Sprite2D.texture = ResourceLoader.load("res://Assets/Pirate Player Exploded.png")
		GameManager.isMatchOver = true;
		print("The Round is over.")
