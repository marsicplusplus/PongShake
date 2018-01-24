extends Control

onready var effect = get_node("Tween")

var panic = 1

func _ready():
	randomize()
	effect.interpolate_property(self, "rect/scale", get_scale(), Vector2(1.1, 1.1), 0.5, Tween.TRANS_CIRC, Tween.EASE_OUT)
	effect.start()
	set_process(true)
	
func _process(delta):
	pass

func more_panic():
	panic += 1
	#effect.stop(self, "rect/scale")
	var ran = rand_range(1, 1 + (panic  % 10))
	#effect.interpolate_property(self, "rect/scale", Vector2(1, 1), Vector2(ran, ran), 0.5, Tween.TRANS_CIRC, Tween.EASE_OUT)
	#effect.start()
	get_node("PanicCount").set_text("Panic x " + str(panic))
