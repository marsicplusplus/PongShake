 extends Area2D

onready var sprite = get_node("Sprite")
onready var timer = get_node("Timer")
onready var particles = get_node("Particles")

var trail = []
var speed = 300
var velocity = Vector2()
var pos = Vector2()
var extents = Vector2()
var screensize
var start = false

func _ready():
	screensize = get_viewport_rect().size
	pos = get_pos()
	extents = sprite.get_texture().get_size()
	set_fixed_process(true)
	
func _fixed_process(delta):
	if start:
		velocity = Vector2()
		velocity.y = - Input.is_action_pressed("ui_up") + Input.is_action_pressed("ui_down")
		velocity = velocity.normalized() * speed
		pos += velocity * delta
		if(pos.y + extents.y / 2 > screensize.height):
			pos.y = screensize.height - extents.y / 2
		elif(pos.y - extents.y / 2 < 0):
			pos.y = extents.y / 2
	
		if velocity.y != 0:
			particles.set_emitting(true)
			if velocity.y > 0:
				particles.set_param(particles.PARAM_DIRECTION, 180)
			else:
				particles.set_param(particles.PARAM_DIRECTION, 0)
		else:
			particles.set_emitting(false)
		set_pos(pos)

func start():
	start = true

func _on_Timer_timeout():
	print("gg")