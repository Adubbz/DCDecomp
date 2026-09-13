#include "dngmessageman.hpp"

#include "dun/gameloop.hpp"
#include "userstatus.hpp"

void CDngMessageMan::LimmitZone(void) {
    int zone = UserStatus->res_limit_zone_current;

    if (zone >= 0 && zone < 6) {
        unk_24 = 0xB;
        unk_0C = UserStatus->cur_chara + 0x32;
    }
    if (UserStatus->res_limit_zone_current == 0xA) {
        unk_24 = 0xD;
    }
    if (UserStatus->res_limit_zone_current == 0xB) {
        unk_24 = 0xE;
    }
    unk_04 = 0xF0;
    unk_1C = 0;
}
INCLUDE_ASM("asm/nonmatchings/dngmessageman", SetStatus_Dry__14CDngMessageManFfff);
INCLUDE_ASM("asm/nonmatchings/dngmessageman", SetSteevMes__14CDngMessageManFi);
