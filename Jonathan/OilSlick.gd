extends Area

var lifetime = 15;		#oil lasts for 3 seconds
var grav = -12;
var velocity = Vector3();
var base = 1; 			#base scale
var growth = 0.7;		#growth multiplier


func _process(delta):

	if (lifetime > 12):
		var size = base + (15-lifetime)*growth
		set_scale(Vector3(size, 1, size))

	lifetime -= delta
	if (lifetime <= 0):

		queue_free()
		print("OIL DESPAWNED")

	
##DEBUG CHECK FOR TRAIN
#func _on_OilSlick_body_entered(body):
#	if body is VehicleWheel:
#		print("HONK")
	