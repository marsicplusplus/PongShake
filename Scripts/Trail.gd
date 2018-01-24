extends Node2D

onready var lifeTimer = get_node("LifeTimer")

func _ready():
	print("TRAIL: ", get_pos().y)
	pass
	
func startTimer():
	lifeTimer.start()


func _on_LifeTimer_timeout():
	queue_free()
