extends Node

var vida_jogador: int = 100
var pontuacao: int = 0
var boss_derrotado = false

signal pontuacao_mudou(pontu)

func pontuar_jogador(ptc: int):
	pontuacao += ptc
	
	atualizar_IU()

func atualizar_IU():
	pontuacao_mudou.emit(pontuacao)
