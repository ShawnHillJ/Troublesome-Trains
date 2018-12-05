extends Spatial

export var RESPAWN_DELAY = 5

var timer = null
var child_to_respawn = null

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	transform.basis = transform.basis.rotated(Vector3 (1,0,0), PI/4)
	transform.basis = transform.basis.rotated(Vector3 (0,0,1), PI/4)
	
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(RESPAWN_DELAY)
	timer.connect("timeout", self, "_respawn_object")
	add_child(timer)
	pass
	
func _process(delta):
	transform.basis = transform.basis.rotated(Vector3 (0,0,1), PI/12)


func process_pickup(node):
	child_to_respawn = node
	remove_child(node)
	timer.start()

func _respawn_object():
	add_child(child_to_respawn)
	child_to_respawn = null