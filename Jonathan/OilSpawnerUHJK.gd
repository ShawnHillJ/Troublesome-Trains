extends KinematicBody

var speed = 200
var direction = Vector3()
var gravity = -10
var velocity = Vector3()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	direction = Vector3(0,0,0)
	if Input.is_key_pressed(KEY_H):
		self.direction.x -= 10
	if Input.is_key_pressed(KEY_K):
		self.direction.x += 10
	if Input.is_key_pressed(KEY_U):
		self.direction.z -= 10
	if Input.is_key_pressed(KEY_J):
		self.direction.z += 10
	
	direction = direction.normalized()
	direction = direction * speed * delta 		#delta is the time elapsed in seconds between each process call
												#delta multipliers make direction independent of frame rate
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
