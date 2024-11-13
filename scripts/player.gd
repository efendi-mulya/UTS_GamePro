extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("player_down") and position.y < 600:
		position.y += 10
	if Input.is_action_pressed("player_up") and position.y > 50:
		position.y -= 10
	if Input.is_action_pressed("player_forward") and position.x < 400:
		position.x += 10
	if Input.is_action_pressed("player_back") and position.x > 50:
		position.x -= 10
