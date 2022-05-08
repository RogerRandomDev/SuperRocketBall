extends CanvasLayer



var hovered


var rocketCount=3
func _input(event):
	if Input.is_action_just_pressed("lMouse")&&rocketCount>0&&get_parent().get_global_mouse_position().y>16:
		get_parent().get_node("curveManager").fire_projectile()
		rocketCount-=1
		update_rocket_count()

func update_rocket_count():
	get_node("v/2/Rockets").text="Rockets:%s/3"%str(rocketCount)
	

var time=0.0
func _process(delta):
	if rocketCount<3:
		time+=delta
	
		get_node("v/2/TextureProgressBar").value=time
		if time>1:
			time-=1
			
			rocketCount=min(rocketCount+1,3)
			update_rocket_count()


func _on_button_button_down():
	get_parent().get_node("gameBall").ballImage=(get_parent().get_node("gameBall").ballImage-1)%30


func _on_button_2_button_down():
	get_parent().get_node("gameBall").ballImage=(get_parent().get_node("gameBall").ballImage+1)%30


func _on_v_mouse_entered():hovered=true


func _on_v_mouse_exited():hovered=false
