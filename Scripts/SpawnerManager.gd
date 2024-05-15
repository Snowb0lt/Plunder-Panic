extends Node2D

#Timers
#@onready var treasure_timer = $"Treasure Timer"
#@onready var bomb_timer = %"Bomb Timer"

@onready var TresThisRound = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Spawner management
@onready var enemyShip = get_node("Spawners (Boarded Ship)")
@onready var friendlyShip = get_node("Spawner (Friendly Ship)")
#For Treasure
var coins = preload("res://coin.tscn")
func spawnTreasure(pos):
	var obj =  coins.instantiate()
	obj.position = pos
	add_child(obj)

#For Bomb
var bomb = preload("res://bomb.tscn")
func spawnBomb(pos):
	var obj =  bomb.instantiate()
	obj.position = pos
	add_child(obj)

#For Supplies
var healthBarrel = preload("res://health_barrel.tscn")
func spawnHealth(pos):
	var obj = healthBarrel.instantiate()
	obj.position = pos
	add_child(obj)

func _on_treasure_timer_timeout(): 
	spawnTreasure(enemyShip.position)
	TresThisRound += 1
	print(TresThisRound)


func _on_bomb_timer_timeout():
	spawnBomb(enemyShip.position)
	
#func stopSpawning():
	#treasure_timer.stop()
	#bomb_timer.stop()

func StopTimers():
	$"Spawners (Boarded Ship)/Treasure Timer".stop()
	$"Spawners (Boarded Ship)/Bomb Timer".stop()
	$"Spawner (Friendly Ship)/Supply Timer".stop()


func _on_supply_timer_timeout():
	spawnHealth(friendlyShip.position)
