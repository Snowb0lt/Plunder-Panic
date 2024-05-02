extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("moveLeft", "moveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	flip_sprite()

func flip_sprite():
	# Flip Sprite when moving to the left
	if Input.is_action_pressed("moveLeft"):
		$Sprite2D.flip_h = true
	if Input.is_action_pressed("moveRight"):
		$Sprite2D.flip_h = false

	move_and_slide()


func _on_catch_area_area_entered(area):
	if area.is_in_group("Coin"):
		print("Coin")
		
func _on_catch_area_body_entered(body):
	if body.is_in_group("Coin"):
		body.apply_central_impulse(Vector2(200,-1500))
