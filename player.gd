class_name Player
extends CharacterBody2D

@onready var agent: NavigationAgent2D = $NavigationAgent2D

const SPEED: int = 500   
	
func set_destination(destination: Vector2):
	agent.set_target_position(destination)
	#print("start", destination)

func _ready():
	agent.avoidance_enabled = true
	agent.velocity_computed.connect(_on_agent_velocity_computed)
	agent.navigation_finished.connect(_on_agent_navigation_finished)

func _physics_process(delta):
	if not agent.is_navigation_finished():
		var cur_pos = global_position
		var tar_pos = agent.get_next_path_position()
		var agent_velocity = cur_pos.direction_to(tar_pos).normalized() * SPEED
		agent.set_velocity(agent_velocity)

func _on_agent_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()

func _on_agent_navigation_finished():
	#print("end", global_position)
	pass
