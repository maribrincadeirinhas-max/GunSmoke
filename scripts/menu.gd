extends Control
@onready var push_start: Button = $PushStart
@onready var score_number: Label = $ScoreNumber



func _ready() -> void:
	# Verifica se o menu voltou de uma partida
	if Gerenciador.mostrar_score:
		push_start.visible = true
		score_number.visible = true
		score_number.text = str(Gerenciador.pontuacao)
	else:
		# Primeira vez que o jogo abre
		push_start.visible = true
		score_number.visible = false
		score_number.text = ""


func _input(event: InputEvent) -> void:
	# Enter ou Espaço
	if event.is_action_pressed("ui_accept"):
		iniciar_jogo()


func _on_push_start_pressed() -> void:
	iniciar_jogo()


func iniciar_jogo() -> void:
	# Evita iniciar duas vezes
	if not push_start.visible:
		return

	# Começa uma nova partida
	Gerenciador.iniciar_nova_partida()


	get_tree().change_scene_to_file("res://scenes/faroeste.tscn")
