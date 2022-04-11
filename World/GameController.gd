extends Node

const HOURTIME = 5.0
var remainingTime = -1
var dayEnd = false
var hour = 5
var WorldtoBeUpdated = false
var CoopToBeUpdated = false



func isDayEnd():
	if dayEnd:
		EOD()
	else:
		if hour == 23:
			dayEnd = true
			#debug
			EOD()
		else:
			nextHour()
func nextDay():
	PlayerStats.day += 1
	if PlayerStats.day == 31:
		PlayerStats.month += 1
		change_weather()
		PlayerStats.day = 1
	hour = 5 
	dayEnd = false
	WorldtoBeUpdated = true
	CoopToBeUpdated = true
	nextHour()
	print("Day: " + str(PlayerStats.day))
func nextHour():
	hour += 1
	get_tree().call_group("Player", "Start_Timer")
	print("Hour: " + str(hour))
	
func change_weather():
	if PlayerStats.month % 3 == 0:
		if PlayerStats.season == 0:
			PlayerStats.season = 1
		else:
			PlayerStats.season = 0

func EOD():
	get_tree().change_scene("res://UI/DayEnd.tscn")
