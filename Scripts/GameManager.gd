extends Node2D

var score = 0
var scoreLabel
@export var lives = 5
#check if match is over
var isMatchOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	scoreLabel = $UI/ScoreText


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateScore():
	scoreLabel.text = "Score: " + str(score)

#Handles the walls and collection of treasure and supplies
func _on_score_area_treasure_body_entered(body):
#If it's a coin
	if body.is_in_group("Treasure"):
		if body.is_in_group("Coin"):
			score += 100
			$Sounds/Coin.play()
		if body.is_in_group("Chest"):
			score += 500
			$"Sounds/Chest Spill".play()

		if body.is_in_group("Nobility"):
			score += 1000


		updateScore()
		body.queue_free()

func _on_score_area_supplies_body_entered(body):
	if body.is_in_group("Supplies"):
		$Sounds/Healed.play()
		body.queue_free()

#Checks to see how many crew are remaining
@onready var crew_left = 5
func crew_check():
	print(crew_left)
	if crew_left == 0:
		StopGame()
	else:
		pass

@onready var sailor_sprites = $"UI/Crew Container"
@onready var livesArray = [$"UI/Crew Container/Crew Sprite/Sprite2D",$"UI/Crew Container/Crew Sprite2/Sprite2D",$"UI/Crew Container/Crew Sprite3/Sprite2D",$"UI/Crew Container/Crew Sprite4/Sprite2D",$"UI/Crew Container/Crew Sprite5/Sprite2D"]
#Takes away a sailor
func killCrew():
	livesArray[crew_left-1].set_frame(1)
	crew_left -= 1
	crew_check()

#Stops the game
func StopGame():
	print("The Game Is Over")
	$Spawners.StopTimers()
	isMatchOver = true



