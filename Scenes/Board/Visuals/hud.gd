# hud.gd
# Handles gamestate displays.
extends CanvasLayer


@onready var label_team_turn := $LabelTeamTurn
@onready var label_win_result := $LabelWinResult
@onready var action_set_ui:= $ActionSetUI


#################
## Text update ##
#################


## Updates text of team turn
func label_team_turn_show(team_name: String) -> void:
	label_team_turn.text = team_name + "'s Turn"


## Updates text of win result
func label_win_result_show(win_result: String) -> void:
	label_win_result.text = win_result


#############
## Display ##
#############


## Displays special move options of a piece
func display_action_set(action_set: Array) -> void:
	action_set_ui.display_action_set(action_set)


## Displays new turn
func display_team_turn(team_num: int) -> void:
	var team_type
	if team_num == 1:
		team_type = GameState.team1
	elif team_num == 2:
		team_type = GameState.team2
	else:
		push_error("hud.gd: non-exhaustive team_num")
	
	label_team_turn_show(TeamInfo.TEAM_STRING[team_type])


## Displays win result
func display_win_result(win_result: WinResult) -> void:
	var team_type
	if win_result.team_num == 1:
		team_type = GameState.team1
	elif win_result.team_num == 2:
		team_type = GameState.team2
	else:
		push_error("hud.gd: non-exhaustive team_num")
	
	match win_result.type:
		WinResult.Type.NONE:
			pass
		WinResult.Type.WIN:
			label_win_result_show(TeamInfo.TEAM_STRING[team_type] + " Won!")
		WinResult.Type.LOSE:
			label_win_result_show(TeamInfo.TEAM_STRING[team_type] + " Lost!")
		WinResult.Type.DRAW:
			label_win_result_show("It's a Draw!")
