extends Sprite2D

@onready var falling_key = preload("res://objects/falling_key.tscn")
@export var key_name: String = ""

var falling_key_queue = []

func _process(delta: float) -> void:
	if key_name != "" and Input.is_action_just_pressed(key_name):
		pass
				
	if falling_key_queue.size() > 0:	
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
		print("popped")

func CreatFallingKey():
	var fk_inst = falling_key.instantiate()
	get_tree().get_root().call_deferred("add_child", fk_inst)
	fk_inst.Setup(position.x, frame + 4)
	
	falling_key_queue.push_back(fk_inst)


func _on_random_spawn_timer_timeout() -> void:
	CreatFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4,3)
	$RandomSpawnTimer.start()
