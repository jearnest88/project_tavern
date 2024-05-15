extends Node2D


# Declare and configure a timer node
@onready var spawn_timer: Timer = $SpawnTimer

var item_spawner

# This gets the scene ready, prepares the "item_spawn" class
func _ready():
	item_spawner = item_spawn.new()
	add_child(item_spawner)  # Ensure it is part of the scene tree

# This is a timer that spawns a random collectable when it runs out
func _on_spawn_timer_timeout():
	item_spawner.spawn_random_collectable()
