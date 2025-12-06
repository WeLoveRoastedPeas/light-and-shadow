extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var foe_types: Array[String] = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = foe_types.pick_random() #could pick random foe
	$AnimatedSprite2D.play()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
