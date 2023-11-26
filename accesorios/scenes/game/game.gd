extends Node2D

# Declare the location of the player scene
onready var player_path = "res://accesorios/scenes/player/player.tscn"
# Declare the location of the npc scene
onready var npc_path = "res://accesorios/scenes/npc/npc.tscn"
onready var npc_path2 = "res://accesorios/scenes/npc_2/npc.tscn"
onready var npc_path3 = "res://accesorios/scenes/npc_3/npc.tscn"

# Use this to move the player down the map
onready var area_go_down = get_node("AreaReset")
# Use this to signal when the player goes down
signal tp_player

onready var spawn_1 = get_node("area_spawn_npc_1")
onready var spawn_2 = get_node("area_spawn_npc_2")
onready var spawn_3 = get_node("area_spawn_npc_3")

# To instance
var player_instance: Node2D
var npc_instance: Node2D

# Var for timer
onready var timer = $Timer

# Counter for NPCs spawned
var npc_counter: int = 0
const max_npc_count: int = 2  # Set the maximum number of NPCs to spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	# Use the spawn function
	spawn_player()

	# Connect the timeout signal of the timer to the function that spawns the NPC
	timer.connect("timeout", self, "spawn_npc_1")
	timer.connect("timeout", self, "spawn_npc_2")
	timer.connect("timeout", self, "spawn_npc_3")
	# Set the timer delay (in seconds) to determine when the NPC will be spawned
	timer.wait_time = 2  # Set this to the desired delay (5 seconds in this example)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		go_to_main()

	# Handle input for moving left
	if Input.is_action_pressed("ui_left"):
		player_instance.position.x -= 100 * delta
	# Handle input for moving right
	if Input.is_action_pressed("ui_right"):
		player_instance.position.x += 100 * delta

# Use this function to spawn the player on the scene
func spawn_player():
	var player_scene = load(player_path)
	player_instance = player_scene.instance()
	add_child(player_instance)
	player_instance.position = Vector2(512, 300)

# Function to spawn the NPC
func spawn_npc_1():
	if npc_counter < max_npc_count:
		var npc_scene = load(npc_path)
		npc_instance = npc_scene.instance()
		add_child(npc_instance)
		npc_instance.position = spawn_1.position  # Use spawn_1.position instead of spawn_1
		npc_counter += 1
	else:
		timer.stop()  # Stop the timer when the maximum number of NPCs is reached
func spawn_npc_2():
	if npc_counter <max_npc_count:
		var npc_scene = load(npc_path2)
		npc_instance = npc_scene.instance()
		add_child(npc_instance)
		npc_instance.position = spawn_2.position
		npc_counter += 1
	else:
		timer.stop()
func spawn_npc_3():
	if npc_counter <max_npc_count:
		var npc_scene = load(npc_path3)
		npc_instance = npc_scene.instance()
		add_child(npc_instance)
		npc_instance.position = spawn_3.position
		npc_counter += 1
	else:
		timer.stop()
## IN THE FUTURE REPLACE WITH PAUSE
func go_to_main():
	get_tree().change_scene("res://accesorios/scenes/main_menu/main_menu.tscn")
