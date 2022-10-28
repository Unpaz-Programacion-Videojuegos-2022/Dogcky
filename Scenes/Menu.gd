extends Control



func _on_Tutorial_pressed():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")


func _on_Salir_pressed():
	get_tree().quit()
