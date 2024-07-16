extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval = 2.0
@export var spawn_distance = 500.0
@export var player: NodePath

var spawn_timer = 0.0
var player_node = null

func _ready():
	player_node = get_node(player)

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_enemy()
		spawn_timer = spawn_interval

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	
	# Generar una posición aleatoria alrededor del jugador pero fuera de la vista
	var angle = randf() * 2.0 * PI
	var offset = Vector2(cos(angle), sin(angle)) * spawn_distance
	enemy.global_position = player_node.global_position + offset
	
	# Asignar el jugador como objetivo
	enemy.target = player_node
