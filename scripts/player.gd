extends Area2D

@onready var laser_prefab = preload("res://prefabs/laser.tscn")
@onready var explosion_prefab = preload("res://prefabs/explosion.tscn")

#signal player_killed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("player_down") and position.y < 600:
		position.y += 5
	if Input.is_action_pressed("player_up") and position.y > 50:
		position.y -= 5
	if Input.is_action_pressed("player_forward") and position.x < 400:
		position.x += 5
	if Input.is_action_pressed("player_back") and position.x > 50:
		position.x -= 5
	if Input.is_action_just_pressed("player_shoot"):
		var laser = laser_prefab.instantiate()
		laser.position = position
		get_parent().add_child(laser)
		$AudioStreamPlayer.play()


func _on_area_entered(area: Area2D) -> void:
	if area is enemy_laser:
		var explosion = explosion_prefab.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		#queue_free()
		#player_killed.emit()
