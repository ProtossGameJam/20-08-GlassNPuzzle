/// @description easing(ease, value)
/// @param ease
/// @param value

switch (argument0){
	case "in_quad":
		return argument1 * argument1;

	case "out_quad":
		return -argument1 * (argument1 - 2);

	case "in_out_quad":
		var t = argument1 * 2;
		if (t < 1)
			return 0.5 * t * t;
		t -= 1;
		return -0.5 * (t * (t - 2) - 1);

	case "in_cubic":
		return argument1 * argument1 * argument1;

	case "out_cubic":
		var t = argument1 - 1;
		return t * t * t + 1;

	case "in_out_cubic":
		var t = argument1 * 2;
		if (t < 1)
			return 0.5 * t * t * t;
		t -= 2;
		return 0.5 * (t * t * t + 2);

	case "in_quartic":
		return argument1 * argument1 * argument1 * argument1;

	case "out_quartic":
		var t = argument1 - 1;
		return -(t * t * t * t - 1);
		
	case "in_out_quartic":
		var t = argument1 * 2;
		if (t < 1)
			return 0.5 * t * t * t * t;
		t -= 2;
		return -0.5 * (t * t * t * t - 2);

	case "in_quintic":
		return argument1 * argument1 * argument1 * argument1 * argument1;

	case "out_quintic":
		var t = argument1 - 1;
		return t * t * t * t * t + 1;

	case "in_out_quintic":
		var t = argument1 * 2;

		if (t < 1)
		 return 0.5 * t * t * t * t * t;

		t -= 2;

		return 0.5 * (t * t * t * t * t + 2);

	case "in_sine":
		return -cos(argument1 * pi / 2) + 1;

	case "out_sine":
		return sin(argument1 * pi / 2);

	case "in_out_sine":
		return -0.5 * (cos(argument1 * pi) - 1);

	case "in_expo":
		if (argument1 = 0)
			return 0;
		return power(2, 10 * (argument1 - 1));

	case "out_expo":
		if (argument1 = 1)
			return 1;
		return -power(2, -10 * argument1) + 1;

	case "in_out_expo":
		if (argument1 = 0)
			return 0;
		else if (argument1 = 1)
			return 1;
			
		var t = argument1 * 2;
		if (t < 1)
			return 0.5 * power(2, 10 * (t - 1));
		return 0.5 * (-power(2, -10 * (t - 1)) + 2);

	case "in_circ":
		if (argument1 <= 0)
			return 0;
		else if (argument1 >= 1)
			return 1;
		return -(sqrt(1 - argument1 * argument1) - 1);

	case "out_circ":
		if (argument1 <= 0)
			return 0;
		else if (argument1 >= 1)
			return 1;

		var t = argument1 - 1;

		return sqrt(1 - t * t);

	case "in_out_circ":
		if (argument1 <= 0)
			return 0;
		else if (argument1 >= 1)
			return 1;
			
		var t = argument1 * 2;
		if (t < 1)
			return -0.5 * (sqrt(1 - t * t) - 1);
		t -= 2;
		return 0.5 * (sqrt(1 - t * t) + 1);

	case "in_elastic":
		if (argument1 = 0)
			return 0;
		else if (argument1 = 1)
			return 1;

		var p = 0.3;
		var s = p / 4;
		var t = argument1 - 1;
		return -(power(2, 10 * t)) * sin((t - s) * (2 * pi) / p);

	case "out_elastic":
		if (argument1 = 0)
			return 0;
		else if (argument1 = 1)
			return 1;
			
		var p = 0.3;
		var s = p / 4;
		return power(2, -10 * argument1) * sin((argument1 - s) * (2 * pi) / p) + 1;

	case "in_out_elastic":
		if (argument1 = 0)
			return 0;
		else if (argument1 = 1)
			return 1;

		var p = 0.3;
		var s = p / 4;
		var t = argument1 * 2 - 1;
		if (t < 0)
			return -0.5 * (power(2, 10 * t) * sin((t - s) * (2 * pi) / p));
		return power(2, -10 * t) * sin((t - s) * (2 * pi) / p) * 0.5 + 1;

	case "in_back":
		var s = 1.70158;
		return argument1 * argument1 * ((s + 1) * argument1 - s);

	case "out_back":
		var s = 1.70158;
		var t = argument1 - 1;
		return t * t * ((s + 1) * t + s) + 1;

	case "in_out_back":
		var s = 1.70158;
		var t = argument1 * 2;
		s *= 1.525;
		if (t < 1)
			return 0.5 * (t * t *((s + 1) * t - s));
		t -= 2;
		return 0.5 * (t * t * ((s + 1) * t + s) + 2);

	case "in_bounce":
		return 1 - easing("out_bounce",1 - argument1);

	case "out_bounce":
		var t = argument1;
		if (t < 1 / 2.75) {
			return 7.5625 * t * t;
		} else if (t < 2 / 2.75) {
		 t -= 1.5 / 2.75;
			return 7.5625 * t * t + 0.75;
		} else if (t < 2.5 / 2.75) {
		 t -= 2.25 / 2.75;
			return 7.5625 * t * t + 0.9375;
		} else {
		 t -= 2.625 / 2.75; 
			return 7.5625 * t * t + 0.984375;
		}

	case "in_out_bounce":
		if (argument1 < 0.5)
			return 0.5 - easing("in_bounce",1 - argument1 * 2) * 0.5;
		else
			return 0.5 + easing("out_bounce",argument1 * 2 - 1) * 0.5;

}
