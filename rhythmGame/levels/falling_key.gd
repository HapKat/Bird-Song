class_name FallingKey
extends Sprite2D

@export var fall_speed: float = 4.5

var init_y_pos: float = -380

# true if falling key has passed the allowed input frame
var has_passed: bool = false 
var pass_threshold = 84

func _init():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += Vector2(0, fall_speed)
	# Find out how long it takes for arrow to reach critical spot	
	if (global_position.y > pass_threshold and !$Timer.is_stopped()):
		# print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()
		has_passed = true
		
		
func Setup(x_pos: float, threshold_y: float) -> void: 
	rotation = 0.0
	flip_h = true
	global_position.x = x_pos
	# This is the key Y-coordinate the manager will check against later
	pass_threshold = threshold_y 
	# Set the starting Y position (way off screen)
	global_position.y = -500
	set_process(true)


func _on_destroy_timer_timeout() -> void:
	queue_free()
