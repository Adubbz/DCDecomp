#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct STATIC_ASSER;


class CGamePad {
    public:
        void Init();
        void UpDate();
        int On(int mask);
        int On2(int mask);
        void KeyLock2(int mask);
        void StopVibration();
        void VibrationEnable(int enable);
        void Step();
        void AutoRepeatOff();
        void MenuModeOff();
        void MenuModeOn(int mask);
        void SetAutoRepeat(int mask, int initial_delay, int repeat_delay);

    private:
        char unk[1128];
};
STATIC_ASSERT(sizeof(CGamePad) == 1128);

extern CGamePad GamePad;
