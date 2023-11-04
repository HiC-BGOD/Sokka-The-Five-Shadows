extends State

class_name HitState

@export var damageable : Damageable
@export var state_machine : StateMachine 
@export var die_state : State 
@export var die_animation_node : String = "Die"

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	

func on_damageable_hit(node: Node, damage_amount : int):
	if(damageable.health > 0):
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", die_state)
		playback.travel(die_animation_node)

