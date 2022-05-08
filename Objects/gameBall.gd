@tool
extends RigidDynamicBody2D
class_name gameBall
@export_range(0,29) var ballImage:int=0:
	set(val):
		ballImage=val
		updateTexture(val)
	get:return ballImage
var sprite=Sprite2D.new()
#sets default texture for ball
func _init():
	add_child(sprite)
	sprite.texture=load("res://textures/balls.png")
	updateTexture(ballImage)
	var col=CollisionShape2D.new()
	col.shape=CircleShape2D.new()
	col.shape.radius=7.5
	add_child(col)
	connect("body_shape_entered",func(a):print(a))
#updates current texture for ball
func updateTexture(val):
	sprite.region_enabled=true
	var x=ballImage*15
	sprite.region_rect=Rect2(x,0,15,15)


func _integrate_forces(state):
	if linear_velocity.length()>600:
		linear_velocity.normalized()*600
