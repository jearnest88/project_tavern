extends CharacterBody2D


# Declare the target node path
#@export var target_path: NodePath = "/root/main/Objects/Wheat"
var target_collectable = null

# Movement speed and velocity
var speed : float = 25  # Adjust the speed as necessary
var chase = false

func _ready():
	pass

# This function targets the closest collectable. It requires that the collectable be in the "Collectables" group
func update_target_collectable():
	var nearest_distance = INF  # Initialize with infinity
	target_collectable = null
	
	# Find the nearest Wheat object
	var collectable_instances = get_tree().get_nodes_in_group("Collectables")  # Make sure Wheat instances are added to a group when spawned
	for collectable in collectable_instances:
		var distance = position.distance_to(collectable.global_position)
		if distance < nearest_distance:
			nearest_distance = distance
			target_collectable = collectable

# This process continually looks for closest collectable
func _process(delta):
	update_target_collectable()  # Update the target wheat
	if target_collectable:
		move_towards(target_collectable.global_position, delta)
	move_and_slide()

# This moves the player towards the found collectable
func move_towards(target_position, delta):
	var direction = (target_position - global_position).normalized()
	velocity = direction * speed  # Update the custom velocity
	
	

