extends CharacterBody2D

@export var speed = 200.0
@export var bullet_scene: PackedScene
@export var shoot_interval = 1.0
@export var shoot_distance = 300.0  # Distancia máxima para disparar
@export var points: int = 0  # Puntos del jugador

var shoot_timer = 0.0

func _ready() -> void:
    pass

func _process(delta: float) -> void:
    velocity = Vector2.ZERO  # Reinicia la velocidad cada frame

    # Detectar entradas de teclado
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1

    # Normalizar la velocidad y aplicarle la velocidad
    if velocity != Vector2.ZERO:
        velocity = velocity.normalized() * speed

    # Mover al personaje
    move_and_slide()

    # Disparar automáticamente
    shoot_timer -= delta
    if shoot_timer <= 0:
        shoot()
        shoot_timer = shoot_interval

func shoot() -> void:
    if not bullet_scene:
        return

    var enemy = get_closest_enemy()
    if enemy and global_position.distance_to(enemy.global_position) <= shoot_distance:
        var bullet = bullet_scene.instantiate()
        bullet.position = global_position
        bullet.direction = (enemy.global_position - global_position).normalized()
        get_parent().add_child(bullet)

func get_closest_enemy() -> Node:
    var closest_enemy = null
    var closest_distance = INF

    for enemy in get_tree().get_nodes_in_group("enemies"):
        var distance = global_position.distance_to(enemy.global_position)
        if distance < closest_distance:
            closest_distance = distance
            closest_enemy = enemy

    return closest_enemy

func on_xp_collected() -> void:
    points += 10
    print("Puntos: " + str(points))

