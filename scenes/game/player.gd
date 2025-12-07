extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var health: Node = get_node("Health")
	health.died.connect(_on_died)
	health.health_changed.connect(_on_health_change)
	
func _on_health_change(health: int) -> void:
	print("HP: ", health)
	
func _on_died(reason: String) -> void:
	print("DIIIIIIED: ", reason)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#print("HP: ", $EntityBody/Health.health)
