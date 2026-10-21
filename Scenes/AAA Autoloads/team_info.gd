# team_info.gd
# Contains team type, piece scenes, and formation
extends Node

## Kinds of teams
enum TEAM {NONE, CHESS, PLACEHOLDER, BELL}

## Translates enum Team to printable string
const TEAM_STRING := {
	TEAM.NONE: "None",
	TEAM.CHESS: "Chess",
	TEAM.PLACEHOLDER: "Place Holder",
	TEAM.BELL: "Bell",
}

## Formation list
const formation := {
	TEAM.BELL: formation_bell,
	TEAM.CHESS: formation_chess,
	TEAM.PLACEHOLDER: formation_placeholder,
}


# Team Bell
const bell_leader := preload("res://Scenes/Board/Pieces/Team Bell/bell_leader.tscn")
const bell_round := preload("res://Scenes/Board/Pieces/Team Bell/bell_round.tscn")

const formation_bell := [
	[
		bell_round, bell_round, bell_round, bell_leader,
		bell_round, bell_round, bell_round, bell_round,
	],
	[
		bell_round, bell_round, bell_round, bell_round,
		bell_round, bell_round, bell_round, bell_round,
	],
]


# Team Chess
const chess_pawn := preload("res://Scenes/Board/Pieces/Team Chess/chess_pawn.tscn")
const chess_rook := preload("res://Scenes/Board/Pieces/Team Chess/chess_rook.tscn")
const chess_knight := preload("res://Scenes/Board/Pieces/Team Chess/chess_knight.tscn")
const chess_bishop := preload("res://Scenes/Board/Pieces/Team Chess/chess_bishop.tscn")
const chess_queen := preload("res://Scenes/Board/Pieces/Team Chess/chess_queen.tscn")
const chess_king := preload("res://Scenes/Board/Pieces/Team Chess/chess_king.tscn")

const formation_chess := [
	[
		chess_rook, chess_knight, chess_bishop, chess_king,
		chess_queen, chess_bishop, chess_knight, chess_rook,
	],
	[
		chess_pawn, chess_pawn, chess_pawn, chess_pawn,
		chess_pawn, chess_pawn, chess_pawn, chess_pawn,
	],
]


# Team Placeholder
const ph_leader := preload("res://Scenes/Board/Pieces/Team Placeholder/ph_leader.tscn")
const ph_minion := preload("res://Scenes/Board/Pieces/Team Placeholder/ph_minion.tscn")

const formation_placeholder := [
	[
		ph_minion, ph_minion, ph_minion, ph_leader,
		ph_minion, ph_minion, ph_minion, ph_minion,
	],
	[
		ph_minion, ph_minion, ph_minion, ph_minion,
		ph_minion, ph_minion, ph_minion, ph_minion,
	],
]
