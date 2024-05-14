extends Node2D

var score = 0
var scoreLabel
var lives = 5
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

func _on_score_area_treasure_body_entered(body):
	if body.is_in_group("Coin"):
		score += 100
		updateScore()
	if body.is_in_group("Bomb"):
		pass

#Checks to see how many crew are remaining
var crew_left = 5
func crew_check():
	if crew_left == 0:
		StopGame()
	else:
		pass

@onready var sailor_sprites = $"UI/Crew Container"
var livesArray = [$"UI/Crew Container/Crew Sprite/Sprite2D",$"UI/Crew Container/Crew Sprite2/Sprite2D",$"UI/Crew Container/Crew Sprite3/Sprite2D",$"UI/Crew Container/Crew Sprite4/Sprite2D",$"UI/Crew Container/Crew Sprite5/Sprite2D"]
#Takes away a sailor
func killCrew():
	livesArray[lives-1].set_frame(1)
	lives -= 1
	

#Stops the game
func StopGame():
	$Spawners.StopTimers()
	if !isMatchOver:
		isMatchOver
