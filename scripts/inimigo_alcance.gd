extends inimigos

@warning_ignore("unused_parameter")
func ir_para_o_jogador(position_alvo : Vector3):
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if alvo:
		verificar_visao()
			
		if visto:
			ir_para_o_jogador(alvo.global_position)
			var olhar_para_o_jogador = alvo.global_position
			look_at(olhar_para_o_jogador, Vector3.UP)
			if not atirou:
				atirar()
		else:
			velocity.x = move_toward(velocity.x, 0, speed * delta)
			velocity.z = move_toward(velocity.z, 0, speed * delta)
	
	move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var colisao = get_slide_collision(i)
		var objeto = colisao.get_collider()
		
		if objeto.has_method("tomar_dano"):
			objeto.tomar_dano(dano)
