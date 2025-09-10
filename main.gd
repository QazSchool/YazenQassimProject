extends Node2D

var poang = 0
var situationer = [
	{
		"text": "Du ser någon tappa sin plånbok.",
		"val": [
			{"svar": "Ge tillbaka plånboken.", "poang": 2},
			{"svar": "Ta pengarna och släng resten.", "poang": -2},
			{"svar": "Ignorera och gå vidare.", "poang": -1}
		]
	},
	{
		"text": "Din vän glömmer sina läxor.",
		"val": [
			{"svar": "Låna ut dina svar.", "poang": 1},
			{"svar": "Skratta åt vännen.", "poang": -2},
			{"svar": "Uppmuntra vännen att försöka själv.", "poang": 2}
		]
	}
]

var nuvarande_index = 0

@onready var text_label = $TextLabel
@onready var knapp1 = $Button1
@onready var knapp2 = $Button2
@onready var knapp3 = $Button3

func _ready():
	visa_situation()

func visa_situation():
	if nuvarande_index < situationer.size():
		var sit = situationer[nuvarande_index]
		text_label.text = sit["text"]
		knapp1.text = sit["val"][0]["svar"]
		knapp2.text = sit["val"][1]["svar"]
		knapp3.text = sit["val"][2]["svar"]
	else:
		visa_resultat()

func val_gjord(val_index: int):
	var sit = situationer[nuvarande_index]
	poang += sit["val"][val_index]["poang"]
	nuvarande_index += 1
	visa_situation()

func _on_Button1_pressed():
	val_gjord(0)

func _on_Button2_pressed():
	val_gjord(1)

func _on_Button3_pressed():
	val_gjord(2)

func visa_resultat():
	if poang >= 3:
		text_label.text = "Du är en god person som bryr dig om andra! 😊"
	elif poang >= 0:
		text_label.text = "Du är lite mittemellan – ibland godhjärtad, ibland självisk."
	else:
		text_label.text = "Dina val visar att du ofta sätter dig själv först. 😕"
	knapp1.hide()
	knapp2.hide()
	knapp3.hide()
