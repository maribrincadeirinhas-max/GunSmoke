extends Control

@onready var label_pontuacao: Label = $label_pontuacao

func _ready() -> void:
	Gerenciador.pontuacao_mudou.connect(_on_pontuacao_mudou) #Faz ponte avisando que atualizou
	_on_pontuacao_mudou(Gerenciador.pontuacao) #Chama a função

func _on_pontuacao_mudou(total):
	label_pontuacao.text = str(total)
