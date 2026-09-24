extends Control

@onready var label: Label = $Label


func _ready() -> void:
	label.text = "SCORE: " + str(Gerenciador.pontuacao)

func _on_button_button_down() -> void:
	pass
	#get_tree().change_scene_to_file()
