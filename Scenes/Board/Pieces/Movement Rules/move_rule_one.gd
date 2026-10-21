# move_rule_one.gd
# Moves by one tile in all direction.
class_name MoveRuleOne
extends MoveRule


## Gets all valid moves
func get_all_valid_moves(moveContext: MoveContext) -> Array[Move]:
	var validMoves: Array[Move] = []
	
	for dx in range(-1, 2):
		for dy in range(-1, 2):
			if (dx == 0) and (dy == 0):
				continue
			
			var coordCheck := moveContext.pieceSelectedCoord + Vector2i(dx, dy)
			
			var tile := get_tile(coordCheck, moveContext.pieceSelected.team_num, moveContext.pieceGrid)
			match tile:
				Tile.EMPTY:
					validMoves.append(Move.new(Move.Type.MOVE, coordCheck))
				Tile.ENEMY:
					validMoves.append(Move.new(Move.Type.CAPTURE, coordCheck))
				Tile.BLOCK:
					pass
	
	return validMoves
