#include "common.h"

#include "snd.hpp"
#include "sound.hpp"

extern CSound CSnd;

void TiPlayVolSE(int group, int no, int voice, float volume)
{
    short* table;
    short base;
    int se;
    int level;

    se = CSnd.GetSeNo(no, voice);
    table = CSnd.GetSeInfTbl();
    base = table[se * 2 + 1];
    level = (int)((float)base * volume);
    if (level < 0) level = 0;
    if (level > 127) level = 127;
    CSnd.SE_Play(group, no, voice, 64, 127, level, 0);
}
