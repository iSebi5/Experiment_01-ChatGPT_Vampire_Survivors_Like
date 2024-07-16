extends CanvasLayer

var seconds_passed: float = 0.0

func _ready() -> void:
    set_process(true)  # Habilitar el procesamiento del nodo cada frame

func _process(delta: float) -> void:
    seconds_passed += delta
    update_timer_label()

func update_timer_label() -> void:
    var minutes = int(seconds_passed) / 60
    var seconds = int(seconds_passed) % 60
    $Timer.text = format_time(minutes) + ":" + format_time(seconds)

func format_time(value: int) -> String:
    if value < 10:
        return "0" + str(value)
    return str(value)
