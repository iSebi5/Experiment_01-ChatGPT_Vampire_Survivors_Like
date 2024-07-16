extends CharacterBody2D

@export var speed = 150.0
var target = null

func _ready():
    pass

func _process(delta):
    if target:
        var direction = (target.global_position - global_position).normalized()
        velocity = direction * speed
        move_and_slide()
