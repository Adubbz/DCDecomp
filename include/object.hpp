#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CVector3_f_;


/**
 * Places one object in the world.
 */
class CObject {
public:
    u8 unk_000[16];
    float pos[4]; /**< World position of the object. */

    /**
     * @mangled Step__7CObjectFv
     * @address 0x156BA0
     * @size 0x10
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled GetDistance__7CObjectFR7CObject
     * @address 0x156BB0
     * @size 0x60
     * @unknownret
     */
    void GetDistance(CObject &);

    /**
     * @mangled GetDir__7CObjectFR7CObjectPf
     * @address 0x156C10
     * @size 0x70
     * @unknownret
     */
    void GetDir(CObject &, float *);

    /**
     * @mangled SetMass__7CObjectFf
     * @address 0x156C80
     * @size 0x10
     * @unknownret
     */
    void SetMass(float);

    /**
     * @mangled SetPosition__7CObjectF11CVector3_f_
     * @address 0x156C90
     * @size 0x40
     * @unknownret
     */
    void SetPosition(CVector3_f_);

    /**
     * @mangled SetPosition__7CObjectFfff
     * @address 0x156CD0
     * @size 0x20
     * @unknownret
     */
    void SetPosition(float, float, float);

    /**
     * @mangled SetVelocity__7CObjectF11CVector3_f_
     * @address 0x156CF0
     * @size 0x30
     * @unknownret
     */
    void SetVelocity(CVector3_f_);

    /**
     * @mangled SetAcceleration__7CObjectF11CVector3_f_
     * @address 0x156D20
     * @size 0x30
     * @unknownret
     */
    void SetAcceleration(CVector3_f_);

    /**
     * @mangled SetGravity__7CObjectF11CVector3_f_
     * @address 0x156D50
     * @size 0x30
     * @unknownret
     */
    void SetGravity(CVector3_f_);

    /**
     * @mangled SetMoment__7CObjectF11CVector3_f_
     * @address 0x156D80
     * @size 0x30
     * @unknownret
     */
    void SetMoment(CVector3_f_);

    /**
     * @mangled SetRotation__7CObjectF11CVector3_f_
     * @address 0x156DB0
     * @size 0x30
     * @unknownret
     */
    void SetRotation(CVector3_f_);

    /**
     * @mangled SetRotation__7CObjectFfff
     * @address 0x156DE0
     * @size 0x20
     * @unknownret
     */
    void SetRotation(float, float, float);

    /**
     * @mangled SetRotation__7CObjectFPf
     * @address 0x156E00
     * @size 0x20
     * @unknownret
     */
    void SetRotation(float *);

    /**
     * @mangled SetRotVelocity__7CObjectF11CVector3_f_
     * @address 0x156E20
     * @size 0x30
     * @unknownret
     */
    void SetRotVelocity(CVector3_f_);

    /**
     * @mangled SetRotAcceleration__7CObjectF11CVector3_f_
     * @address 0x156E50
     * @size 0x30
     * @unknownret
     */
    void SetRotAcceleration(CVector3_f_);

    /**
     * @mangled GetMass__7CObjectFv
     * @address 0x156E80
     * @size 0x10
     * @unknownret
     */
    void GetMass(void);

    /**
     * @mangled GetPosition__7CObjectFP11CVector3_f_
     * @address 0x156E90
     * @size 0x20
     * @unknownret
     */
    void GetPosition(CVector3_f_ *);

    /**
     * @mangled GetVelocity__7CObjectFP11CVector3_f_
     * @address 0x156EB0
     * @size 0x10
     * @unknownret
     */
    void GetVelocity(CVector3_f_ *);

    /**
     * @mangled GetAcceleration__7CObjectFP11CVector3_f_
     * @address 0x156EC0
     * @size 0x10
     * @unknownret
     */
    void GetAcceleration(CVector3_f_ *);

    /**
     * @mangled GetGravity__7CObjectFP11CVector3_f_
     * @address 0x156ED0
     * @size 0x10
     * @unknownret
     */
    void GetGravity(CVector3_f_ *);

    /**
     * @mangled GetMoment__7CObjectFP11CVector3_f_
     * @address 0x156EE0
     * @size 0x10
     * @unknownret
     */
    void GetMoment(CVector3_f_ *);

    /**
     * @mangled GetRotation__7CObjectFPf
     * @address 0x156EF0
     * @size 0x20
     * @unknownret
     */
    void GetRotation(float *);

    /**
     * @mangled GetRotation__7CObjectFP11CVector3_f_
     * @address 0x156F10
     * @size 0x10
     * @unknownret
     */
    void GetRotation(CVector3_f_ *);

    /**
     * @mangled GetRotVelocity__7CObjectFP11CVector3_f_
     * @address 0x156F20
     * @size 0x10
     * @unknownret
     */
    void GetRotVelocity(CVector3_f_ *);

    /**
     * @mangled GetRotAcceleration__7CObjectFP11CVector3_f_
     * @address 0x156F30
     * @size 0x10
     * @unknownret
     */
    void GetRotAcceleration(CVector3_f_ *);

    /**
     * @mangled GetVelocity__7CObjectFv
     * @address 0x156F40
     * @size 0x10
     * @unknownret
     */
    void GetVelocity(void);

    /**
     * @mangled GetAcceleration__7CObjectFv
     * @address 0x156F50
     * @size 0x10
     * @unknownret
     */
    void GetAcceleration(void);

    /**
     * @mangled GetGravity__7CObjectFv
     * @address 0x156F60
     * @size 0x10
     * @unknownret
     */
    void GetGravity(void);

    /**
     * @mangled GetMoment__7CObjectFv
     * @address 0x156F70
     * @size 0x10
     * @unknownret
     */
    void GetMoment(void);

    /**
     * @mangled GetRotation__7CObjectFv
     * @address 0x156F80
     * @size 0x10
     * @unknownret
     */
    void GetRotation(void);

    /**
     * @mangled GetRotVelocity__7CObjectFv
     * @address 0x156F90
     * @size 0x10
     * @unknownret
     */
    void GetRotVelocity(void);

    /**
     * @mangled GetRotAcceleration__7CObjectFv
     * @address 0x156FA0
     * @size 0x10
     * @unknownret
     */
    void GetRotAcceleration(void);

    /**
     * @mangled SetScale__7CObjectFfff
     * @address 0x156FB0
     * @size 0x20
     * @unknownret
     */
    void SetScale(float, float, float);

    /**
     * @mangled SetScale__7CObjectFPf
     * @address 0x156FD0
     * @size 0x20
     * @unknownret
     */
    void SetScale(float *);

    /**
     * @mangled GetScale__7CObjectFPf
     * @address 0x156FF0
     * @size 0x20
     * @unknownret
     */
    void GetScale(float *);

    /**
     * Makes an object with no data.
     *
     * @mangled __ct__7CObjectFv
     * @address 0x143650
     */
    CObject();

    /**
     * @mangled __ct__7CObjectFf
     * @address 0x157010
     * @size 0x40
     */
    CObject(float);

    /**
     * @mangled Initialize__7CObjectFf
     * @address 0x157050
     * @size 0x70
     * @unknownret
     */
    void Initialize(float);
};

class CFrameAttr {
public:
    /**
     * @mangled Initialize__10CFrameAttrFv
     * @address 0x127CC0
     * @size 0x80
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__10CFrameAttrFv
     * @address 0x127D40
     * @size 0x30
     */
    CFrameAttr(void);
};
