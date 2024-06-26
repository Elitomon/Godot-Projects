extends Control

var player_words = []
var prompts =  ["a name", "an adjective", "a noun", "a noun"]
var story = "%s is the %s person ive ever seen who loves %s and %s"

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	DisplayText.text = "Hello welcome to looneylips we're gonna tell a story! "
	check_player_words_length()
	PlayerText.grab_focus()


func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()
		PlayerText.grab_focus()
 

func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()


func tell_story():
	DisplayText.text = story % player_words
 

func prompt_player():
	DisplayText.text += "May I have " + prompts[player_words.size()] + " please?"


func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = "again?"
	tell_story()





