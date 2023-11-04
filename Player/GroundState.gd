extends State

class_name GroundState

@export var jump_velocity: float = -250.0
@export var air_state : State
@export var jump_animation : String = "Jump"
@export var attack_state : State
@export var attack_node : String = "Attack1"

func state_process(delta):
	if(player.is_on_floor() and next_state == null):
		next_state = air_state


func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump")):
		jump()
	if(event.is_action_pressed("Attack1")):
		attack()


func jump():
	player.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)


func attack():
	next_state = attack_state
	playback.travel(attack_node)
	
