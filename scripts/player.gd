extends CharacterBody2D
#
const SPEED = 100.0
var last_input = "right";

#const JUMP_VELOCITY = -300.0
#@onready var animated_sprite = $AnimatedSprite2D


func ready() -> void:
	pass

func player_movement(delta):
	get_input()
	if velocity[0]*velocity[0] > 1 or velocity[1] * velocity[1] > 0:
		player_animation("move")
	else: #idle
		player_animation("idle")

# function for top down 8-way control from wiki: https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
	
	
func player_animation(action: String) -> void:
	var anim = $AnimatedSprite2D
	print(velocity)
	if action == "move":
		if velocity[0] > 1:
			last_input = "right"
			anim.flip_h = false
			anim.play("side_walk")
		elif velocity[0] < 0:
			anim.flip_h = true
			last_input = "left"
			anim.play("side_walk")
		elif velocity[1] > 0:
			last_input = "down"
			anim.play("front_walk")
		elif velocity[1] < 1:
			last_input = "up"
			anim.play("back_walk")
		else:
			print("idling: should not reach")
	else: #idle animations
		if (last_input == "left" or last_input == "right"):
			anim.play("side_idle")
		elif last_input == "up":
			anim.play("back_idle")
		else:
			anim.play("front_idle")

func _physics_process(delta: float) -> void:
	player_movement(delta)
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
