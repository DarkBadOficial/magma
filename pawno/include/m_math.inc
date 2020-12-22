#if !defined PI
	#define PI									(Float:3.14159265)
#endif

#if !defined INFINITY
	#define INFINITY							cellmax
#endif

#if !defined NEG_INFINITY
	#define NEG_INFINITY						cellmin
#endif

#if !defined FLOAT_INFINITY
	#define FLOAT_INFINITY						(Float:0x7F800000)
#endif

#if !defined FLOAT_NEG_INFINITY
	#define FLOAT_NEG_INFINITY					(Float:0xFF800000)
#endif

#if !defined FLOAT_NAN
	#define FLOAT_NAN							(Float:0x7FFFFFFF)
#endif

stock bool:IsNaN(number)
{
	return (number != number);
}

stock GetPointOnEdgeOfCircle(&Float:x, &Float:y, Float:r, Float:a, bool:isGTAAngle = false)
{
	if (isGTAAngle)
	{
		a += 90.0;
	}
	x += r * floatcos(a, degrees);
	y += r * floatsin(a, degrees);
}

stock Float:frand(Float:min, Float:max)
{
    return float(random(floatround(min) - floatround(max))) + min + float(random(1000)) / 1000.0;
}

stock Float:float_random(Float:max) 
{ 
	return floatdiv(float(random(0)), floatdiv(float(cellmax), max)); 
}

stock Float:mathfrandom(Float:min, Float:max) 
{ 
	return floatadd(float_random(floatsub(max, min)), min); 
}

stock GetXYFromAngle(&Float:x, &Float:y, Float:a, Float:distance)
{
	x += (distance*floatsin(-a,degrees));
	y += (distance*floatcos(-a,degrees));
}

stock GetXYZFromAngle(&Float:x, &Float:y, &Float:z, Float:angle, Float:elevation, Float:distance)
{
	x += distance * floatsin(angle, degrees) * floatcos(elevation, degrees);
	y += distance * floatcos(angle, degrees) * floatcos(elevation, degrees);
	z += distance * floatsin(elevation, degrees);
}

stock Float:CalculateVelocity(Float:x, Float:y, Float:z)
{
	return floatsqroot((x * x) + (y * y) + (z * z)) * 150.0;
}

stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range)
{
	a1 -= a2;
	return (a1 < range) && (a1 > -range);
}