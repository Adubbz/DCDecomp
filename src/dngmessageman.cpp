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
void CDngMessageMan::SetStatus_Dry(float water_max, float water_before, float water_now) {
    float threshold = 0.1f * water_max;

    if (threshold < water_now && unk_24 == 0xAA) {
        unk_24 = -1;
    }
    if (0.0f < water_now && unk_24 == 0xAB) {
        unk_24 = -1;
    }
    if (threshold <= water_before + 0.5f && !(threshold <= water_now - 0.5f) && unk_24 == -1) {
        unk_24 = 0xAA;
        unk_04 = 0xF0;
        unk_1C = 0;
    }
    if (water_now <= 0.0f && (unk_24 == -1 || unk_24 == 0xAB)) {
        unk_24 = 0xAB;
        unk_04 = 0x9FFF6;
        unk_1C = 0;
    }
}
INCLUDE_ASM("asm/nonmatchings/dngmessageman", SetSteevMes__14CDngMessageManFi);
