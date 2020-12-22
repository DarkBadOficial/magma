stock SendClientMessageEx(playerid, color, const form[], {Float, _}: ...)
{
    #pragma unused form

    static
	   tmp[144]
    ;
    new
	   t1 = playerid,
	   t2 = color
    ;
    const
	   n4 = -4,
	   n16 = -16,
	   size = sizeof tmp
    ;
    #emit stack 28
    #emit push.c size
    #emit push.c tmp
    #emit stack n4
    #emit sysreq.c format
    #emit stack n16

    return (t1 == -1 ? (SendClientMessageToAll(t2, tmp)) : (SendClientMessage(t1, t2, tmp)) );
}

stock Float:CameraLookToAngle(playerid)
{
    new Float:x, Float:y, Float:z;
    GetPlayerCameraFrontVector(playerid, x, y, z);
    return atan2(y, x) + 270.0;
}

stock bool:IsFakeClient(playerid)
{  
    if (IsPlayerNPC(playerid)) return 0;
    
    new temp_id[80], temp_num;  
    gpci(playerid, temp_id, sizeof(temp_id));  
    for(new i = 0; i < strlen(temp_id); i++)  
    {  
        if (temp_id[i] >= '0' && temp_id[i] <= '9')  temp_num++;  
    }  
    return (temp_num >= 30 || strlen(temp_id) <= 30) ? true : false;
}

stock PreloadAnims(playerid)
{
    PreloadAnimLib(playerid, "DANCING");
    PreloadAnimLib(playerid, "HEIST9");
    PreloadAnimLib(playerid, "BOMBER");
    PreloadAnimLib(playerid, "RAPPING");
    PreloadAnimLib(playerid, "SHOP");
    PreloadAnimLib(playerid, "BEACH");
    PreloadAnimLib(playerid, "SMOKING");
    PreloadAnimLib(playerid, "FOOD");
    PreloadAnimLib(playerid, "ON_LOOKERS");
    PreloadAnimLib(playerid, "DEALER");
    PreloadAnimLib(playerid, "CRACK");
    PreloadAnimLib(playerid, "CARRY");
    PreloadAnimLib(playerid, "COP_AMBIENT");
    PreloadAnimLib(playerid, "PARK");
    PreloadAnimLib(playerid, "INT_HOUSE");
    PreloadAnimLib(playerid, "FOOD" );
    PreloadAnimLib(playerid, "ped" );
    PreloadAnimLib(playerid, "MISC" );
    PreloadAnimLib(playerid, "POLICE" );
    PreloadAnimLib(playerid, "GRAVEYARD" );
    PreloadAnimLib(playerid, "WUZI" );
    PreloadAnimLib(playerid, "SUNBATHE" );
    PreloadAnimLib(playerid, "PLAYIDLES" );
    PreloadAnimLib(playerid, "CAMERA" );
    PreloadAnimLib(playerid, "RIOT" );
    PreloadAnimLib(playerid, "DAM_JUMP" );
    PreloadAnimLib(playerid, "JST_BUISNESS" );
    PreloadAnimLib(playerid, "KISSING" );
    PreloadAnimLib(playerid, "GANGS" );
    PreloadAnimLib(playerid, "GHANDS" );
    PreloadAnimLib(playerid, "BLOWJOBZ" );
    PreloadAnimLib(playerid, "SWEET" );
}

stock PreloadAnimLib(playerid, const animlib[])
{
    ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}

stock bool:PlayerHasSwimAnim(playerid)
{
    new lib[16], anims[32];
    GetAnimationName(GetPlayerAnimationIndex(playerid), lib, sizeof(lib), anims, sizeof(anims));
    if (!isnull(lib) && !strcmp(lib, "SWIM")) return false;
    switch(GetPlayerAnimationIndex(playerid))
    {
       case 1538..1542, 1544, 1250, 1062: return false;
       default: return false;
    }
    return false;
}

stock ClearPlayerChatBox(playerid, ammount = 20)
{
    for(new i = 0; i != ammount; i++) SendClientMessage(playerid, -1, " ");
    return 1;
}

stock ClearPlayerKillFeed(playerid)
{
    if (IsPlayerConnected(playerid))
    {
        for(new i = 0; i != 5; i++)
        {
            SendDeathMessageToPlayer(playerid, MAX_PLAYERS, MAX_PLAYERS, 255);
        }
        return 1;
    }
    return 0;
}

stock ClearPlayerGameTexts(playerid)
{
    if (IsPlayerConnected(playerid))
    {
        for(new i = 0; i != 0; i++)
        {
            GameTextForPlayer(playerid, " ", 100, i);
        }
        return 1;
    }
    return 0;
}

stock PlaySoundForPlayersInRange(soundid, Float:x, Float:y, Float:z, Float:range = 50.0, worldid = VIRTUAL_WORLD_NORMAL, interiorid = INTERIOR_NORMAL)
{
    for(new playerid = 0, highestPlayerid = GetPlayerPoolSize(); playerid <= highestPlayerid; playerid++)
    {
        if (IsPlayerConnected(playerid) && GetPlayerInterior(playerid) == interiorid && worldid == GetPlayerVirtualWorld(playerid) && IsPlayerInRangeOfPoint(playerid, range, x, y, z))
        {
            PlayerPlaySound(playerid, soundid, x, y, z);
        }
    }
    return 1;
}