#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;


class CBound {
public:
    /* ?ret */ void InCheck(float *, float *); // @ 0x13D250 (0x270 bytes) -- mangled: InCheck__6CBoundFPfPf
    /* ?ret */ void SetDir(CFrame *, float *, float *, float *, float, float); // @ 0x13D4C0 (0x100 bytes) -- mangled: SetDir__6CBoundFP6CFramePfPfPfff
    /* ?ret */ void ChangeDir(float *, float *, float *); // @ 0x13D5C0 (0x70 bytes) -- mangled: ChangeDir__6CBoundFPfPfPf
    /* ?ret */ void UpDateDir(void); // @ 0x13D630 (0x210 bytes) -- mangled: UpDateDir__6CBoundFv
    /* ?ret */ void SetDir(float *, float *); // @ 0x13D840 (0x60 bytes) -- mangled: SetDir__6CBoundFPfPf
    /* ?ret */ void SetDir(float *); // @ 0x13D8A0 (0x150 bytes) -- mangled: SetDir__6CBoundFPf
    /* ?ret */ void UpDateDirPos(void); // @ 0x13D9F0 (0x280 bytes) -- mangled: UpDateDirPos__6CBoundFv
    /* ?ret */ void UpDate(void); // @ 0x13DC70 (0x80 bytes) -- mangled: UpDate__6CBoundFv
    /* ?ret */ void InitParam(void); // @ 0x13DCF0 (0x80 bytes) -- mangled: InitParam__6CBoundFv
    CBound(float, float, float); // @ 0x13DD70 (0x120 bytes) -- mangled: __ct__6CBoundFfff
};
