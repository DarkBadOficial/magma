// Commands file

#include <sscanf2>

CMD:skin(playerid, params[])
{
    new skin;
    if (sscanf(params, "d", skin)) return SendClientMessage(playerid, -1, "Usage: /skin <skin>");
    SetPlayerSkin(playerid, skin);
	return 1;
}

CMD:vehicle(playerid, params[])
{
	new modelid, color1, color2, siren;
	if (sscanf(params, "D(411)D(3)D(6)D(0)", modelid, color1, color2, siren)) return SendClientMessage(playerid, -1, "Usage: /v <modelid = 411> <color 1 = 3> <color 2 = 6> <siren = 0>");
	if (color1 > 255 || color1 > 255) return SendClientMessage(playerid, -1, "Invalid color");
	
	new Float:x, Float:y, Float:z, Float:angle;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	new vehicle_id = CreateVehicle(modelid, x, y, z, angle, color1, color2, -1, siren);
	
	LinkVehicleToInterior(vehicle_id, GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(vehicle_id, GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicle(playerid, vehicle_id, 0);
	return 1;
}

CMD:cookies(playerid, params[])
{
	SendClientMessageEx(playerid, -1, "You have %d cookies!", cookies[playerid]);
	return 1;
}

CMD:givecookie(playerid, params[])
{
	cookies[playerid] ++;
	SendClientMessageEx(playerid, -1, "Now you have %d cookies (+1)!", cookies[playerid]);
	return 1;
}