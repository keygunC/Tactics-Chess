# class_piece.gd
# Abstract class for the interactible pieces.
class_name Piece
extends Node


@export var team_num: int
var is_leader := false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


## Gets this piece's list of valid moves
func get_all_valid_moves(_moveContext: MoveContext) -> Array[Move]:
	return []


## Gets all actions
func get_all_action_set() -> Array:
	return []


func animate_idle() -> void:
	sprite.play("idle")


func animate_hover() -> void:
	sprite.play("hover")


func animate_selected() -> void:
	sprite.play("selected")
