extends Node2D

#Timers
#@onready var treasure_timer = $"Treasure Timer"
#@onready var bomb_timer = %"Bomb Timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#For Treasure
var coins = preload("res://coin.tscn")
func spawnTreasure():
	var obj =  coins.instantiate()
	add_child(obj)

#For Bomb
var bomb = preload("res://bomb.tscn")
func spawnBomb():
	var obj =  bomb.instantiate()
	add_child(obj)

#For Supplies


func _on_treasure_timer_timeout(): 
	spawnTreasure()


func _on_bomb_timer_timeout():
	spawnBomb()
	
#func stopSpawning():
	#treasure_timer.stop()
	#bomb_timer.stop()

func StopTimers():
	$"Treasure Timer".stop()
	$"Bomb Timer".stop()
