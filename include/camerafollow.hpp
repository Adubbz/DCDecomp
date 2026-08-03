#pragma once

#include "common.h"

class CCameraFollow {
public:
    /**
     * @mangled Step__13CCameraFollowFi
     * @address 0x1247D0
     * @size 0x280
     * @unknownret
     */
    void Step(int);

    /**
     * @mangled Stay__13CCameraFollowFv
     * @address 0x124A50
     * @size 0x50
     * @unknownret
     */
    void Stay(void);

    /**
     * @mangled __as__13CCameraFollowFRC13CCameraFollow
     * @address 0x124AA0
     * @size 0x40
     * @unknownret
     */
    void __as(const CCameraFollow &);

    /**
     * @mangled SetFollow__13CCameraFollowFfff
     * @address 0x124AE0
     * @size 0x20
     * @unknownret
     */
    void SetFollow(float, float, float);

    /**
     * @mangled FollowOn__13CCameraFollowFv
     * @address 0x124B00
     * @size 0x10
     * @unknownret
     */
    void FollowOn(void);

    /**
     * @mangled FollowOff__13CCameraFollowFv
     * @address 0x124B10
     * @size 0x10
     * @unknownret
     */
    void FollowOff(void);

    /**
     * @mangled SetAngle__13CCameraFollowFf
     * @address 0x124B20
     * @size 0x10
     * @unknownret
     */
    void SetAngle(float);

    /**
     * @mangled SetAngleSoon__13CCameraFollowFf
     * @address 0x124B30
     * @size 0x10
     * @unknownret
     */
    void SetAngleSoon(float);

    /**
     * @mangled GetAngle__13CCameraFollowFv
     * @address 0x124B40
     * @size 0x10
     * @unknownret
     */
    void GetAngle(void);

    /**
     * @mangled AddAngle__13CCameraFollowFf
     * @address 0x124B50
     * @size 0x20
     * @unknownret
     */
    void AddAngle(float);

    /**
     * @mangled SetDistance__13CCameraFollowFf
     * @address 0x124B70
     * @size 0x10
     * @unknownret
     */
    void SetDistance(float);

    /**
     * @mangled GetDistance__13CCameraFollowFv
     * @address 0x124B80
     * @size 0x10
     * @unknownret
     */
    void GetDistance(void);

    /**
     * @mangled AddDistance__13CCameraFollowFf
     * @address 0x124B90
     * @size 0x20
     * @unknownret
     */
    void AddDistance(float);

    /**
     * @mangled SetHeight__13CCameraFollowFf
     * @address 0x124BB0
     * @size 0x10
     * @unknownret
     */
    void SetHeight(float);

    /**
     * @mangled GetHeight__13CCameraFollowFv
     * @address 0x124BC0
     * @size 0x10
     * @unknownret
     */
    void GetHeight(void);

    /**
     * @mangled AddHeight__13CCameraFollowFf
     * @address 0x124BD0
     * @size 0x20
     * @unknownret
     */
    void AddHeight(float);

    /**
     * @mangled __ct__13CCameraFollowFffff
     * @address 0x124BF0
     * @size 0x90
     */
    CCameraFollow(float, float, float, float);

    /**
     * @mangled __dt__13CCameraFollowFv
     * @address 0x124C80
     * @size 0x70
     */
    ~CCameraFollow(void);
};
