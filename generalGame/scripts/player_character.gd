extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 300.0

var last_facing_right := true  # remembers which direction we faced last

func _physics_process(_delta: float) -> void:
	var x_input := Input.get_axis("move_left", "move_right")
	var y_input := Input.get_axis("move_up", "move_down")

	# Movement
	velocity.x = x_input * SPEED
	velocity.y = y_input * SPEED

	# --- Animation Logic ---
	if (x_input != 0 or y_input != 0):
		# walking
		anim.play("walking")

		# Facing direction
		if x_input > 0:
			anim.flip_h = true
			last_facing_right = false
		elif x_input < 0:
			anim.flip_h = false
			last_facing_right = true
		else:
			# Moving only up/down → keep last horizontal direction
			anim.flip_h = not last_facing_right
	else:
		# idle
		anim.play("idle")

		# face last direction while idle
		anim.flip_h = not last_facing_right

	move_and_slide()
