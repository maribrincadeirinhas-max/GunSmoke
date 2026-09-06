extends Area3D

const speed = 45.0
const alcance = 40.0
@export var dano = 25

var distancia_deslocamento = 0.0

func _ready() -> void:
	add_to_group("bullet")

func _physics_process(delta: float) -> void:
	position += -transform.basis.z * speed * delta
	distancia_deslocamento += speed * delta
	if distancia_deslocamento > alcance:
		queue_free()

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("perder_vida"):
		body.perder_vida(dano)
		print("Colidiu com1: " + str(body))
	
	queue_free()
