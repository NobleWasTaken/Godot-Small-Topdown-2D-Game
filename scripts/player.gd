extends CharacterBody2D

@export var speed: float = 300
@export var accel: float = 50

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:
	# Get movement input
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")

	# Apply movement
	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, speed * direction.y, accel)
	
	# Flip sprite to face movement direction
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true

	# Change animation to run
	if direction.x != 0 or direction.y != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

	move_and_slide()
