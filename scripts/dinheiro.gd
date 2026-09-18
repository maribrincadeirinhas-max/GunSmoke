extends CharacterBody3D
func _physics_process(delta: float) -> void:
	velocity = get_gravity() * delta * 40.0
	
	move_and_slide()



func _on_dinheiroarea_body_entered(body: Node3D) -> void:
	if body.is_in_group("jogador"):
		Gerenciador.pontuar_jogador(100)
		queue_free()
