extends Control

onready var playerName = $CenterContainer/VBoxContainer/GridContainer/NameTextBox
onready var selectedIP = $CenterContainer/VBoxContainer/GridContainer/IPTextBox
onready var selectedPort = $CenterContainer/VBoxContainer/GridContainer/PortTextBox

func _ready():
	playerName.text = Save.saveData("Player_name")
	selectedIP.text = Server.DEFAULT_IP
	selectedPort.text = str(Server.DEFAULT_PORT)

func _on_JoinButton_pressed():
	Server.selectedIP = selectedIP.text
	Server.selectedPort = str(selectedPort.text)
	Server._connect_to_server()
	

func _on_NameTextBox_text_changed(new_text):
	Save.saveData["Player_Name"] = playerName.text
	Save.SAVEGAME()
