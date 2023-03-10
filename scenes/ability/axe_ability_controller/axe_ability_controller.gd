extends Node

@export var axe_ability_scene: PackedScene

@onready var timer = $Timer

var damage = 10

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	var foreground = get_tree().get_first_node_in_group("foreground_layer") as Node2D
	if foreground == null:
		return

	var axe_ability_instance = axe_ability_scene.instantiate() as Node2D
	foreground.add_child(axe_ability_instance)
	axe_ability_instance.global_position = player.global_position
	axe_ability_instance.hitbox_component.damage = damage
