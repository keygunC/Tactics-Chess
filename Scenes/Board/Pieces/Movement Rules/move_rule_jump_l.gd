# move_rule_jump_l.gd
# Moves in all eight directions.
class_name MoveRuleJumpL
extends MoveRule


## Gets all valid moves
func get_all_valid_moves(moveContext: MoveContext) -> Array[Move]:
	var validMoves: Array[Move] = []
	
	var offSetList := [
		Vector2i(2, 1), Vector2i(2, -1),
		Vector2i(1, -2), Vector2i(-1, -2),
		Vector2i(-2, -1), Vector2i(-2, 1),
		Vector2i(-1, 2), Vector2i(1, 2), 
	]
	
	for offSet in offSetList:
		var coordCheck: Vector2i = moveContext.pieceSelectedCoord + offSet
			
		var tile := get_tile(coordCheck, moveContext.pieceSelected.team_num, moveContext.pieceGrid)
		match tile:
			Tile.EMPTY:
				validMoves.append(Move.new(Move.Type.MOVE, coordCheck))
			Tile.ENEMY:
				validMoves.append(Move.new(Move.Type.CAPTURE, coordCheck))
			Tile.BLOCK:
				pass
	
	return validMoves
