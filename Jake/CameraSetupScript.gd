extends Spatial

onready var viewports = [get_node("UI/Viewport"), get_node("UI/Viewport2"),
	get_node("UI/Viewport3"), get_node("UI/Viewport4")]
onready var sprites = [get_node("UI/Sprite"), get_node("UI/Sprite2"),
	get_node("UI/Sprite3"), get_node("UI/Sprite4")]
onready var cameras = [get_node("UI/Viewport/Camera"), get_node("UI/Viewport2/Camera2"),
	get_node("UI/Viewport3/Camera3"), get_node("UI/Viewport4/Camera4")]
var size_1player_window = Vector2(1024, 600)
var size_2player_window = Vector2(640, 720)
var size_3rdplayer_window = Vector2(1024, 300)
var size_4player_window = Vector2(512, 300)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func set_vector2(a, b):
	# Helper function to assign vector2 b to vector2 a
	a.x = b.x
	a.y = b.y

func setup_cameras(car_array):
	# Sets up the cameras to follow the respective players and resizes viewports based on
	# number of players.
	
	# Number of cars equal number of players
	var number_of_players = len(car_array)

	# Resize Sprites to fit correct display settings
	if number_of_players == 1:
		print("one player!")
		set_vector2(viewports[0].size, size_1player_window)
		sprites[0].visible = true
		
	elif number_of_players == 2:
		print("two player!")
		for index in range(2):
			print(viewports[index].size)
			viewports[index].size.x = size_2player_window.x
			viewports[index].size.y = size_2player_window.y
			print(viewports[index].size)
			sprites[index].visible = true
			print(sprites[index].visible)

	elif number_of_players == 3:
		for index in range(3):
			if index < 2:
				set_vector2(viewports[index].size, size_4player_window)
			else:
				set_vector2(viewports[index].size, size_3rdplayer_window)
			sprites[index].visible = true

	else:
		for index in range(4):
			set_vector2(viewports[index].size, size_4player_window)
			sprites[index].visible = true

	# Parent each necessary camera to each car
	for index in range(2):
		cameras[index].set_path(car_array[index])
	