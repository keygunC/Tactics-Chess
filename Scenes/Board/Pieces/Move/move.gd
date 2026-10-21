# move.gd
# A move type, containing what this move is going to do
class_name Move
extends RefCounted

## Valid moves
enum Type {
	MOVE, 		## Moves into an empty space
	CAPTURE,	## Kills and moves into an enemy piece
	SHOOT,		## Kills an enemy piece without moving
}

var type: Type
var to: Vector2i	## Target coordinate


func _init(init_type: Type, init_to: Vector2i) -> void:
	self.type = init_type
	self.to = init_to
