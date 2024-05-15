extends Node2D

# This references the AnimatedSprite2D node.
@onready var anim = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("evolving")  # Start with the first animation
	$Timer.start()  # Start the timer on ready
	
# Handler for the Timer's timeout signal
func _on_timer_timeout():
	anim.play("grown")  # Play the second stage animation
	print("Timer out")
