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

stock minrand(min, max)
{
	return random(max - min) + min;
}

stock Float:Distance(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
	return floatsqroot((((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2))+((z1-z2)*(z1-z2))));

stock Float:Distance2D(Float:x1, Float:y1, Float:x2, Float:y2)
	return floatsqroot( ((x1-x2)*(x1-x2)) + ((y1-y2)*(y1-y2)) );

stock Float:absoluteangle(Float:angle)
{
	while(angle < 0.0)angle += 360.0;
	while(angle > 360.0)angle -= 360.0;
	return angle;
}

stock IsPointInMapBounds(Float:x, Float:y, Float:z)
{
	if (-3000.0 <= x <= 3000.0)
	{
		if (-3000.0 <= y <= 3000.0)
		{
			if (-100.0 <= z <= 1000.0)
			{
				return 1;
			}
		}
	}
	return 0;
}

stock IsNumeric(const string[])
{
	for(new i,j=strlen(string);i<j;i++)if (string[i] > '9' || string[i] < '0') return 0;
	return 1;
}

stock IsCharNumeric(c)
{
	if (c>='0'&&c<='9')return 1;
	return 0;
}

stock IsCharAlphabetic(c)
{
	if ((c>='a'&&c<='z')||(c>='A'&&c<='Z'))return 1;
	return 0;
}