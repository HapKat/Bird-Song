extends Sprite2D

@onready var falling_key = preload("res://objects/falling_key.tscn")
@export var key_name: String = ""

var falling_key_queue = []

func _process(delta: float) -> void:
	
	if falling_key_queue.size() > 0:
		var front_key = falling_key_queue.front()
		
		if !is_instance_valid(front_key):
			falling_key_queue.pop_front()
			return 
	
		if front_key.has_passed:
			falling_key_queue.pop_front()
		
		if Input.is_action_just_pressed(key_name):
			print("key pressed")
			var key_to_pop = falling_key_queue.pop_front()
			
			var distance_from_pass = abs(key_to_pop.pass_threshold - key_to_pop.y)
			print(distance_from_pass)
			key_to_pop.queue_free()				
	

func CreatFallingKey():
	var fk_inst = falling_key.instantiate()
	get_tree().get_root().call_deferred("add_child", fk_inst)
	fk_inst.Setup(position.x, global_position.y)
	
	falling_key_queue.push_back(fk_inst)


func _on_random_spawn_timer_timeout() -> void:
	CreatFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4,3)
	$RandomSpawnTimer.start()
