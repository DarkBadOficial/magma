// Command files
CMD:canceltracing(playerid, params[])
{
	CancelTracing(playerid);
	return 1;
}

CMD:tracingred(playerid, params[])
{
	SetTracingColor(playerid, 0xEE3636FF);
	return 1;
}

CMD:tracinggreen(playerid, params[])
{
	SetTracingColor(playerid, 0x51D14EFF);
	return 1;
}

CMD:tracingyellow(playerid, params[])
{
	SetTracingColor(playerid, 0xF9D632FF);
	return 1;
}