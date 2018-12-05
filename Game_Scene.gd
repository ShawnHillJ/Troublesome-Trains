extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var autoload = get_node("/root/Autoload")
onready var camera_setup = get_node("CameraSetup")
onready var car = load("res://PlayerTrain.tscn")
var cars = []

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print("number of players is", autoload.player_count)
	for x in range(2):
		var new_car = car.instance()
		new_car.set_name("Player" + String(x + 1))
		print(new_car.name)
		self.add_child(new_car)
		new_car.global_transform.origin = Vector3(25, 2, -8 + (16*x))
		new_car.set_rotation(Vector3 (0, deg2rad(-90), 0))
		new_car.set_player_num(x+1)
		cars.append(get_node("Player" + String(x + 1)))
	camera_setup.setup_cameras(cars)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
