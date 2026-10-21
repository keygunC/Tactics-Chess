# move_rule_pawn.gd
# Moves by one orthogonally, or capture by one diagonally
class_name MoveRulePawn
extends MoveRule


## Gets all valid moves
func get_all_valid_moves(moveContext: MoveContext) -> Array[Move]:
	var validMoves: Array[Move] = []
	
	# Move
	for offset: Vector2i in [Vector2i.RIGHT, Vector2i.UP, Vector2i.LEFT, Vector2i.DOWN]:
		var coordCheck: Vector2i = moveContext.pieceSelectedCoord + offset
		var tile := get_tile(coordCheck, moveContext.pieceSelected.team_num, moveContext.pieceGrid)
		match tile:
			Tile.EMPTY:
				validMoves.append(Move.new(Move.Type.MOVE, coordCheck))
			Tile.ENEMY:
				pass
			Tile.BLOCK:
				pass
	
	# Capture
	for offset in [Vector2i(1, -1), Vector2i(-1, -1), Vector2i(-1, 1), Vector2i(1, 1)]:
		var coordCheck: Vector2i = moveContext.pieceSelectedCoord + offset
		var tile := get_tile(coordCheck, moveContext.pieceSelected.team_num, moveContext.pieceGrid)
		match tile:
			Tile.EMPTY:
				pass
			Tile.ENEMY:
				validMoves.append(Move.new(Move.Type.CAPTURE, coordCheck))
			Tile.BLOCK:
				pass
	
	return validMoves
