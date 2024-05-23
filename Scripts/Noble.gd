extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pickSprite()
	launch_object()
	scream_out()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func launch_object():
	#randomly pick starting force
	var randomX = randi_range(300,500)
	var randomY = randi_range(-300, -700)
	var body = $RigidBody2D
	body.apply_central_impulse(Vector2(randomX, randomY))
	body.apply_torque(100000)

func pickSprite():
	var nobleArray = [load("res://Assets/Nobleman-final.png"), load("res://Assets/Noblelady-final.png")]
	$RigidBody2D/MainSprite.texture = nobleArray.pick_random()

func scream_out():
	if ($RigidBody2D/MainSprite.texture == load("res://Assets/Nobleman.png")):
		$ScreamMale.play()
	if ($RigidBody2D/MainSprite.texture == load("res://Assets/Noblelady.png")):
		$ScreamFemale.play()
