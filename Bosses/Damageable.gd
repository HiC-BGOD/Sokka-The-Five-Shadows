extends Node

class_name Damageable

signal on_hit(node : Node, damage_take : int)

@export var health : float = 20 :
		get:
			return health
		set(value):
			SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
			health = value
			
			
@export var die_animation_name : String = "Die"

@export var die_animation : String = "Die"

var playback : AnimationNodeStateMachinePlayback

func hit(damage : int):
	health -= damage
	
	emit_signal("on_hit", get_parent(), damage)
	



func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == die_animation_name):
		get_parent().queue_free()
