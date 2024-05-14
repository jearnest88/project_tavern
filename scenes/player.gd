extends CharacterBody2D


# Declare the target node path
#@export var target_path: NodePath = "/root/main/Objects/Wheat"
var target_wheat = null

# Movement speed and velocity
var speed : float = 25  # Adjust the speed as necessary
var chase = false

func _ready():
	pass

func update_target_wheat():
	var nearest_distance = INF  # Initialize with infinity
	target_wheat = null
	
	# Find the nearest Wheat object
	var wheat_instances = get_tree().get_nodes_in_group("Wheat")  # Make sure Wheat instances are added to a group when spawned
	for wheat in wheat_instances:
		var distance = position.distance_to(wheat.global_position)
		if distance < nearest_distance:
			nearest_distance = distance
			target_wheat = wheat

func _process(delta):
	update_target_wheat()  # Update the target wheat
	if target_wheat:
		move_towards(target_wheat.global_position, delta)
	move_and_slide()

func move_towards(target_position, delta):
	var direction = (target_position - global_position).normalized()
	velocity = direction * speed  # Update the custom velocity
	
	
func _on_player_detection_body_entered(body):
		if body.name == "wheat":
			print("Found Object")
			chase = true

