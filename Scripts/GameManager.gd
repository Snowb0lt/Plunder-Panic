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
	if(Input.is_action_just_pressed("muteMusic")) :
		muteMusic()

func updateScore():
	scoreLabel.text = "Score: " + str(score)

#counts how many of each item collected for final scoring
var NoblesTaken = 0
var ChestsTaken = 0
var SuppliesGiven = 0
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
			ChestsTaken += 1

		if body.is_in_group("Nobility"):
			score += 1000
			NoblesTaken += 1


		updateScore()
		body.queue_free()

func _on_score_area_supplies_body_entered(body):
	if body.is_in_group("Supplies"):
		$Sounds/Healed.play()
		SuppliesGiven += 1
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
	LoadStats()

@onready var gameOverUI = get_node("UI/GameOverUI")
@onready var stats = get_node("UI/GameOverUI/Stats")
func LoadStats():
	gameOverUI.visible = true
	stats.text = "Total Score in Loot: " + str(score) + "\nTotal Chests Plundered: " + str(ChestsTaken) + "\nMembers of the Nobility Kidnapped: " + str(NoblesTaken) + "\nSupplies Transferred: " + str(SuppliesGiven)

#Menu Functions
func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

@onready var gameMusic = get_node("Sounds/BackgroundMusic")
@onready var isMusicPlaying = true
func muteMusic():
	isMusicPlaying = !isMusicPlaying
	if (!isMusicPlaying):
		gameMusic.stop()
	else:
		gameMusic.play()
