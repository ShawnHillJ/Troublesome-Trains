extends Spatial

var viewports = []
var cameras = []
var size_1player_window = Vector2(1024, 600)
var size_2player_window = Vector2(512, 300)
var size_3rdplayer_window = Vector2(1024, 300)
var size_4player_window = Vector2(512, 300)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	var viewports = [get_node("UI/Sprite"), get_node("UI/Sprite2"),
	get_node("UI/Sprite3"), get_node("UI/Sprite4")]
	
	var cameras = [get_node("UI/Viewport/Camera"), get_node("UI/Viewport2/Camera2"),
	get_node("UI/Viewport3/Camera3"), get_node("UI/Viewport4/Camera4")]
	
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
		set_vector2(viewports[0].size, size_1player_window)
		viewports[0].visible = true
		
	elif number_of_players == 2:
		for index in range(2):
			set_vector2(viewports[index].size, size_2player_window)
			viewports[index].visible = true

	elif number_of_players == 3:
		for index in range(3):
			if index < 2:
				set_vector2(viewports[index].size, size_4player_window)
			else:
				set_vector2(viewports[index].size, size_3rdplayer_window)
			viewports[index].visible = true

	else:
		for index in range(4):
			set_vector2(viewports[index].size, size_4player_window)
			viewports[index].visible = true

	# Parent each necessary camera to each car
	for index in range(4):
		cameras[index].set_path(car_array[index])
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
