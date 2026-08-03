#pragma once

#include "common.h"

class CCollisionData {
public:
    /**
     * @mangled Set__14CCollisionDataFPfiiffiiii
     * @address 0x1B57A0
     * @size 0x180
     * @unknownret
     */
    void Set(float *, int, int, float, float, int, int, int, int);

    /**
     * @mangled CheckHitUser__14CCollisionDataFPfif
     * @address 0x1B5920
     * @size 0x1C0
     * @unknownret
     */
    void CheckHitUser(float *, int, float);

    /**
     * @mangled SetKickBack__14CCollisionDataFPfffi
     * @address 0x1B5AE0
     * @size 0xB0
     * @unknownret
     */
    void SetKickBack(float *, float, float, int);
};
