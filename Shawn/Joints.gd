extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var joints = []
var items = 0

var explosive_car = load("res://Traincar_Explosive.tscn")
var oil_car = load("res://Oilcar.tscn")
var cars = [oil_car, explosive_car]
var powerups = []

onready var joint1 = get_node("Joint1")
onready var outer_parent = get_node("../")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	joint1.set_node_a(get_path())


func add_powerup(type):
	var current_joint = joint1
	if items != 0:
		current_joint = joints[items - 1]
		
	var new_car_instance = cars[type].instance()
	var newname = "powerup" + String(items)
	new_car_instance.set_name(newname)
	add_child_below_node(new_car_instance, outer_parent)
	powerups.append(new_car_instance)
#	var new_car = get_node("../../../" + newname)
	
	if current_joint == joint1:
		current_joint.set_node_b(new_car_instance.get_path())
		return
		
	else:
		var new_joint = joint1.instance()
		add_child(new_joint)
		joints.append(new_joint)
		new_joint.set_node_a(joints[-2].get_path())
		new_joint.set_node_b(null)
		
	
	
#	current_joint.nodes.node_b = new_car_path
	

func remove_powerup():
	if items == 0:
		return
	
	elif items > 2:
		powerups[-1].queue_free()
		joints[-1].queue_free()
		powerups[-1].remove(-1)
		joints[-1].remove(-1)
		joints[-1].set_node_b(null)
	
	else:
		joint1.remove
	
	
func _shift_joint_nodes(j1, j2):
#	Moves the item stored in j2.b to j2.a and sets j2.a
	pass