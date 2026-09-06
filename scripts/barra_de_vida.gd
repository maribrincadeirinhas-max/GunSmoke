extends ProgressBar

@export var jogador : CharacterBody3D

func _ready() -> void:
	jogador.vida_alterada.connect(atualizar_vida)
	atualizar_vida()

func atualizar_vida():
	value = jogador.vida
