extends CharacterBody2D

@export var speed = 100.0
@export var health: int = 100  # Vida inicial del enemigo
@export var xp_scene: PackedScene  # Prefab de la esfera de XP
var target = null

func _ready():
    pass

func _process(_delta):
    if target:
        var direction = (target.global_position - global_position).normalized()
        velocity = direction * speed
        move_and_slide()

func take_damage(damage: int) -> void:
    health -= damage
    if health <= 0:
        drop_xp()
        queue_free()


func drop_xp() -> void:
    if xp_scene:
        var xp = xp_scene.instantiate()
        xp.global_position = global_position
        get_parent().add_child(xp)