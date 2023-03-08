extends CharacterBody2D

const MAX_SPEED: int = 75


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()

func get_direction_to_player() -> Vector2:
	var player_node: Node2D = get_tree().get_first_node_in_group("player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	
	return Vector2.ZERO
