extends Camera2D

onready var Timer = get_node("Timer")

var shaking = false
var shakeAmount = 1
 
func _ready():
	set_process(true)
	pass

func _process(delta):
	if(shaking):
		set_offset(Vector2( \
	        rand_range(-1.0, 1.0) * (shakeAmount * shakeAmount), \
	        rand_range(-1.0, 1.0) * (shakeAmount * shakeAmount)\
	    ))

func startShake(panic):
	if(!shaking):
		if (panic > 10):
			shakeAmount = 10
		else:
			shakeAmount = panic
		shaking = true
		Timer.start()

func _on_Timer_timeout():
	shaking = false
	set_offset(Vector2(0, 0))
