extends Camera3D

var speed_multiplier = 1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= deg2rad(event.relative.x) / 18
		rotation.x -= deg2rad(event.relative.y) / 18
		rotation.x = clamp( rotation.x, deg2rad(-90), deg2rad(90) )

func _process(delta):
	if Input.is_physical_key_pressed(KEY_SHIFT):
		speed_multiplier = 2.5
	else:
		speed_multiplier = 1

	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	position += direction / 10 * speed_multiplier
	position.y += ( float(Input.is_key_pressed(KEY_SPACE)) - float(Input.is_key_pressed(KEY_CTRL)) )  / 10 * speed_multiplier
