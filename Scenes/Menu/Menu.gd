extends Control



func _on_Tutorial_pressed():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")


func _on_Salir_pressed():
	get_tree().quit()


func _on_Jugar_pressed():
	get_tree().change_scene("res://Scenes/prueba de movimiento.tscn")


func _on_Creditos_pressed():
	get_tree().change_scene("res://Scenes/creditos.tscn")
