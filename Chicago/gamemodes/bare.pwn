#include <a_samp>

main()
{
	print("\n/*-----------------------------------*\\");
	print("|*=====[Fusez's Map Editor Loaded]=====*|");
	print("\\*-----------------------------------*/\n");
}

new bool:JustConnected[MAX_PLAYERS];

public OnPlayerRequestClass(playerid, classid)
{
	TogglePlayerSpectating(playerid, true);
	if(JustConnected[playerid])
	{
		JustConnected[playerid] = false;
		SetTimerEx("OnPlayerRequestClass", 100, false, "ii", playerid, classid);
	}
	else
	{
		TogglePlayerSpectating(playerid, false);
		SpawnPlayer(playerid);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	JustConnected[playerid] = true;
	//RemoveBuildingForPlayer(playerid, -1, 0.0, 0.0, 0.0, 6000.0);
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("Freeroam | Chicago");
	UsePlayerPedAnims();
	AddPlayerClass(72,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,-1,-1);
	return 1;
}
