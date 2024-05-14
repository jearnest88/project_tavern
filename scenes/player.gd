extends CharacterBody2D


# Declare the target node path
@export var target_path: NodePath = "/root/main/Objects/Wheat"


# Movement speed and velocity
var speed : float = 25  # Adjust the speed as necessary

var chase = false

func _ready():
	# Ensure the target node exists
	assert(has_node(target_path), "Target node does not exist in the current scene.")

func _process(delta : float) -> void:
	var target = get_node_or_null(target_path)
	if target:
		move_towards(target.global_position, delta)

func move_towards(target_position : Vector2, delta : float) -> void:
	# Calculate the direction vector from the character to the target
	var direction = (target_position - global_position).normalized()
	# Update the velocity based on the direction and speed
	velocity = direction * speed
	# Apply the movement
	move_and_slide()
	
func _on_player_detection_body_entered(body):
		if body.name == "wheat":
			print("Found Object")
			chase = true

