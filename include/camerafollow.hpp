#pragma once

#include "common.h"

class CCameraFollow {
public:
    /* ?ret */ void Step(int); // @ 0x1247D0 (0x280 bytes) -- mangled: Step__13CCameraFollowFi
    /* ?ret */ void Stay(void); // @ 0x124A50 (0x50 bytes) -- mangled: Stay__13CCameraFollowFv
    /* ?ret */ void __as(const CCameraFollow &); // @ 0x124AA0 (0x40 bytes) -- mangled: __as__13CCameraFollowFRC13CCameraFollow
    /* ?ret */ void SetFollow(float, float, float); // @ 0x124AE0 (0x20 bytes) -- mangled: SetFollow__13CCameraFollowFfff
    /* ?ret */ void FollowOn(void); // @ 0x124B00 (0x10 bytes) -- mangled: FollowOn__13CCameraFollowFv
    /* ?ret */ void FollowOff(void); // @ 0x124B10 (0x10 bytes) -- mangled: FollowOff__13CCameraFollowFv
    /* ?ret */ void SetAngle(float); // @ 0x124B20 (0x10 bytes) -- mangled: SetAngle__13CCameraFollowFf
    /* ?ret */ void SetAngleSoon(float); // @ 0x124B30 (0x10 bytes) -- mangled: SetAngleSoon__13CCameraFollowFf
    /* ?ret */ void GetAngle(void); // @ 0x124B40 (0x10 bytes) -- mangled: GetAngle__13CCameraFollowFv
    /* ?ret */ void AddAngle(float); // @ 0x124B50 (0x20 bytes) -- mangled: AddAngle__13CCameraFollowFf
    /* ?ret */ void SetDistance(float); // @ 0x124B70 (0x10 bytes) -- mangled: SetDistance__13CCameraFollowFf
    /* ?ret */ void GetDistance(void); // @ 0x124B80 (0x10 bytes) -- mangled: GetDistance__13CCameraFollowFv
    /* ?ret */ void AddDistance(float); // @ 0x124B90 (0x20 bytes) -- mangled: AddDistance__13CCameraFollowFf
    /* ?ret */ void SetHeight(float); // @ 0x124BB0 (0x10 bytes) -- mangled: SetHeight__13CCameraFollowFf
    /* ?ret */ void GetHeight(void); // @ 0x124BC0 (0x10 bytes) -- mangled: GetHeight__13CCameraFollowFv
    /* ?ret */ void AddHeight(float); // @ 0x124BD0 (0x20 bytes) -- mangled: AddHeight__13CCameraFollowFf
    CCameraFollow(float, float, float, float); // @ 0x124BF0 (0x90 bytes) -- mangled: __ct__13CCameraFollowFffff
    ~CCameraFollow(void); // @ 0x124C80 (0x70 bytes) -- mangled: __dt__13CCameraFollowFv
};
