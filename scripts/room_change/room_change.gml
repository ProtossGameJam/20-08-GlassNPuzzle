/// @description room_change(sprite)
/// @param sprite

if !instance_exists(obj_room_changer){
	var i = instance_create_depth(0,0,1,obj_room_changer);
	i.action = argument0;	
}