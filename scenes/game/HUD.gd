extends MarginContainer

@export var player : Node

var is_alive: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("health_changed", _on_health_changed)
	player.connect("died", _on_died)
	
func _on_died(_reason: String) -> void:
	is_alive = false
	$HP.text = "DEAD"
	pass

func update_health(health: int) -> void:
	if is_alive:
		$HP.text = "HP: " + str(health)

func _on_health_changed(health: int) -> void:
	update_health(health)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
