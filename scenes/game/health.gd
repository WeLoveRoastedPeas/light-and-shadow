extends Node

@export var entity : Node
@export var health : int = 100
signal died(reason: String)
signal health_changed(health: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func take_damage(damage: int) -> void:
	update_health(health - damage)
	health_changed.emit(health)

func update_health(new_health: int) -> void:
	if new_health <= 0:
		died.emit("LAS_Died")
	health = new_health
