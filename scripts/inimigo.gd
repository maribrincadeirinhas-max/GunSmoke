extends "res://scripts/boss.gd"
@onready var marker_3d: Marker3D = $Marker3D

func atirar():
	pass

func _on_navigation_agent_3d_velocity_computed(safe_velocity: Vector3) -> void:
	velocity = velocity .move_toward(safe_velocity, 0.25)

func drop():
	var chance = 5#randi_range(1,5)
	
	if chance == 5:
		dropar_dinheiro()


func dropar_dinheiro():
	var dinheiro3D = preload("res://scenes/dinheiro.tscn")
	var novo_dinheiro = dinheiro3D.instantiate()
	
	var root_da_cena = get_tree().current_scene
	root_da_cena.add_child(novo_dinheiro)
	
	#novo_dinheiro.global_transform = position.global_transform
	novo_dinheiro.global_transform =global_transform
	
func perder_vida(qtd):
	if vida >0:
		vida -= qtd
		if vida <= 0:
			Gerenciador.pontuar_jogador(150)
			drop()
			queue_free()
