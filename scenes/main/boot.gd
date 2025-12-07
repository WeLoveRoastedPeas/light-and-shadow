extends Node2D

@export var foe_scene: PackedScene
var score: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene_to_file("res://scenes/main/foe.tscn")
	#get_tree().change_scene_to_file("res://scenes/main/MainMenu.tscn")

func game_over() -> void:
	$Score_Time.stop()
	$Foe_Time.stop();

func new_game() -> void:
	score = 0
	$Player.start()
	$Start_Time.start()

func _on_foe_time_timeout() -> void:
	var new_foe: Node2D = foe_scene.instantiate()
	
	var spawn_location: PathFollow2D = $Foe_Path/Foe_Spawn
	spawn_location.progress_ratio = randf()
	new_foe.position = spawn_location.position
	
	var direction: float = spawn_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	new_foe.rotation = direction;
	
	var velocity: Vector2 = Vector2(randf_range(150.0, 250.0), 0.0)
	new_foe.linear_velocity = velocity.rotated(direction)
	add_child(new_foe)

func _on_score_time_timeout() -> void:
	score += 1

func _on_start_time_timeout() -> void:
	$Score_Time.start()
	$Foe_Time.start()
