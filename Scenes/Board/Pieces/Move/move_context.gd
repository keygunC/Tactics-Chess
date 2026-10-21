# move_context.gd
# Provides context for pieces to determine valid moves.
class_name MoveContext


var pieceSelected: Piece
var pieceSelectedCoord: Vector2i
var pieceGrid: Dictionary # TODO: Perhaps make a custom class for the grid for safe and intended access


func _init(
	init_pieceGrid: Dictionary,
	init_pieceSelected: Piece = null,
	init_pieceSelectedCoord: Vector2i = Vector2i(-1, -1),
) -> void:
	self.pieceSelected = init_pieceSelected
	self.pieceSelectedCoord = init_pieceSelectedCoord
	self.pieceGrid = init_pieceGrid
