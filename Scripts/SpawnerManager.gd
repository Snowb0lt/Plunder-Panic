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

#For Treasure
var coins = preload("res://coin.tscn")
var noble = preload("res://Noble.tscn")
var chest = preload("res://treasure_chest.tscn")
@onready var treasureArray = [coins, noble, chest]
func spawnTreasure(pos, object):
	var obj =  object.instantiate()
	obj.position = pos
	add_child(obj)

func _on_treasure_timer_timeout(): 
	var randomSelection = randi_range(0,100)
	if (randomSelection >=0 && randomSelection < 70):
		spawnTreasure(enemyShip.position, coins)
	if (randomSelection >= 71 && randomSelection < 80):
		spawnTreasure(enemyShip.position, noble)
	if (randomSelection >= 81 && randomSelection <= 100):
		spawnTreasure(enemyShip.position, chest)
	else:
		pass
	TresThisRound += 1


func _on_bomb_timer_timeout():
	spawnBomb(enemyShip.position)
	$"../Sounds/Cannon".play()
	
#func stopSpawning():
	#treasure_timer.stop()
	#bomb_timer.stop()

func StopTimers():
	$"Spawners (Boarded Ship)/Treasure Timer".stop()
	$"Spawners (Boarded Ship)/Bomb Timer".stop()
	$"Spawner (Friendly Ship)/Supply Timer".stop()


func _on_supply_timer_timeout():
	spawnHealth(friendlyShip.position)
