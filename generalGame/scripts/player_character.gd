extends CharacterBody2D

const SPEED := 100.0
var talking = false

func _physics_process(_delta: float) -> void:
	var input_vector := Vector2(
		Input.get_axis("walk_left", "walk_right"),
		Input.get_axis("walk_up", "walk_down")
	)

	velocity = input_vector.normalized() * SPEED
	move_and_slide()


func _on_goose_child_entered_tree(node: Node) -> void:
	talking = true
