#pragma once

#include "common.h"

class CSaveData;
struct EPARTS_INFO_HEADER;

class CEditPartsInfo {
public:
    /**
     * @mangled GetPartsInfo__14CEditPartsInfoFi
     * @address 0x199FD0
     * @size 0x50
     * @unknownret
     */
    void GetPartsInfo(int);

    /**
     * @mangled CheckComplete__14CEditPartsInfoFi
     * @address 0x19A020
     * @size 0x80
     * @unknownret
     */
    void CheckComplete(int);

    /**
     * @mangled SetCompEvent__14CEditPartsInfoFii
     * @address 0x19A0A0
     * @size 0x60
     * @unknownret
     */
    void SetCompEvent(int, int);

    /**
     * @mangled GetCompEvent__14CEditPartsInfoFi
     * @address 0x19A100
     * @size 0x40
     * @unknownret
     */
    void GetCompEvent(int);

    /**
     * @mangled GetRequest__14CEditPartsInfoFi
     * @address 0x19A140
     * @size 0x40
     * @unknownret
     */
    void GetRequest(int);

    /**
     * @mangled GetNextPartsNum__14CEditPartsInfoFi
     * @address 0x19A180
     * @size 0x90
     * @unknownret
     */
    void GetNextPartsNum(int);

    /**
     * @mangled GetNextParts__14CEditPartsInfoFi
     * @address 0x19A210
     * @size 0x70
     * @unknownret
     */
    void GetNextParts(int);

    /**
     * @mangled Clear__14CEditPartsInfoFv
     * @address 0x19A280
     * @size 0x40
     * @unknownret
     */
    void Clear(void);

    /**
     * @mangled Save__14CEditPartsInfoFiP9CSaveData
     * @address 0x19A2C0
     * @size 0x130
     * @unknownret
     */
    void Save(int, CSaveData *);

    /**
     * @mangled Load__14CEditPartsInfoFiP9CSaveDatai
     * @address 0x19A3F0
     * @size 0x180
     * @unknownret
     */
    void Load(int, CSaveData *, int);

    /**
     * @mangled Initialize__14CEditPartsInfoFi
     * @address 0x19A570
     * @size 0x1D0
     * @unknownret
     */
    void Initialize(int);

    /**
     * @mangled Initialize__14CEditPartsInfoFiP18EPARTS_INFO_HEADER
     * @address 0x19A740
     * @size 0x70
     * @unknownret
     */
    void Initialize(int, EPARTS_INFO_HEADER *);
};
