extends Spatial

var timer = null
var respawn_delay = 5
var child_to_respawn = null

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(respawn_delay)
	timer.connect("timeout", self, "_respawn_object")
	add_child(timer)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func process_pickup(node):
	child_to_respawn = node
	remove_child(node)
	timer.start()

func _respawn_object():
	add_child(child_to_respawn)
	child_to_respawn = null