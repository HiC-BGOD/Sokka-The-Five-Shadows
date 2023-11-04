extends State

class_name AirState

@export var landing_state : State
@export var landing_animation : String = "landing"
@export var jump_velocity : float = -250.0
@export var double_jump_velocity : float = -100
@export var double_jump_animation : String = "Double_Jump"

var has_double_jumped = false

func state_process(delta):
	if(player.is_on_floor() and next_state == null):
		next_state = landing_state
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("Jump") && !has_double_jumped):
		double_jump()


func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_double_jumped = false
		
		
func double_jump():
	player.velocity.y = double_jump_velocity
	has_double_jumped = true

