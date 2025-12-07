extends Area2D

@export var speed: int = 400
var screen_size: Vector2
signal collision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	#hide() #player is hidden on init

# Called every frame. 'delta' is the elapsed time since the previous frame.
# check for input, move, run animation
func _process(frame_delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * frame_delta
	position = position.clamp(Vector2.ZERO, screen_size)

func start() -> void:
	position = Vector2(300, 300)
	show()
	$CollisionShape2D.disabled = false

func on_body_entered(_body: Node2D) -> void:
	hide() # after hit
	collision.emit()
	$CollisionShape2D.set_deferred("disabled", true)
