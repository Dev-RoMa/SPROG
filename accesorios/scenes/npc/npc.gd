extends KinematicBody2D

# Declare member variables here. Examples:
var speed = 10
var move_vector = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	## to move him down not anything else needed
	move_vector.y = 1
	
	#This SHOULD move the npc down
	move_and_slide(move_vector.normalized()* speed)
	
