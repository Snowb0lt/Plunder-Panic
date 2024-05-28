extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_information_pressed():
	get_node("Instructions").visible = true
	get_node("Menu Options").visible = false
	TutorSlide3.visible = false
	TutorSlide2.visible = false
	TutorSlide1.visible = true
	slideNumber = 1


func _on_button_pressed():
	get_node("Instructions").visible = false
	get_node("Menu Options").visible = true

var slideNumber
@onready var TutorSlide1 = get_node("Instructions/Instruction Text PT1")
@onready var TutorSlide2 = get_node("Instructions/Instruction Text PT2")
@onready var TutorSlide3 = get_node("Instructions/Instruction Text PT3")
func _on_next_button_pressed():
	if TutorSlide1.visible:
		TutorSlide1.visible = false
		TutorSlide2.visible = true
		return
	if TutorSlide2.visible:
		TutorSlide2.visible = false
		TutorSlide3.visible = true
		return
	if TutorSlide3.visible:
		TutorSlide3.visible = false
		TutorSlide1.visible = true
		return


func _on_stop_button_pressed():
	if TutorSlide1.visible:
		TutorSlide1.visible = false
		TutorSlide3.visible = true
		return
	if TutorSlide2.visible:
		TutorSlide2.visible = false
		TutorSlide1.visible = true
		return
	if TutorSlide3.visible:
		TutorSlide3.visible = false
		TutorSlide2.visible = true
		return
