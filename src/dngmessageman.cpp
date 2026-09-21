#include "dngmessageman.hpp"

#include "dun/gameloop.hpp"
#include "userstatus.hpp"

void CDngMessageMan::LimmitZone(void) {
    int zone = UserStatus->res_limit_zone_current;

    if (zone >= 0 && zone < 6) {
        message = 0xB;
        unk_0C = UserStatus->cur_chara + 0x32;
    }
    if (UserStatus->res_limit_zone_current == 0xA) {
        message = 0xD;
    }
    if (UserStatus->res_limit_zone_current == 0xB) {
        message = 0xE;
    }
    timer = 0xF0;
    unk_1C = 0;
}

void CDngMessageMan::SetStatus_Dry(float water_max, float water_before, float water_now) {
    float threshold = 0.1f * water_max;

    if (threshold < water_now && message == 0xAA) {
        message = -1;
    }
    if (0.0f < water_now && message == 0xAB) {
        message = -1;
    }
    if (threshold <= water_before + 0.5f && !(threshold <= water_now - 0.5f) && message == -1) {
        message = 0xAA;
        timer = 0xF0;
        unk_1C = 0;
    }
    if (water_now <= 0.0f && (message == -1 || message == 0xAB)) {
        message = 0xAB;
        timer = 0x9FFF6;
        unk_1C = 0;
    }
}
void CDngMessageMan::SetSteevMes(int first) {
    if (timer <= 0) {
        // The ten Steev lines are shown in turn, so the index rides on.
        message = first + unk_20;
        timer = 0xF0;
        unk_1C = 1;
        unk_20++;
        if (unk_20 > 9) {
            unk_20 = 0;
        }
    }
}
