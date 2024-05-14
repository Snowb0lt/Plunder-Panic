extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Treasure"):
		body.queue_free()
	#Lose a crew if supplies falls
	if body.is_in_group("Supplies"):
		var GameManager = $"../.."
		GameManager.killCrew()
		body.queue_free()
	#Lose the game if bomb is dropped
	if body.is_in_group("Bomb"):
		body.queue_free()
