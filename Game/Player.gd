extends Spatial

var speed = .5

var shot_cooldown = 1

var count = 0

func _process(_delta):
	#movement
	var input_vector = Vector2.ZERO
	input_vector.x = -Input.get_action_strength("left") + Input.get_action_strength("right")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	global_translate(Vector3(input_vector.x * speed, 0, input_vector.y * speed))

	#rotation
	var c_input_vector = Vector2.ZERO
	c_input_vector.x = \
		Input.get_action_strength("c_left") - Input.get_action_strength("c_right")
	c_input_vector.y = \
		Input.get_action_strength("c_down") - Input.get_action_strength("c_up")
		
	var angle = atan2(-c_input_vector.x, c_input_vector.y)
	var rotation = get_rotation()
	rotation.y = angle
	set_rotation(rotation)

	#shooting
	if Input.is_action_pressed("shoot"):
		var bullet = preload("res://Bullet.tscn").instance()
		bullet.init(get_global_transform().basis.z)
		bullet.translation = get_translation()
		get_parent().add_child(bullet)
