extends Area2D

@export var speed = 2
@onready var explosion_prefab = preload("res://prefabs/explosion.tscn")
signal enemy_killed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed


func _on_area_entered(area: Area2D) -> void:
	if area is laser:
		#print(area.name)
		var explosion = explosion_prefab.instantiate()
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		area.queue_free()
		enemy_killed.emit()
