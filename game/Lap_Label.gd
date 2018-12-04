extends Label

# class member variables go here, for example:
# var a = 2
var lap = 1

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func update_lap(lap):
	self.text = "Lap " + String(lap) + " / 3"

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
