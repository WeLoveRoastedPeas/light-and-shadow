extends Node

@export var entity : Node2D

@export var velocity : float = 10.0
var delta_x: Vector2 = Vector2(velocity, 0.0)
var delta_y: Vector2 = Vector2(0.0, velocity)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_A):
		entity.position -= delta_x
	if Input.is_key_pressed(KEY_S):
		entity.position += delta_y
	if Input.is_key_pressed(KEY_W):
		entity.position -= delta_y
	if Input.is_key_pressed(KEY_D):
		entity.position += delta_x
