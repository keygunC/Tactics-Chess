# board_info.gd
# Contains information relating to the board
extends Node


const CELL_SIZE := Vector2i(16, 16) ## Size of a single cell, in pixels
const BOARD_SIZE := Vector2i(8, 8) ## Board size (Column, Row)


const COORD_MIN := Vector2i(0, 0) ## Coordinate of the top left
const COORD_MAX := Vector2i(BOARD_SIZE.x - 1, BOARD_SIZE.y - 1) ## Coordinate of the bottom right


## Check if a coordinate is in board
func is_coord_in_board(coord: Vector2i) -> bool:
	return (
		(COORD_MIN.x <= coord.x) and (coord.x <= COORD_MAX.x)
		and (COORD_MIN.y <= coord.y) and (coord.y <= COORD_MAX.y)
	)
