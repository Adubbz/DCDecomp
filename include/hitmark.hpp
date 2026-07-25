#pragma once

#include "common.h"

class CHitMark {
public:
    /* ?ret */ void Set(float *, float *, int, float, float, float, float, int, float); // @ 0x1B2E90 (0x310 bytes) -- mangled: Set__8CHitMarkFPfPfiffffif
    /* ?ret */ void Draw(void); // @ 0x1B31A0 (0x2F0 bytes) -- mangled: Draw__8CHitMarkFv
    /* ?ret */ void Step(void); // @ 0x1B3490 (0x140 bytes) -- mangled: Step__8CHitMarkFv
    /* ?ret */ void Initialize(void); // @ 0x1B35D0 (0x40 bytes) -- mangled: Initialize__8CHitMarkFv
};

class CHitPointMark {
public:
    /* ?ret */ void Draw(void); // @ 0x1B3610 (0x100 bytes) -- mangled: Draw__13CHitPointMarkFv
    /* ?ret */ void Step(void); // @ 0x1B3710 (0x70 bytes) -- mangled: Step__13CHitPointMarkFv
};
