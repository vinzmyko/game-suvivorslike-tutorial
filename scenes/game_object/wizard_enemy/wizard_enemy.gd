extends CharacterBody2D

#@onready var visuals = $Visuals
@onready var velocity_component = $VelocityComponent
@onready var visuals: Node2D = $Visuals

func _process(delta: float) -> void:
	velocity_component.accelerate_to_player()
	velocity_component.move(self)
	
	var move_sign = sign(velocity.x)
	if move_sign != 0:
		visuals.scale.x = move_sign
