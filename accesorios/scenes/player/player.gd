extends KinematicBody2D

#variables
var speed = 100
var move_vector = Vector2(0,0)
onready var area_detect = get_node("detect")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	##this is gonna be used for the car movement
	#remember the car moves up and strides left right, doesnt rotate!!!
	if Input.is_action_pressed("ui_up"):
		move_vector.y = -1
		
	else:
		move_vector.y = 0
		
	if Input.is_action_just_pressed("ui_left"):
		move_vector.x = -10
	else:
		move_vector.x = 0
		
	if Input.is_action_just_pressed("ui_right"):
		move_vector.x = 10
	else:
		move_vector.x = 0
	##this applies movement
	move_and_slide(move_vector.normalized() * speed)

##use this func to tp player
func _on_detect_area_entered(area):
	if area.name == ("AreaReset"):
		print("reset_pos!")
		tp_player(Vector2(self.position.x, 600))
	
	if area.name == ("crash_left"):
		print("crashed_left")
	elif area.name == ("crash_right"):
		print("crashed_right")
func tp_player(destiny: Vector2):
	self.position = destiny
