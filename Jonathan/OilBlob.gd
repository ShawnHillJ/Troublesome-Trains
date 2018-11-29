extends KinematicBody

var gravity = -15
var velocity = Vector3()

onready var OilAsset = preload("res://Jonathan/OilSlick.tscn") #change path in final product?

func _ready():
	transform.basis = transform.basis.rotated(Vector3 (0,1,0), rand_range(0 , 2*PI))

func _process(delta):

	if $NormalCheck.is_colliding() == true:
		print("LALALAL")
		var OilNormal = $NormalCheck.get_collision_normal()
		var OilPoint = $NormalCheck.get_collision_point()
		
		print(OilNormal);
		
		var Oil = OilAsset.instance()
		get_tree().get_root().add_child(Oil)
		Oil.global_transform.origin = OilPoint
#		OilNormal = OilNormal * Vector3(0, 1, 0)
		
		Oil.look_at(Oil.global_transform.origin + OilNormal, Vector3(0,1,0))
		if Oil.get_rotation().x != 0 :
			Oil.set_rotation( Oil.get_rotation() + Vector3(deg2rad(90),0,0))
		
		#Oil.transform.basis = Basis(OilNormal)

		print("OIL SPAWNED")
		queue_free();
	
func _physics_process(delta):
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector3(0,1,0))
