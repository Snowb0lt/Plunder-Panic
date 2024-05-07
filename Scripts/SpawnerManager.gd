extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
