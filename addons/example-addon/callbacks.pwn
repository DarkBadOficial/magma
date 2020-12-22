// Callbacks file

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid,"Welcome to ~r~Magma",5000,5);

	new
		str_text[144],
		name[MAX_PLAYER_NAME]
	;

	GetPlayerName(playerid, name, 24);
	format(str_text, sizeof str_text, "%s joined the game.", name);
	SendClientMessageToAll(0xF79344FF, str_text);

	#if defined EA_OnPlayerConnect
		return EA_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect EA_OnPlayerConnect
#if defined EA_OnPlayerConnect
	forward EA_OnPlayerConnect(playerid);
#endif

public OnPlayerDisconnect(playerid, reason)
{
	new
		str_text[144],
		name[MAX_PLAYER_NAME]
	;

	GetPlayerName(playerid, name, 24);

	switch(reason)
	{
		case 0: format(str_text, sizeof str_text, "%s left the game (crash).", name);
		case 1: format(str_text, sizeof str_text, "%s left the game (leave).", name);
		case 2: format(str_text, sizeof str_text, "%s left the game (kick/ban).", name);
	}

	format(str_text, sizeof str_text, "%s left the game.", name);
	SendClientMessageToAll(0xF79344FF, str_text);

	#if defined EA_OnPlayerDisconnect
		return EA_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect EA_OnPlayerDisconnect
#if defined EA_OnPlayerDisconnect
	forward EA_OnPlayerDisconnect(playerid, reason);
#endif

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid, 0);

	#if defined EA_OnPlayerSpawn
		return EA_OnPlayerSpawn(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif

#define OnPlayerSpawn EA_OnPlayerSpawn
#if defined EA_OnPlayerSpawn
	forward EA_OnPlayerSpawn(playerid);
#endif

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid, 258.4893, -41.4008, 1002.0234);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid, 256.0815, -43.0475, 1004.0234);
	SetPlayerCameraLookAt(playerid, 258.4893, -41.4008, 1002.0234);

	#if defined EA_OnPlayerRequestClass
		return EA_OnPlayerRequestClass(playerid, classid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerRequestClass
	#undef OnPlayerRequestClass
#else
	#define _ALS_OnPlayerRequestClass
#endif

#define OnPlayerRequestClass EA_OnPlayerRequestClass
#if defined EA_OnPlayerRequestClass
	forward EA_OnPlayerRequestClass(playerid, classid);
#endif