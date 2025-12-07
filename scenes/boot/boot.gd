extends Node2D

@export var foe_scene: PackedScene
var score: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

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
	$Player.start($Start_Mark.position)
	$Start_Time.start()
