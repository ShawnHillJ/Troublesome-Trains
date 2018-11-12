extends Area

var lifetime = 15		#oil lasts for 3 seconds
var grav = -12
var velocity = Vector3()
var base = 1 			#base scale
var growth = 0.7		#growth multiplier
var normalized = false


func _physics_process(delta):
	
	if (normalized == false):
		var space_state = get_world().direct_space_state
		var result = space_state.intersect_ray(
												Vector3(get_translation().x, get_translation().y +1, get_translation().z),
												Vector3(get_translation().x, get_translation().y - 5, get_translation().z),
												[self.name])

												#OR

#												Vector3(get_translation().x, get_translation().y +1, get_translation().z),
#												Vector3(get_translation().x, get_translation().y - 5, get_translation().z),
#												[], 2147483647, true, true)


												#NEITHER WORK

		print(result.collider.name)
		print(result.normal)
		set_rotation(result.normal)
		normalized = true

func _process(delta):
	if (lifetime > 12):
		var size = base + (15-lifetime)*growth
		set_scale(Vector3(size, 1, size))
	
	lifetime -= delta
	if (lifetime <= 0):
		
		queue_free()
		print("OIL DESPAWNED")
		
#DEBUG CHECK FOR TRAIN
func _on_OilSlick_body_entered(body):
	if body is VehicleWheel:
		print("HONK")
	