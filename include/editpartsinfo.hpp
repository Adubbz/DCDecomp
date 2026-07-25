#pragma once

#include "common.h"

class CSaveData;
struct EPARTS_INFO_HEADER;

class CEditPartsInfo {
public:
    /* ?ret */ void GetPartsInfo(int); // @ 0x199FD0 (0x50 bytes) -- mangled: GetPartsInfo__14CEditPartsInfoFi
    /* ?ret */ void CheckComplete(int); // @ 0x19A020 (0x80 bytes) -- mangled: CheckComplete__14CEditPartsInfoFi
    /* ?ret */ void SetCompEvent(int, int); // @ 0x19A0A0 (0x60 bytes) -- mangled: SetCompEvent__14CEditPartsInfoFii
    /* ?ret */ void GetCompEvent(int); // @ 0x19A100 (0x40 bytes) -- mangled: GetCompEvent__14CEditPartsInfoFi
    /* ?ret */ void GetRequest(int); // @ 0x19A140 (0x40 bytes) -- mangled: GetRequest__14CEditPartsInfoFi
    /* ?ret */ void GetNextPartsNum(int); // @ 0x19A180 (0x90 bytes) -- mangled: GetNextPartsNum__14CEditPartsInfoFi
    /* ?ret */ void GetNextParts(int); // @ 0x19A210 (0x70 bytes) -- mangled: GetNextParts__14CEditPartsInfoFi
    /* ?ret */ void Clear(void); // @ 0x19A280 (0x40 bytes) -- mangled: Clear__14CEditPartsInfoFv
    /* ?ret */ void Save(int, CSaveData *); // @ 0x19A2C0 (0x130 bytes) -- mangled: Save__14CEditPartsInfoFiP9CSaveData
    /* ?ret */ void Load(int, CSaveData *, int); // @ 0x19A3F0 (0x180 bytes) -- mangled: Load__14CEditPartsInfoFiP9CSaveDatai
    /* ?ret */ void Initialize(int); // @ 0x19A570 (0x1D0 bytes) -- mangled: Initialize__14CEditPartsInfoFi
    /* ?ret */ void Initialize(int, EPARTS_INFO_HEADER *); // @ 0x19A740 (0x70 bytes) -- mangled: Initialize__14CEditPartsInfoFiP18EPARTS_INFO_HEADER
};
