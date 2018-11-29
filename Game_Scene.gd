extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	var cameraSetup = get_node("CameraSetup")
	var firstViewport = cameraSetup.get_child(1)
	
	firstViewport.size.x = 1920
	firstViewport.size.y = 1080
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
