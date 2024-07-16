extends Area2D

@export var speed = 300.0
@export var lifetime = 5.0  # Tiempo de vida de la bala
var direction = Vector2.ZERO
var timer = 0.0

func _process(delta: float) -> void:
    timer += delta
    if timer > lifetime:
        queue_free()  # Destruir la bala después del tiempo de vida

    if direction != Vector2.ZERO:
        position += direction * speed * delta

func _on_body_entered(body: Node) -> void:
    if body.is_in_group("enemies"):
        body.queue_free()
        queue_free()