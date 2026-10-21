# chess_bishop.gd
extends Piece


@export var moveRule: MoveRule


## Gets all valid moves
func get_all_valid_moves(moveContext: MoveContext) -> Array[Move]:
	return moveRule.get_all_valid_moves(moveContext)
