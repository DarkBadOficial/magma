// Callbacks file

public OnRouteCalculated(Path:pathid, playerid)
{
    if(!IsValidPath(pathid)) return 0;

    /* Destroy old gangzones */
	for(new i; i < 50; i ++)
	{
		if(PLAYER_GANGZONES[playerid][i] != -1)
		{
		    GangZoneDestroy(PLAYER_GANGZONES[playerid][i]);
		    PLAYER_GANGZONES[playerid][i] = -1;
		}
	}

	new 
		index,
		size,
		MapNode:nodeid,
		Float:length,
		Float:pos[6]
	;

	GetPathSize(pathid, size);
	GetPathLength(pathid, length);

	if(size == 1) return CancelTracing(playerid);

	GetPlayerPos(playerid, pos[3], pos[4], pos[5]);
	GetClosestMapNodeToPoint(pos[3], pos[4], pos[5], nodeid);
	GetMapNodePos(nodeid, pos[3], pos[4], pos[5]);

	for(new x = 0; x < 50; x ++)
	{
		GetPathNode(pathid, x, nodeid);
		GetPathNodeIndex(pathid, nodeid, index);
		GetMapNodePos(nodeid, pos[0], pos[1], pos[2]);

		if(x == index)
		{
			new node_size = floatround( ReturnRouteDistance(pos[3], pos[4], pos[0], pos[1]) / 12.5);

			for(new i = 1; i <= node_size; i++)
			{
				new Float:node_pos[2];

				if(i != 0)
				{
					node_pos[0] = pos[3] + (((pos[0] - pos[3]) / node_size) * i);
					node_pos[1] = pos[4] + (((pos[1] - pos[4]) / node_size) * i);
				}
				else
				{
					node_pos[0] = pos[3];
					node_pos[1] = pos[4];
				}

				new slot = 0;
				while(slot <= 50)
				{
					if(slot == 50)
					{
						slot = -1;
						break;
					}

					if(PLAYER_GANGZONES[playerid][slot] == -1)
					{
						break;
					}
					slot ++;
				}

				if(slot == -1) return 1;

				PLAYER_GANGZONES[playerid][slot] = GangZoneCreate(node_pos[0] - 12.5, node_pos[1] - 12.5, node_pos[0] + 12.5, node_pos[1] + 12.5);
				GangZoneShowForPlayer(playerid, PLAYER_GANGZONES[playerid][slot], GPS_PLAYER[playerid][gps_color]);
			}
		}

		pos[3] = pos[0] + 0.5;
		pos[4] = pos[1] + 0.5;
	}
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	StartTracing(playerid, fX, fY, fZ);
	
	#if defined RT_OnPlayerClickMap
		return RT_OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerClickMap
	#undef OnPlayerClickMap
#else
	#define _ALS_OnPlayerClickMap
#endif

#define OnPlayerClickMap RT_OnPlayerClickMap
#if defined RT_OnPlayerClickMap
	forward RT_OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ);
#endif

public OnPlayerConnect(playerid)
{
	GPS_PLAYER[playerid][gps_color] = 0x9C0DE6FF;

	#if defined RT_OnPlayerConnect
		return RT_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect RT_OnPlayerConnect
#if defined RT_OnPlayerConnect
	forward RT_OnPlayerConnect(playerid);
#endif

public OnPlayerDisconnect(playerid, reason)
{
	CancelTracing(playerid);

	#if defined RT_OnPlayerDisconnect
		return RT_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect RT_OnPlayerDisconnect
#if defined RT_OnPlayerDisconnect
	forward RT_OnPlayerDisconnect(playerid, reason);
#endif