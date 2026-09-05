extends CharacterBody3D


const SPEED = 7.0
const JUMP_VELOCITY = 6.5
var sensibilidade = 0.003
var MOUSE_CAPTURADO = false
var pulo = 4.5

var camera_rotation: Vector2
var limite_cima = -85
var limite_baixo = 85
@onready var cabeca: Node3D = $cabeca

@onready var vida : int = 100:
	set(value):
		vida = value
#signal vida_alterada

var atirou: bool = false
var recarregando: bool = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	MOUSE_CAPTURADO = true
	camera_rotation.y = rotation.y
	camera_rotation.x = rotation.x

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5

	# Handle jump.
	if Input.is_action_just_pressed("pulo") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("esquerda", "direita", "frente", "tras")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		MOUSE_CAPTURADO = false
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if MOUSE_CAPTURADO and event is InputEventMouseMotion:
		camera_rotation.x -= event.relative.y * sensibilidade
		camera_rotation.x = clamp(camera_rotation.x, deg_to_rad(limite_cima), deg_to_rad(limite_baixo))
		camera_rotation.y -= event.relative.x * sensibilidade
		transform.basis = Basis()
		rotate_y(camera_rotation.y)
		cabeca.transform.basis = Basis()
		cabeca.rotate_x(camera_rotation.x)
		#rotate_y(-event.relative.x * sensibilidade) #rotate_look(event.relative)

func derrota():
	print("Você morreu")
