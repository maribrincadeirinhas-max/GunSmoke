extends Control

@onready var label: Label = $Label


func _ready() -> void:
	label.text = "SCORE: " + str(Gerenciador.pontuacao)
	Gerenciador.finalizar_partida()

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
