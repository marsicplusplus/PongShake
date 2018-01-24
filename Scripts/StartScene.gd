extends Control

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/PlayScene.tscn")
	pass # replace with function body
