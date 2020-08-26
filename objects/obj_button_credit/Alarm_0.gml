if !credit_on and !instance_exists(obj_show_credit) {
	credit_on = !credit_on;
	instance_create_layer(0,0,"ui_eff",obj_show_credit);
}else if instance_exists(obj_show_credit) and obj_show_credit.timer >= obj_show_credit.timer_max{
	obj_show_credit.phase_on = true;
	credit_on = 0;
}