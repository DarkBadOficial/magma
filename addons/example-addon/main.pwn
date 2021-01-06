// Main file

#include "../../addons/example-addon/header.pwn"
#include "../../addons/example-addon/functions.pwn"
#include "../../addons/example-addon/timers.pwn"
#include "../../addons/example-addon/commands.pwn"
#include "../../addons/example-addon/callbacks.pwn"

public OnGameModeInit()
{
	Logger_Debug("Addon 'example-addon' loaded!");
	
	AddPlayerClass(294, 1958.3783, 1343.1572, 15.3746, 270.1425, 0, 0, 0, 0, -1, -1);
	AddPlayerClass(35, 1958.3783, 1343.1572, 15.3746, 270.1425, 0, 0, 0, 0, -1, -1);
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 270.1425, 0, 0, 0, 0, -1, -1);

	UsePlayerPedAnims();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	SetNameTagDrawDistance(30.0);

	#if defined EA_OnGameModeInit
		return EA_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit EA_OnGameModeInit
#if defined EA_OnGameModeInit
	forward EA_OnGameModeInit();
#endif