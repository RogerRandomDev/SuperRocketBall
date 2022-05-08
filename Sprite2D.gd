extends Node2D

var curve=Curve.new()
func _ready():
	curve.add_point(Vector2(0,0))
	curve.add_point(Vector2(1,0))

#updates sprite curve
func update_texture(mPos):
	
	var mod=0
	if mPos.y<0:mod=1
	curve.set_point_value(1,mPos.y)
	curve.set_point_offset(1,mPos.x/256+0.5)
	curve.set_point_value(0,0.0)
	curve.set_point_left_tangent(1,(mPos.y-0.5+PI*(mod*2-0.875)*1.1)*0.25)
	curve.set_point_right_tangent(0,(PI*1.1- (mPos.y-0.5)-PI*mod*2.2)*0.25)

func _input(_event):
	if get_global_mouse_position().x<10:return
	update_texture(get_local_mouse_position())


func fire_projectile():
	var projectile=proj.new()
	projectile.curve=curve.duplicate(true)
	projectile.visible=false
	get_parent().add_child(projectile)
