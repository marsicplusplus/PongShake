extends Node2D

onready var Camera = get_node("Camera")
onready var Ball = get_node("Ball")
onready var Paddle =  get_node("Paddle")
onready var PanicCount = get_node("Control")
var BallEffect = preload("res://Scenes/BallEffect.tscn")
var started = false


func _ready():
	print("PRONTISSIMA")
	set_process_input(true)
	pass

func _input(event):
	if(event.type == InputEvent.KEY):
		if(event.is_action_pressed("start") and !started):
			started = true
			get_node("SpaceToStart").queue_free()
			Ball.start()
			Paddle.start()
			print("START")


func _on_Ball_screenCollide(pos, panic):
	Camera.startShake(panic)
	var b = BallEffect.instance()
	add_child(b)
	b.StartBallEffect(pos, panic)
	PanicCount.more_panic()
	pass # replace with function body


func _on_Ball_endGame():
	
	get_tree().change_scene("res://Scenes/LoseScene.tscn")
	pass # replace with function body
