extends Area2D

export (int) var INITIAL_SPEED = 500
onready var BallSprite = get_node("Sprite")
onready var Collision = get_node("CollisionShape2D")
onready var Player = get_node("Player")

var ball_speed = INITIAL_SPEED
var vel = Vector2(rand_range(-1.0, -0.5), rand_range(-1.0, -0.5))
var pos = Vector2()
var panic = 1
var radius 
var start = false

signal endGame
signal screenCollide

func _ready():
	radius = Collision.get_shape().get_radius()
	pos = get_pos()
	set_fixed_process(true)


func _fixed_process(delta):
	if start:
		if(pos.x < 0):
			emit_signal("endGame")
			queue_free()
			pass
		if(pos.x + radius> get_viewport_rect().size.width):
			vel.x = - vel.x
			emit_signal("screenCollide", pos, panic)
			panic += 1
			ball_speed += 100
		if(pos.y + radius > get_viewport_rect().size.height or pos.y - radius < 0):
			vel.y = - vel.y
			print(pos.y)
		pos += vel * ball_speed * delta 
		set_pos(pos)
	
func start():
	print(ball_speed)
	start = true

func _on_Ball_area_enter( area ):
	if(pos.x > area.get_pos().x):
		vel.x = - vel.x 

