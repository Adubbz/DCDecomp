#include "btsysscript.hpp"

#include <cstdio>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "editground.hpp"
#include "editloop.hpp"
#include "editloop3.hpp"
#include "editpartsinfo.hpp"
#include "mainselect.hpp"
#include "nowload.hpp"

// Retail keeps the floor's event script in BtEventData, an s32, and casts it back to a pointer
// to run an event. Both ends are replaced to hold the address whole; nothing else reads it.

namespace {

char *g_event_data = nullptr;

} // namespace

void BtSystemScriptLoad(int floor) {
    char  path[32];
    char  mes_path[40];
    int   read_size;
    int   mes_size;
    char *mes;

    sprintf(path, "dun/script/d0%d/event.stb", floor + 1);
    sprintf(mes_path, "dun/script/d0%d/d0%d_%d.mes", floor + 1, floor + 1, LanguageCode);
    BtSystemScriptFileBuffer.used = 0;
    g_event_data = reinterpret_cast<char *>(BtSystemScriptFileBuffer.base + BtSystemScriptFileBuffer.used * 0x10);
    LoadFile(path, g_event_data, &read_size);
    wait_now_loading_vsync();
    BtSystemScriptFileBuffer.Alloc((read_size >> 4) + 1);
    mes = reinterpret_cast<char *>(BtSystemScriptFileBuffer.base + BtSystemScriptFileBuffer.used * 0x10);
    LoadFile(mes_path, mes, &mes_size);
    wait_now_loading_vsync();
    BtSystemScriptFileBuffer.Alloc((mes_size >> 4) + 1);
    EdSetEventScript(g_event_data, mes, &BtSystemScriptFileBuffer);
    AddSystemEventScript();
}

int BtSystemScriptRun(int event, CDataAlloc2<1> *arena) {
    return EdEventInit(event, arena, g_event_data);
}
