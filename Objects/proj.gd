extends Sprite2D

class_name proj
var max_dist=0.0
var time=0.0
var curve=null
var pathLine=Line2D.new()
func _ready():
	
	texture=load("res://textures/rocket.png")
	max_dist=curve.get_point_position(1).x
	scale*=2
	add_child(pathLine)
	pathLine.texture_mode=Line2D.LINE_TEXTURE_TILE
	pathLine.width=1.5
	pathLine.texture=load("res://dotLine.png")
	pathLine.top_level=true
	position.y=(curve.interpolate(time)+0.5)*288
	position.x=time*320
	visible=true


func _process(delta):
	time+=delta*2.5*pow(max_dist,0.5)
	var cur_pos=position
	position.y=(curve.interpolate(time)+0.5)*288
	position.x=time*320
	pathLine.add_point(position)
	var look_at=cur_pos-position
	look_at(position+look_at)
	rotation-=PI/2
	if time>max_dist:
		explode()
		


func explode():
	var ball=get_parent().get_node("gameBall")
	if (ball.global_position-global_position).length()<48:
		var divval=(ball.global_position-global_position).length()-16
		if divval<1:divval=1
		ball.apply_central_impulse((ball.global_position-global_position).normalized()*50/divval)
	var explosion=explosion_projectile.new()
	explosion.global_position=global_position
	get_parent().add_child(explosion)
	Global.playSound("explosion")
	queue_free()
