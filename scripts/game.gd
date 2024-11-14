extends Node2D

@onready var enemy_prefab = preload("res://prefabs/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_prefab.instantiate()
	
	var random_y = randi_range(30,620)
	enemy.position = Vector2(1100,random_y)
	add_child(enemy)# Replace with function body.
