extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var autoload = null

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	autoload = get_node("/root/Autoload")
	print("number of players is", autoload.player_count)

	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
