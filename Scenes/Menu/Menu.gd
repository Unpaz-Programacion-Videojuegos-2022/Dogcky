extends Control



func _on_Tutorial_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Tutorial/Tutorial.tscn")
	

func _on_Jugar_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Nivel prueba/prueba de movimiento.tscn")
	pass # Replace with function body.
	
func _on_Creditos_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/creditos/creditos.tscn")
	pass # Replace with function body.
	


func _on_Salir_pressed():
	get_tree().quit()
	pass # Replace with function body.
