extends Node2D

@onready var enemy_prefab = preload("res://prefabs/enemy.tscn")

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_prefab.instantiate()
	
	var random_y = randi_range(30,620)
	enemy.position = Vector2(1100,random_y)
	enemy.enemy_killed.connect(_om_enemy_killed)
	
	add_child(enemy)


func _update_ui() -> void:
	$game_ui/score_label.text = "SCORE : " + str(score)
	
func _om_enemy_killed() -> void:
	score += 1
	_update_ui()
