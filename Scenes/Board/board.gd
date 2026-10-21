# board.gd
# Main board that manages the core gameplay
extends Node2D


var piece_selected: Piece = null:
	set(value):
		piece_selected = value
		
		# Spread it out
		if piece_selected:
			animation_handler.select_piece(piece_selected)
			marker.select_coord(piece_selected.global_position)
			move_indicator.display_moves(piece_selected.get_all_valid_moves(create_move_context()))
			hud.display_action_set(piece_selected.get_all_action_set())
		else:
			animation_handler.deselect_piece()
			marker.deselect_coord()
			move_indicator.clear_moves()
			hud.display_action_set([])
var action_selected = null


# Logics
@onready var turn_handler := %TurnHandler
@onready var win_handler := %WinHandler
@onready var grid := %Grid
@onready var pieces := %Pieces

# Visuals
@onready var animation_handler := %AnimationHandler
@onready var marker := %Marker
@onready var move_indicator := %MoveIndicator
@onready var hud := %HUD


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("select"):
		handle_select()
	
	elif event.is_action_pressed("cancel"):
		handle_cancel()


## handles input: select
func handle_select() -> void:
	# Select a piece
	if piece_selected == null:
		handle_piece_select()
	
	# Move a piece
	elif piece_selected:
		# TODO: 
		handle_piece_move()


## Handles input: cancel
func handle_cancel() -> void:
	if piece_selected:
		piece_deselect()


## Handles selecting a piece
func handle_piece_select() -> void:
	var target_coord = grid.global_to_coord(get_global_mouse_position())
	
	# Check if piece is valid to select
	var piece_check = pieces.find_piece(target_coord)
	if piece_check and (piece_check.team_num == turn_handler.current()):
		# Selection time!
		piece_select(piece_check)


## Handles moving a piece
func handle_piece_move() -> void:
	var coord_from = grid.global_to_coord(piece_selected.global_position)
	var coord_to = grid.global_to_coord(get_global_mouse_position())
	var is_moved: bool = pieces.try_move(coord_from, coord_to, create_move_context())
	
	# If move is successful
	if is_moved:
		# Check for if someone won or lost
		var result: WinResult = win_handler.evaluate_win_conditions(create_win_context())
		match result.type:
			WinResult.Type.NONE:
				next_turn()
			_:
				send_win_result(result)
	
	# De-select piece
	piece_deselect()


## Selects a piece
func piece_select(piece: Piece) -> void:
	piece_selected = piece


## Deselects selected piece
func piece_deselect() -> void:
	piece_selected = null


## Change to the next turn
func next_turn() -> void:
	turn_handler.next()


## Send significant win result to update children
func send_win_result(result: WinResult) -> void:
	hud.display_win_result(result)


######################
## Context creation ##
######################


## Creates move context to give to pieces
func create_move_context() -> MoveContext:
	var move_context := MoveContext.new(pieces.piece_grid, piece_selected)

	if piece_selected:
		move_context.pieceSelectedCoord = grid.global_to_coord(piece_selected.global_position)
	
	return move_context


## Creates win context for win condition checking
func create_win_context() -> WinContext:
	return WinContext.new(pieces.piece_grid)


#####################
## Signal triggers ##
#####################


func _on_turn_handler_signal_new_turn(team_num: int) -> void:
	hud.display_team_turn(team_num)


func _on_moveset_ui_signal_moveset_selected(_move: Variant) -> void:
	pass # Replace with function body.
