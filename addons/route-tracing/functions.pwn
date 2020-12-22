// Functions file

stock StartTracing(playerid, Float:x, Float:y, Float:z)
{
	CancelTracing(playerid);
	GPS_PLAYER[playerid][gps_activated] = true;
	GPS_PLAYER[playerid][gps_timer] = SetTimerEx("UpdatePlayerTracing", 500, true, "ifff", playerid, x, y, z);
	return 1;
}

stock CancelTracing(playerid)
{
	if (GPS_PLAYER[playerid][gps_activated] == true)
	{
		GPS_PLAYER[playerid][gps_activated] = false;
		KillTimer(GPS_PLAYER[playerid][gps_timer]);

		for(new i; i < 50; i ++)
		{
			if(PLAYER_GANGZONES[playerid][i] != -1)
			{
			    GangZoneDestroy(PLAYER_GANGZONES[playerid][i]);
			    PLAYER_GANGZONES[playerid][i] = -1;
			}
		}
	}
	return 1;
}

stock SetTracingColor(playerid, color)
{
	GPS_PLAYER[playerid][gps_color] = color;
	return 1;
}

stock GetTracingColor(playerid)
{
	return GPS_PLAYER[playerid][gps_color];
}

stock Float:ReturnRouteDistance(Float:init_x, Float:init_y, Float:final_x, Float:final_y)
{
	new 
		Float:dis_x = floatpower( floatsub(init_x, final_x), 2.0),
		Float:dis_y = floatpower( floatsub(init_y, final_y), 2.0)
	;

	return floatsqroot( floatadd( dis_x, dis_y));
}