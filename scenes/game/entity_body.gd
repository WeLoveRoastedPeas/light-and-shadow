extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_shape_entered.connect(_on_collision)
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	print("area entered", area)

func _on_collision(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("COLLISION!! ")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
