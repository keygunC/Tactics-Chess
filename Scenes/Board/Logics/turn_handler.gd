# turn_handler.gd
# Handles team's turn state.
class_name TurnHandler
extends Node


signal signal_new_turn(team_num: int)

var teams: Array[int] = []
var index := 0


func _ready() -> void:
	teams.append(1)
	teams.append(2)
	
	await get_tree().process_frame
	
	signal_new_turn.emit(teams[index])


## Current turn's team
func current() -> int:
	return teams[index]


## Change to the next turn
func next() -> void:
	index = (index + 1) % teams.size()
	signal_new_turn.emit(teams[index])
