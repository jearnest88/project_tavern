class_name item_spawn
extends Node2D
# Created the class "item_spawn"

# This is the array of collectables we are able to spawn, can always add more
var scenes = [
	preload("res://scenes/collectables/wheat.tscn"),
	preload("res://scenes/collectables/cherry.tscn"),
	preload("res://scenes/collectables/apple.tscn") # Example of adding more scenes
]

# This gets the scene ready
func _ready():
	randomize()  # Ensure randomness in each game start
	spawn_random_collectable()

# This picks a random collectable from the array
func spawn_random_collectable():
	var index = int(randi_range(0, scenes.size() - 1))  # Get a random index based on the number of scenes
	var selected_scene = scenes[index]
	if selected_scene:
		var new_collectable = selected_scene.instantiate()
		setup_collectable(new_collectable)
	else:
		print("Error: Failed to load the scene.")

# This creates the randomly picked collectable and adds it both to the "main" root/Objects node and to the "Collectables" group so the player can find it
func setup_collectable(collectable):
	var objects_node = get_node("/root/main/Objects")
	if objects_node:
		objects_node.add_child(collectable)
		collectable.position = Vector2(randi_range(375, 725), randi_range(150, 250))
		collectable.add_to_group("Collectables")
	else:
		print("Error: Objects node not found.")
