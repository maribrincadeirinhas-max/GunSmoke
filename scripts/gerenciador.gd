extends Node

var vida_jogador: int = 100
var pontuacao: int = 0
var boss_derrotado: bool = false

var mostrar_score: bool = false

signal pontuacao_mudou(pontu)


func pontuar_jogador(ptc: int):
	pontuacao += ptc
	atualizar_IU()


func atualizar_IU():
	pontuacao_mudou.emit(pontuacao)


func iniciar_nova_partida():
	pontuacao = 0
	boss_derrotado = false
	vida_jogador = 100
	mostrar_score = false

	atualizar_IU()


func finalizar_partida():
	mostrar_score = true
