#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;


class CBound {
public:
    /**
     * @mangled InCheck__6CBoundFPfPf
     * @address 0x13D250
     * @size 0x270
     * @unknownret
     */
    void InCheck(float *, float *);

    /**
     * @mangled SetDir__6CBoundFP6CFramePfPfPfff
     * @address 0x13D4C0
     * @size 0x100
     * @unknownret
     */
    void SetDir(CFrame *, float *, float *, float *, float, float);

    /**
     * @mangled ChangeDir__6CBoundFPfPfPf
     * @address 0x13D5C0
     * @size 0x70
     * @unknownret
     */
    void ChangeDir(float *, float *, float *);

    /**
     * @mangled UpDateDir__6CBoundFv
     * @address 0x13D630
     * @size 0x210
     * @unknownret
     */
    void UpDateDir(void);

    /**
     * @mangled SetDir__6CBoundFPfPf
     * @address 0x13D840
     * @size 0x60
     * @unknownret
     */
    void SetDir(float *, float *);

    /**
     * @mangled SetDir__6CBoundFPf
     * @address 0x13D8A0
     * @size 0x150
     * @unknownret
     */
    void SetDir(float *);

    /**
     * @mangled UpDateDirPos__6CBoundFv
     * @address 0x13D9F0
     * @size 0x280
     * @unknownret
     */
    void UpDateDirPos(void);

    /**
     * @mangled UpDate__6CBoundFv
     * @address 0x13DC70
     * @size 0x80
     * @unknownret
     */
    void UpDate(void);

    /**
     * @mangled InitParam__6CBoundFv
     * @address 0x13DCF0
     * @size 0x80
     * @unknownret
     */
    void InitParam(void);

    /**
     * @mangled __ct__6CBoundFfff
     * @address 0x13DD70
     * @size 0x120
     */
    CBound(float, float, float);
};
