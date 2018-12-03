extends KinematicBody

var speed = 200
var direction = Vector3()
var gravity = -10
var velocity = Vector3()
var OilNormal = Vector3(0,0,0)

onready var OilAsset = preload("res://Jonathan/OilSlick.tscn") #change path in final product?
onready var OilBlobAsset = preload("res://Jonathan/OilBlob.tscn") #change path in final product?

var oilcounter = 0.3

#
func _process(delta):

	OilNormal = $NormalCheck.get_collision_normal()
	
	if Input.is_key_pressed(KEY_SPACE):
		oilcounter -= delta
		if (oilcounter <= 0):
			oilcounter = 0.3
			var Oil = OilAsset.instance()
			get_tree().get_root().add_child(Oil)
			Oil.set_translation(Vector3(get_translation().x, get_translation().y - 1.5, get_translation().z))
			
			Oil.transform.basis = Basis(OilNormal)

			print($NormalCheck.get_collision_normal())
			print("OIL SPAWNED")
			
	if Input.is_key_pressed(KEY_B):
		oilcounter -= delta
		if (oilcounter <= 0):
			oilcounter = 0.3
			var OilBlob = OilBlobAsset.instance()
			get_tree().get_root().add_child(OilBlob)
			OilBlob.set_translation(Vector3(get_translation().x, get_translation().y, get_translation().z));
			OilBlob.velocity.y = 3;
			#OilBlob.transform.basis = Basis(Vector3(OilNormal.x , OilNormal.y * 2, OilNormal.z ))
			
			print("BLOB")
		
		

func _physics_process(delta):
	#MOVEMENT
	direction = Vector3(0,0,0)
	if Input.is_key_pressed(KEY_U):
		self.direction.x -= 1
	if Input.is_key_pressed(KEY_J):
		self.direction.x += 1
	if Input.is_key_pressed(KEY_K):
		self.direction.z -= 1
	if Input.is_key_pressed(KEY_H):
		self.direction.z += 1
	
	#direction = direction.normalized()			#converts vector into unit vector (all components are 1). Doesn't matter for this example.
	direction = direction * speed * delta 		#delta is the time elapsed in seconds between each process call
												#delta multipliers make direction independent of frame rate
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z

	velocity = move_and_slide(velocity, Vector3(0,1,0))
