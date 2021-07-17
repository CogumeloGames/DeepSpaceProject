extends Node

const DEFAULT_IP    = "127.0.0.1"
const DEFAULT_PORT  = 6969

var network         = NetworkedMultiplayerENet.new()
var selectedIP      = DEFAULT_IP
var selectedPort    = DEFAULT_PORT

var localPlayerID   = 0
sync var Players    = {}
sync var PlayerData = {}

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	

func _connect_to_server():
	get_tree().connect("connected_to_server", self, "_connected_ok")
	network.create_client(selectedIP, selectedPort)
	get_tree().set_network_peer(network)
	

func _player_connected(id):
	print("Player: " + str(id) + " Connected")
	

func _played_disconnected(id):
	print("Player: " + str(id) + " Disonnected")
	

func _connection_ok():
	print("Successfully connected to server")
	

func _connection_fail():
	print("Connection failed")
	

func _server_disconnected():
	print("Disconnected")
	
