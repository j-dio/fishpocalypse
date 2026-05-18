extends Node

enum Phase { DAY, NIGHT, TRANSITION }

signal day_started(day_number: int)
signal night_started(day_number: int)
signal wave_cleared
signal buff_day_reached(day_number: int)

var current_phase: Phase = Phase.DAY
var day_count: int = 1
