extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var gravity = -9.8
var velocity = Vector3()
var steering_angle = 0.0
onready var camera = get_node("")
onready var powerup_handler = get_node("Powerup_Node")
onready var joints = get_node("Joints")
onready var UIpath = get_node("")

#Powerup Effects
var is_sliding = false


const SPEED = 40
const ACCELERATION = 0.5
const DE_ACCELERATION = 2

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#direction = get_node("").get_global_transform().basis
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func apply_explosion(vec):
	velocity = velocity + vec

func _physics_process(delta):
	
	var basis = camera.get_global_transform()
	
	var direction = Vector3()
	var rotation = get_rotation()
	
	if Input.is_action_pressed("Forward"):
		direction += -basis[2]
	elif Input.is_action_pressed("Backward"):
		direction += basis[2]
		
	#direction = direction.normalized()
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y += delta * gravity

	var hv = velocity
	hv.y = 0
	
	var new_pos = direction * SPEED
	if not Input.is_action_pressed("Drift") or not is_sliding:
		new_pos *= 0.5
		
	var accel = DE_ACCELERATION
	if (direction.dot(hv) > 0):
		accel = ACCELERATION
	if is_on_floor():
		if Input.is_action_pressed("Drift"):
		    hv = hv.linear_interpolate(new_pos, accel * delta)
		else:
			hv = hv.linear_interpolate(new_pos, accel * 5 * delta)
	velocity.x = hv.x
	velocity.z = hv.z
	
		
	# Steering
	if  velocity.length() > 0.3:
		if Input.is_action_pressed("Left"):
			steering_angle = lerp(steering_angle, ramp(rad2deg(steering_angle), false) * deg2rad(1), 5 * delta)
			rotation.y += steering_angle
		elif Input.is_action_pressed("Right"):
			steering_angle = lerp(steering_angle, ramp(rad2deg(steering_angle), true) * deg2rad(-1), 5 * delta)
			rotation.y += steering_angle
		else:
			steering_angle = lerp(steering_angle, 0, 10 * delta)
			rotation.y += steering_angle
	
#	print("steering_angle:", steering_angle)
#	print("Is on ground", is_on_floor())
#	print("velocity", velocity)

#	Powerup effects to train dynamics
#	if oil
	
	set_rotation(rotation)
	move_and_slide(velocity, Vector3(0,1,0), 0.05, 4, deg2rad(50))

func ramp(val, ramp_direction): #ramps the value to a specified number
	if not ramp_direction and val < 0:
		return 2
	elif ramp_direction and val > 0:
		return 2
	return 1
	
func hit_pickup():
	powerup_handler.add_powerup()