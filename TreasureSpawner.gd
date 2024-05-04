extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var spawnTimer = $Timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#spawning the gold coins
var coins = preload("res://coin.tscn")
func spawnTreasure():
	var obj =  coins.instantiate()
	add_child(obj)


func _on_timer_timeout():
	spawnTreasure()
