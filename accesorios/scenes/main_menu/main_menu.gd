extends Node2D


var button_start
var button_quit

# Called when the node enters the scene tree for the first time.
func _ready():
	button_start = get_node("button_start")
	button_quit = get_node("button_quit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("button_start"):
		print("start!")
		
	if Input.is_action_just_pressed("esc"):
		_on_button_quit_pressed()


func _on_button_start_pressed():
	get_tree().change_scene("res://accesorios/scenes/game/game.tscn")

func _on_button_quit_pressed():
		print("leaving game ! :C")
		get_tree().quit()
