// Main file

#include "../../addons/route-tracing/header.pwn"
#include "../../addons/route-tracing/functions.pwn"
#include "../../addons/route-tracing/timers.pwn"
#include "../../addons/route-tracing/commands.pwn"
#include "../../addons/route-tracing/callbacks.pwn"

public OnGameModeInit()
{
	Logger_Debug("Addon 'route-tracing' loaded!");

	#if defined RT_OnGameModeInit
		return RT_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit RT_OnGameModeInit
#if defined RT_OnGameModeInit
	forward RT_OnGameModeInit();
#endif