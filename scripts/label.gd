extends Label


var initialPosition
func _ready() -> void:
	initialPosition = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = initialPosition.x - size.x/2
