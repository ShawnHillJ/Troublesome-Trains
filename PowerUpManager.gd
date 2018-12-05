extends Spatial

enum powerups {empty, oil, explosion, smokescreen}
var powerupnumber = 3 #number of different powerups
var PowerUpArray = [0,0,0,0,0,0] 
var buffer = 0.3

onready var OilSpawner = preload("res://Jonathan/OilSpawner.tscn") #change path in final product?


func _ready():
	randomize()

func _process(delta):
	#DEBUG INPUTS
	
	if buffer <= 0:
		if Input.is_key_pressed(KEY_Q):
			AddPowerUp()				#add random powerup to array, just like collecting powerup in-game
			print(PowerUpArray)
		elif Input.is_key_pressed(KEY_1):
			AddPowerUpSpecial(powerups.oil)
			print(PowerUpArray)
		elif Input.is_key_pressed(KEY_2):
			AddPowerUpSpecial(powerups.explosion)
			print(PowerUpArray)
		elif Input.is_key_pressed(KEY_3):
			AddPowerUpSpecial(powerups.smokescreen)
			print(PowerUpArray)
			
		elif Input.is_key_pressed(KEY_SPACE):
			UsePowerUp()
			print(PowerUpArray)
		buffer = 0.3
	buffer -= delta


func AddPowerUp():
	var pos = PowerUpArray.find(0)
	if pos != -1:
		PowerUpArray[pos] = randi()%powerupnumber+1
		get_parent().UIPath.update_items_panel(PowerUpArray)
		get_parent().get_child(3).add_powerup(0)

func AddPowerUpSpecial(specific):
	var pos = PowerUpArray.find(0)
	if pos != -1:
		PowerUpArray[pos] = specific
		get_parent().UIPath.update_items_panel(PowerUpArray)
		get_parent().get_child(3).add_powerup(0)

func UsePowerUp():
	if PowerUpArray[0] == powerups.oil:
		UseOil()
	elif PowerUpArray[0] == powerups.explosion:
		UseExplosion()
	elif PowerUpArray[0] == powerups.smokescreen:
		UseSmokescreen()
	PowerUpArray.append(powerups.empty)
	PowerUpArray.pop_front()
	get_parent().UIPath.update_items_panel(PowerUpArray)

func UseOil():
	var OilSpawnerInstance = OilSpawner.instance()
	add_child(OilSpawnerInstance)
	pass

func UseExplosion():
	pass

func UseSmokescreen():
	pass