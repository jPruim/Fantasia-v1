extends CharacterBody2D
#
const SPEED = 100.0
#const JUMP_VELOCITY = -300.0
#@onready var animated_sprite = $AnimatedSprite2D


func ready() -> void:
	pass


# function for top down 8-way control from wiki: https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
	#
	## Add the gravity. (disabled atm)
	##if not is_on_floor():
		##velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("move_left","move_right")
	#
	## Flip sprite
	#if direction > 0:
		#animated_sprite.flip_h = false
	#elif direction < 0:
		#animated_sprite.flip_h = true
	#
	## Play animation
	#if is_on_floor():
		#if direction == 0:
			#animated_sprite.play("idle")
		#else:
			#animated_sprite.play("run")
	#else:
		#animated_sprite.play("jump")
	#
	#
	## Apply Movement
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
