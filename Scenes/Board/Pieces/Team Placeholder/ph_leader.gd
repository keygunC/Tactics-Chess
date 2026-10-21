# ph_leader.gd
extends Piece


@export var moveRule: MoveRule


func _ready():
	is_leader = true


## Gets all valid moves
func get_all_valid_moves(moveContext: MoveContext) -> Array[Move]:
	return moveRule.get_all_valid_moves(moveContext)
