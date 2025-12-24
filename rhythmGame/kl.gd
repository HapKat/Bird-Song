extends Sprite2D

@onready var falling_key = preload("res://rhythmGame/objects/falling_key.tscn")
@onready var score_text = preload("res://rhythmGame/objects/score_press_text.tscn")
@export var key_name: String = ""

var falling_key_queue: Array[FallingKey] = []

# Distances from critical point
var perfect_press_threshold: float = 30
var great_press_threshold: float = 50
var good_press_threshold: float = 60
var ok_press_threshold: float = 80
# Otherwise miss

# Scores
var perfect_press_score: float = 250
var great_press_score: float = 100
var good_press_score: float = 50
var ok_press_score: float = 20



func _process(delta: float) -> void:	
		
	# Makes sure there is a falling key
	if falling_key_queue.size() > 0:
		# If that falling key has passed, remove it from the queue
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
		# If key is pressed, pop falling key from queue front and calc
		# distance from critical point
		if Input.is_action_just_pressed(key_name):
			var key_to_pop: FallingKey = falling_key_queue.pop_front()
			if key_to_pop is FallingKey:
				var distance_from_pass = abs(key_to_pop.pass_threshold - key_to_pop.global_position.y)
				print(distance_from_pass)
				
				if distance_from_pass < perfect_press_threshold:
					Signas.IncrementScore.emit(perfect_press_score)
				elif distance_from_pass < great_press_threshold:
					Signas.IncrementScore.emit(great_press_score)
				elif distance_from_pass < good_press_threshold:
					Signas.IncrementScore.emit(good_press_score)
				elif distance_from_pass < ok_press_threshold:
					Signas.IncrementScore.emit(ok_press_score)
				else:
					# Miss
					pass
					
				key_to_pop.queue_free()			
				
				var st_inst = score_text.instantiate()
				get_tree().get_root().call_deferred("add_child", st_inst)	
				print(global_position)
				st_inst.global_position = global_position
		

func CreatFallingKey():
	var fk_inst = falling_key.instantiate()
	add_child(fk_inst)
	fk_inst.Setup(position.x, global_position.y)
	
	falling_key_queue.push_back(fk_inst)


func _on_random_spawn_timer_timeout() -> void:
	CreatFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4,3)
	$RandomSpawnTimer.start()
