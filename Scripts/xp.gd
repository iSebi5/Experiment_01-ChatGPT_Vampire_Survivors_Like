extends Area2D

signal collected

@export var points = 10  # Puntos que otorga la esfera de XP

func _on_body_entered(body: Node) -> void:
    if body.name == "Player":
        emit_signal("collected")
        body.on_xp_collected()
        queue_free()
