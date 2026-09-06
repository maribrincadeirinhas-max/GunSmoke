extends Node

var vida_jogador: int = 100
var balas_atuais: int = 6
var tamanho_do_pente: int = 6
var munition: int = 10

signal municao_mudou(balas, tot_muni)

func atirou(tiro: int):
	balas_atuais -= tiro
	
	#if balas_atuais == 0:
		#recarregar_pente(munition)
	
	atualizar_IU()

func recarregar_pente():
	if munition == 0:
		return
	
	var espaco_no_pente = tamanho_do_pente - balas_atuais
	var recarregar = min(espaco_no_pente, munition) # significa minimo
	
	balas_atuais += recarregar
	munition -= recarregar
	
	atualizar_IU()

func atualizar_IU():
	municao_mudou.emit(balas_atuais, munition)
