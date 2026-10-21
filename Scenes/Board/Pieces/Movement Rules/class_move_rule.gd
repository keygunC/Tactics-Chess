# class_move_rule.gd
# Abstract class for swappable/appendable movement rules.
class_name MoveRule
extends Resource


enum Tile {
	EMPTY,
	ENEMY,
	BLOCK,
}


## Returns all valid moves for this rule
func get_all_valid_moves(_movementContext: MoveContext) -> Array[Move]:
	return []


## Gets tile's content type
func get_tile(coord: Vector2i, team_num: int, pieceGrid: Dictionary) -> Tile:
	if not BoardInfo.is_coord_in_board(coord):
		return Tile.BLOCK
	
	var pieceCoord: Piece = pieceGrid.get(coord)
	if pieceCoord:
		if pieceCoord.team_num == team_num:
			return Tile.BLOCK
		else:
			return Tile.ENEMY
	
	return Tile.EMPTY
