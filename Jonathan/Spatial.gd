extends Spatial

func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		transform.basis = Basis(Vector3(PI/2,0,0))
	if Input.is_key_pressed(KEY_W):
		#transform.basis = Basis(Vector3(0,,0))
		pass
	if Input.is_key_pressed(KEY_E):
		transform.basis = Basis(Vector3(0,0,1))
	if Input.is_key_pressed(KEY_Q):
		transform.basis = Basis(Vector3(1,0,0))