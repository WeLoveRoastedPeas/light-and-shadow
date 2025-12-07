extends Node

@export var foo: String = "hello"
@export var MainMenuScene: Node = preload("res://scenes/main/MainMenu.tscn").instantiate()
@export var BootScene: Node = preload("res://scenes/boot/Boot.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
