# win_handler.gd
# Handles checking win conditions
extends Node


var win_condition_list: Array[WinCondition] = []


func _ready() -> void:
	# Load win conditions
	for team_num in [1, 2]:
		win_condition_list.append(WinConditionLeader.new(team_num))


## Checks if there are winning or losing condition passed
func evaluate_win_conditions(win_context: WinContext) -> WinResult:
	# Find a result
	for winCondition in win_condition_list:
		var result := winCondition.check(win_context)
		
		if result.type != WinResult.Type.NONE:
			return result
	
	# Nothing to report
	return WinResult.new(WinResult.Type.NONE, TeamInfo.TEAM.NONE)
