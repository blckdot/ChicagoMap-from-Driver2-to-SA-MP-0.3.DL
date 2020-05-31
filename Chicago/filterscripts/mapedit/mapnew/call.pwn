public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    switch( dialogid ) {
        case DIALOGID_MAP_NEW: {
            if( !response ) {
                return 1;
            }

            if( isempty(inputtext) || strcmp(inputtext, NEWMAP_COMMAND) != 0 ) {
                SendClientMessage(playerid, RGBA_RED, "ERROR: ������ ��������� ����!");
                ShowMapNewDialog(playerid, dialogid);
            } else {
                new
                    objects_removed,
                    vehicles_removed,
                    pickups_removed,
                    actors_removed,
                    buildings_recreated,
                    attachments_removed
                ;

                NewMap(
                    .objects_removed = objects_removed,
                    .vehicles_removed = vehicles_removed,
                    .pickups_removed = pickups_removed,
                    .actors_removed = actors_removed,
                    .buildings_recreated = buildings_recreated,
                    .attachments_removed = attachments_removed,
                    .playerid = playerid
                );

                format(g_ClientMessage, sizeof g_ClientMessage, "[%i] %s ������ ����� �����.", playerid, ret_GetPlayerName(playerid));
                SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);

                format(g_ClientMessage, sizeof g_ClientMessage, "�������: %i ��������(s), %i �����������(s), %i �������(��� ������ :D ), %i �������, %i ������ �������������.", objects_removed, vehicles_removed, pickups_removed, actors_removed, buildings_recreated);
                SendClientMessageToAll(RGBA_WHITE, g_ClientMessage);

                if( attachments_removed > 0 ) {
                    format(g_ClientMessage, sizeof g_ClientMessage, "+ %i ����� �������(��� ������ :D ).", attachments_removed);
                    SendClientMessage(playerid, RGBA_WHITE, g_ClientMessage);
                }

                if( buildings_recreated > 0 ) {
                    SendClientMessageToAll(RGBA_ORANGE, "��� ����� ��������� ����� �������������� ������ ���������.");
                }

                g_MapLoadedID = INVALID_MAP_ID;
                RefreshMapLoadedTextdraw();
            }
            return 1;
        }
    }

    #if defined mnew_OnDialogResponse
        return mnew_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
    #else
        return 0;
    #endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse mnew_OnDialogResponse
#if defined mnew_OnDialogResponse
    forward mnew_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
