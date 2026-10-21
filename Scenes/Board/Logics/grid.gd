# grid.gd
# Translates between global position and coordinate
extends TileMapLayer


## Translates global position to coordinate
func global_to_coord(position_global: Vector2) -> Vector2i:
	return local_to_map(to_local(position_global))


## Translates coordinate to global position
func coord_to_global(coord: Vector2i) -> Vector2:
	return to_global(map_to_local(coord))
