extends Control

@onready var label_arma_pente: Label = $label_arma_pente
@onready var label_munition: Label = $label_munition

func _ready() -> void:
	Gerenciador.municao_mudou.connect(_on_municao_mudou) #Faz ponte avisando que atualizou
	_on_municao_mudou(Gerenciador.balas_atuais, Gerenciador.munition) #Chama a função

func _on_municao_mudou(balas, total):
	label_arma_pente.text = str(balas) + "/" + str(Gerenciador.tamanho_do_pente)
	label_munition.text = str(total)
