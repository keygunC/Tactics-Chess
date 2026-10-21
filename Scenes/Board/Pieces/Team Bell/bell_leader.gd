# bell_leader.gd
extends Piece


@export var moveRule: MoveRule


func _ready():
	is_leader = true


## Gets all valid moves
func get_all_valid_moves(moveContext: MoveContext) -> Array[Move]:
	return moveRule.get_all_valid_moves(moveContext)


## Gets all actions
func get_all_action_set() -> Array:
	return [
		{
			"name": "Reverberate",
			"type": "reverberate",
		},
		{
			"name": "Forge Bell",
			"type": "forge_bell",
		},
	]
