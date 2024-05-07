extends Node2D

var score = 0
var scoreLabel

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
