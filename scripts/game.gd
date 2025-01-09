extends Node2D

@onready var enemy_prefab = preload("res://prefabs/enemy.tscn")
@onready var health_bar = $game_ui/health_bar

var score = 0
var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_ui()
	health_bar.value = hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_prefab.instantiate()
	
	var random_y = randi_range(30,620)
	enemy.position = Vector2(1100,random_y)
	enemy.enemy_killed.connect(_on_enemy_killed)
	
	add_child(enemy)


func _update_ui() -> void:
	$game_ui/score_label.text = "SCORE : " + str(score)
	
func _on_enemy_killed() -> void:
	score += 1
	_update_ui()
	
func _on_player_area_entered(area: Area2D) -> void:
	if area is enemy_laser:
		hp -= 2
		health_bar.value = hp

func _on_player_player_killed() -> void:
	$restart_timer.start()
	pass

func _on_restart_timer_timeout() -> void:
	get_tree().reload_current_scene()
