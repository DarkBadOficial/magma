// Timers file

forward UpdatePlayerTracing(playerid, Float:x, Float:y, Float:z);
public UpdatePlayerTracing(playerid, Float:x, Float:y, Float:z)
{
	new 
		Float:pos[3],
		Float:init_distance,
		MapNode:point[2]
	;

	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	init_distance = ReturnRouteDistance(x, y, pos[0], pos[1]);

	if (init_distance <= 2.0) return CancelTracing(playerid);
	if (GetClosestMapNodeToPoint(pos[0], pos[1], pos[2], point[0]) != 0) return 0;
    if (GetClosestMapNodeToPoint(x, y, z, point[1])) return 0;
    if (FindPathThreaded(point[0], point[1], "OnRouteCalculated", "i", playerid)) return 1;
	return 1;
}