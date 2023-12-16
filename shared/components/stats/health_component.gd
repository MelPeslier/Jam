class_name HealthComponent
extends Node

signal health_changed(_health: int, _max_health: int)

@export var max_health: int

@export var health: int: set = _set_health


func _ready() -> void:
	health = max_health


func damage(_damage: int) -> void:
	health = max(health - _damage, 0)


func heal(amount: int) -> void:
	health = min(health + amount, max_health)


func _set_health(_health: int) -> void:
	health = clampi(_health, 0, max_health)
	health_changed.emit(health, max_health)
