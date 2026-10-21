# pieces.gd
# Handles control of pieces in the board
extends Node2D


# Boardstate
var piece_grid: Dictionary[Vector2i, Piece] = {}

@onready var grid := %Grid


func _ready() -> void:
	# Spawns all pieces
	spawn_team(TeamInfo.formation[GameState.team1], 1)
	spawn_team(TeamInfo.formation[GameState.team2], 2)


## Spawns all pieces of a formation
## - team: 1 for left side, 2 for right side
func spawn_team(formation: Array, team_num: int):
	for column in range(formation.size()):
		for row in range(formation[column].size()):
			
			# Instantiate piece
			var piece_scene = formation[column][row]
			if piece_scene == null:
				continue
			var piece: Piece = piece_scene.instantiate()
			piece.team_num = team_num

			# Get coord and position
			var coord = Vector2i(column, row)
			if team_num == 2:
				coord.x = 7 - coord.x
			
			var new_global_position = grid.coord_to_global(coord)
			piece.global_position = new_global_position

			# Place it into the scene
			add_child(piece)
			piece_grid[coord] = piece
			
			# Flips the sprite of the right-side team
			if team_num == 2:
				piece.sprite.flip_h = true


## Returns the piece on a coord
func find_piece(coord: Vector2i) -> Piece:
	return piece_grid.get(coord)


## Moves a piece
## WARNING: Internal function, don't use outside
func _move_piece(from: Vector2i, to: Vector2i, piece: Piece) -> void:
	piece_grid.erase(from)
	piece_grid.set(to, piece)
	piece.global_position = grid.coord_to_global(to)


## Move a piece from coord to coord
func try_move(from: Vector2i, to: Vector2i, move_context: MoveContext) -> bool:
	var piece_from := find_piece(from)
	if not piece_from:
		return false
	
	var valid_moves := piece_from.get_all_valid_moves(move_context)
	
	for move in valid_moves:
		if move.to == to:
			match move.type:
				Move.Type.MOVE:
					_move_piece(from, to, piece_from)
				
				Move.Type.CAPTURE:
					# Removes target
					piece_grid.get(to).queue_free()
					_move_piece(from, to, piece_from)
				
				_:
					push_error("pieces.gd: try_move() match not exausted")
			
			return true
	
	return false
