extends Node

var network    = NetworkedMultiplayerENet.new()
var port       = 6969
var maxPlayers = 4

var players = {}

func _ready():
	start_server()
	

func start_server():
	network.create_server(port, maxPlayers)
	get_tree().set_network_peer(network)
	network.connect("peer_connected", self, "_player_connected")
	network.connect("peer_disconnected", self, "_player_disconnected")
	
	print("Server started")
	

func _player_connected(playerID):
	print("Player " + str(playerID) + " connected")
	

func _player_disconnected(playerID):
	print("Player " + str(playerID) + " disconnected")
	

remote func _send_player_info(id, playerData):
	players[id] = playerData
	rset("players", players)
	rpc("update_waiting_room")
	
