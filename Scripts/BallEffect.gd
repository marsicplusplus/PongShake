extends Node2D

onready var time = get_node("Timer")
onready var effect = get_node("Tween")
onready var sprite = get_node("Sprite")


func _ready():
	set_process(true)
	

func StartBallEffect(pos, pan):
	set_pos(pos)
	effect.interpolate_property(sprite, "transform/scale", sprite.get_scale(), Vector2(pan, pan), 1, Tween.TRANS_CIRC, Tween.EASE_OUT)
	effect.interpolate_property(sprite, "visibility/opacity", sprite.get_opacity(), 0, 1, Tween.TRANS_SINE, Tween.EASE_OUT)
	effect.start()

func _on_Tween_tween_complete( object, key ):
	queue_free()
