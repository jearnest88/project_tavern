extends Node2D


# Preload the Wheat scene
var wheat_scene = preload("res://scenes/wheat.tscn")

# Declare and configure a timer node
@onready var spawn_timer: Timer = $SpawnTimer

func _ready():
	# Optional: Initialize random number generator
	randomize()
	

#function to spawn wheat, with the Timeout Signal
func spawn_wheat():
	# Create an instance of the Wheat scene
	var add_wheat = wheat_scene.instantiate()

	# Generate random X and Y coordinates within specified ranges
	var random_x = randf_range(375, 725)
	var random_y = randf_range(150, 250)

	# Set the position of the Wheat instance
	add_wheat.position = Vector2(random_x, random_y)

	# Add the Wheat instance to the "Objects" child node of the main root
	var objects_node = get_node("Objects")
	objects_node.add_child(add_wheat)
	add_wheat.add_to_group("Wheat")


func _on_spawn_timer_timeout():
	# This function is called every time the timer times out
	spawn_wheat()
