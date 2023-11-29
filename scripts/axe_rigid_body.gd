extends Node2D


@onready var axe_animation = $AxeSprite/AxeAnimation
@onready var axe_area = $Area2D


@export var initial_velocity = Vector2(200, -600)
@export var gravity = Vector2(0, 800)
@export var time = 0
@export var max_time = 2


func _ready():
	axe_animation.play("throw")

func _process(delta: float) -> void:
	time += delta
	if time <= max_time:
		var velocity = initial_velocity + gravity * time
		position += velocity * delta
	else:
		queue_free()
