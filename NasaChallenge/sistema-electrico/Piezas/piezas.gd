extends CharacterBody2D

var arrastrar = false
@onready var pieza1 = $CSimagen1
@onready var pieza2 = $CSimagen2
@onready var pieza3 = $CSimagen3
@onready var pieza4 = $CSimagen4
@onready var limit_top = $TopWall.global_position
@onready var limit_low = $DownWall.global_position
@onready var limit_left = $LeftWall.global_position
@onready var limit_right = $RightWall.global_position
@onready var destino1 = $destino1
@onready var destino2 = $destino2
@onready var destino3 = $destino3
@onready var destino4 = $destino4
@onready var canvav = $canvaV
@onready var canvaf = $canvaF



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index== MOUSE_BUTTON_LEFT:
			if event.pressed:
				arrastrar = true
			else:
				arrastrar = false
	
	if event is InputEventMouseMotion:
		var mover = event.relative
		if arrastrar:
			pieza1.global_position += mover *2.50
			pieza2.global_position += mover *1.0
			pieza3.global_position += mover *2.50
			pieza4.global_position += mover *1.0
			
			pieza1.global_position.x = clamp(pieza1.global_position.x, 0, 1150)
			pieza1.global_position.y = clamp(pieza1.global_position.y, 0, 650)
			pieza2.global_position.x = clamp(pieza2.global_position.x, 0, 1150)
			pieza2.global_position.y = clamp(pieza2.global_position.y, 0, 650)
			pieza3.global_position.x = clamp(pieza3.global_position.x, 0, 1150)
			pieza3.global_position.y = clamp(pieza3.global_position.y, 0, 650)
			pieza4.global_position.x = clamp(pieza4.global_position.x, 0, 1150)
			pieza4.global_position.y = clamp(pieza4.global_position.y, 0, 650)



func comprobar():
	var correctos = 0
	if pieza1.global_position.distance_to(destino1.global_position) <= 20\
	or pieza1.global_position.distance_to(destino2.global_position) <= 20\
	or pieza1.global_position.distance_to(destino3.global_position) <= 20\
	or pieza1.global_position.distance_to(destino4.global_position) <= 20:
		correctos += 1
		
	if pieza2.global_position.distance_to(destino1.global_position) <= 20\
	or pieza2.global_position.distance_to(destino2.global_position) <= 20\
	or pieza2.global_position.distance_to(destino3.global_position) <= 20\
	or pieza2.global_position.distance_to(destino4.global_position) <= 20:
		correctos += 1
		
	if pieza3.global_position.distance_to(destino1.global_position) <= 20\
	or pieza3.global_position.distance_to(destino2.global_position) <= 20\
	or pieza3.global_position.distance_to(destino3.global_position) <= 20\
	or pieza3.global_position.distance_to(destino4.global_position) <= 20:
		correctos += 1
		
	if pieza4.global_position.distance_to(destino1.global_position) <= 20\
	or pieza4.global_position.distance_to(destino2.global_position) <= 20\
	or pieza4.global_position.distance_to(destino3.global_position) <= 20\
	or pieza4.global_position.distance_to(destino4.global_position) <= 20:
		correctos += 1
	print("Correctos ", correctos)
	
	if correctos >= 3:
		canvav.show()
		canvaf.hide()
		print("estoy en el if")
	else:
		canvav.hide()
		canvaf.show()
		print("Estoy en el else")


func _on_comprobar_b_pressed() -> void:
	comprobar()
