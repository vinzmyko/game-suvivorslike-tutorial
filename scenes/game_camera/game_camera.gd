extends Camera2D

var target_position: Vector2 = Vector2.ZERO

@onready
var player: Node2D = get_tree().get_first_node_in_group("player")


func _ready() -> void:
	make_current()


func _process(delta: float) -> void:
	aquire_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 10))

func aquire_target() -> void:
	target_position = player.global_position
