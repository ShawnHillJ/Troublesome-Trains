extends KinematicBody

var speed = 200
var direction = Vector3()
var gravity = -10
var velocity = Vector3()
var OilNormal = Vector3(0,0,0)

onready var OilAsset = preload("res://Jonathan/OilSlick.tscn") #change path in final product?
var oilcounter = 0.3

#func _ready():
#	$NormalCheck.add_exception(self)
#
#
#
func _process(delta):
#	if Input.is_key_pressed(KEY_SPACE):
#		print($NormalCheck.get_collider())
#		print($NormalCheck.get_collision_normal())
#
#	OilNormal = $NormalCheck.get_collision_normal()
	
	if Input.is_key_pressed(KEY_SPACE):
		oilcounter -= delta
		if (oilcounter <= 0):
			oilcounter = 0.3
			var Oil = OilAsset.instance()
			#var MyPosition = Vector3(self.x, self.y, self.z)
			get_tree().get_root().add_child(Oil)
			#Oil.set_transform(get_transform())
			Oil.set_translation(Vector3(get_translation().x, get_translation().y - 1.5, get_translation().z))
			Oil.set_rotation(OilNormal)
			print("OIL SPAWNED")

func _physics_process(delta):
	#MOVEMENT
	direction = Vector3(0,0,0)
	if Input.is_key_pressed(KEY_H):
		self.direction.x -= 1
	if Input.is_key_pressed(KEY_K):
		self.direction.x += 1
	if Input.is_key_pressed(KEY_U):
		self.direction.z -= 1
	if Input.is_key_pressed(KEY_J):
		self.direction.z += 1
	
	#direction = direction.normalized()			#converts vector into unit vector (all components are 1). Doesn't matter for this example.
	direction = direction * speed * delta 		#delta is the time elapsed in seconds between each process call
												#delta multipliers make direction independent of frame rate
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z

	velocity = move_and_slide(velocity, Vector3(0,1,0))
