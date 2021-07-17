extends Node

const SAVEGAME = "user://Savegame.json"

var saveData   = {}

func _ready():
	saveData = get_data()
	

func get_data():
	var file = File.new()
	
	if not file.file_exists(SAVEGAME):
		saveData = {"Player name": "Unnamed"}
		save_game()
		
	file.open(SAVEGAME, _File.READ)
	var content = file.get_as_text()
	var data    = parse_json(content)
	saveData = data
	file.close()
	return(data)
	

func save_game():
	var saveGame = File.new()
	saveGame.open(SAVEGAME, File.WRITE)
	saveGame.store_line(to_json(saveData))
