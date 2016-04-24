
extends Node2D

func _ready():
	pass

func _on_single_pressed():
	get_tree().change_scene("res://main.scn")


func _on_multi_pressed():
	get_tree().change_scene("res://lobby.scn")


func _on_exit_pressed():
	get_tree().quit()
