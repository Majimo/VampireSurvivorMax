extends CharacterBody2D

@onready var player = get_node("/root/Ground/Player")

@export var speed = 125

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(_delta):
	velocity = Vector2.ZERO

	velocity = position.direction_to(player.global_position) * speed
	velocity = velocity.normalized()

	move_and_collide(velocity)
