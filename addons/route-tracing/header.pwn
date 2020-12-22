// Header file

// Libs
#include <GPS>

forward OnRouteCalculated(Path:pathid, playerid);

enum player_gps
{
	bool:gps_activated,
	gps_color,
	gps_timer
}
new GPS_PLAYER[MAX_PLAYERS][player_gps];
new PLAYER_GANGZONES[MAX_PLAYERS][50];