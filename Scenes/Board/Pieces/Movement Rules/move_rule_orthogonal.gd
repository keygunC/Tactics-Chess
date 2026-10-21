# move_rule_orthogonal.gd
# Moves in an orthogonal direction.
class_name MoveRuleOrthogonal
extends MoveRule


## Gets all valid moves
func get_all_valid_moves(moveContext: MoveContext) -> Array[Move]:
	var validMoves: Array[Move] = []
	
	var directionList := [Vector2i.RIGHT, Vector2i.UP, Vector2i.LEFT, Vector2i.DOWN]
	
	for direction in directionList:
		var checkCoord := moveContext.pieceSelectedCoord
		var isEmpty := true
		while isEmpty:
			checkCoord += direction
			
			var tile := get_tile(checkCoord, moveContext.pieceSelected.team_num, moveContext.pieceGrid)
			if tile != Tile.EMPTY:
				isEmpty = false
			
			match tile:
				Tile.EMPTY:
					validMoves.append(Move.new(Move.Type.MOVE, checkCoord))
				Tile.ENEMY:
					validMoves.append(Move.new(Move.Type.CAPTURE, checkCoord))
	
	return validMoves
