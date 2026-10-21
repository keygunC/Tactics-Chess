# animation_handler.gd
# Handles piece's animation.
# TODO: perhaps let pieces independently send signal for animation instead.
extends Node2D


var piece_hover: Piece = null
var piece_selected: Piece = null

@onready var grid := %Grid
@onready var pieces := %Pieces


func _process(_delta: float) -> void:
	# Selecting state
	if not piece_selected:
		
		# If hovering over different tile, change hover animation target
		var newPieceHover: Piece = pieces.find_piece(grid.global_to_coord(get_global_mouse_position()))
		
		if newPieceHover != piece_hover:
			if piece_hover:
				piece_hover.animate_idle()
			if newPieceHover:
				newPieceHover.animate_hover()
			
			piece_hover = newPieceHover


## Selects a piece to animate being selected
func select_piece(piece: Piece) -> void:
	piece_selected = piece
	piece_selected.animate_selected()


## Deselect selected piece, back to being idle
func deselect_piece() -> void:
	piece_selected.animate_idle()
	piece_selected = null
