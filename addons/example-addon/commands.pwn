// Commands file

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