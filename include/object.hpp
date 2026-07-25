#pragma once

#include "common.h"

class CObject {
public:
    /* ?ret */ void Step(void); // @ 0x156BA0 (0x10 bytes) -- mangled: Step__7CObjectFv
    /* ?ret */ void GetDistance(CObject &); // @ 0x156BB0 (0x60 bytes) -- mangled: GetDistance__7CObjectFR7CObject
    /* ?ret */ void GetDir(CObject &, float *); // @ 0x156C10 (0x70 bytes) -- mangled: GetDir__7CObjectFR7CObjectPf
    /* ?ret */ void SetMass(float); // @ 0x156C80 (0x10 bytes) -- mangled: SetMass__7CObjectFf
    /* ?ret */ void SetPosition(CVector3_f_); // @ 0x156C90 (0x40 bytes) -- mangled: SetPosition__7CObjectF11CVector3_f_
    /* ?ret */ void SetPosition(float, float, float); // @ 0x156CD0 (0x20 bytes) -- mangled: SetPosition__7CObjectFfff
    /* ?ret */ void SetVelocity(CVector3_f_); // @ 0x156CF0 (0x30 bytes) -- mangled: SetVelocity__7CObjectF11CVector3_f_
    /* ?ret */ void SetAcceleration(CVector3_f_); // @ 0x156D20 (0x30 bytes) -- mangled: SetAcceleration__7CObjectF11CVector3_f_
    /* ?ret */ void SetGravity(CVector3_f_); // @ 0x156D50 (0x30 bytes) -- mangled: SetGravity__7CObjectF11CVector3_f_
    /* ?ret */ void SetMoment(CVector3_f_); // @ 0x156D80 (0x30 bytes) -- mangled: SetMoment__7CObjectF11CVector3_f_
    /* ?ret */ void SetRotation(CVector3_f_); // @ 0x156DB0 (0x30 bytes) -- mangled: SetRotation__7CObjectF11CVector3_f_
    /* ?ret */ void SetRotation(float, float, float); // @ 0x156DE0 (0x20 bytes) -- mangled: SetRotation__7CObjectFfff
    /* ?ret */ void SetRotation(float *); // @ 0x156E00 (0x20 bytes) -- mangled: SetRotation__7CObjectFPf
    /* ?ret */ void SetRotVelocity(CVector3_f_); // @ 0x156E20 (0x30 bytes) -- mangled: SetRotVelocity__7CObjectF11CVector3_f_
    /* ?ret */ void SetRotAcceleration(CVector3_f_); // @ 0x156E50 (0x30 bytes) -- mangled: SetRotAcceleration__7CObjectF11CVector3_f_
    /* ?ret */ void GetMass(void); // @ 0x156E80 (0x10 bytes) -- mangled: GetMass__7CObjectFv
    /* ?ret */ void GetPosition(CVector3_f_ *); // @ 0x156E90 (0x20 bytes) -- mangled: GetPosition__7CObjectFP11CVector3_f_
    /* ?ret */ void GetVelocity(CVector3_f_ *); // @ 0x156EB0 (0x10 bytes) -- mangled: GetVelocity__7CObjectFP11CVector3_f_
    /* ?ret */ void GetAcceleration(CVector3_f_ *); // @ 0x156EC0 (0x10 bytes) -- mangled: GetAcceleration__7CObjectFP11CVector3_f_
    /* ?ret */ void GetGravity(CVector3_f_ *); // @ 0x156ED0 (0x10 bytes) -- mangled: GetGravity__7CObjectFP11CVector3_f_
    /* ?ret */ void GetMoment(CVector3_f_ *); // @ 0x156EE0 (0x10 bytes) -- mangled: GetMoment__7CObjectFP11CVector3_f_
    /* ?ret */ void GetRotation(float *); // @ 0x156EF0 (0x20 bytes) -- mangled: GetRotation__7CObjectFPf
    /* ?ret */ void GetRotation(CVector3_f_ *); // @ 0x156F10 (0x10 bytes) -- mangled: GetRotation__7CObjectFP11CVector3_f_
    /* ?ret */ void GetRotVelocity(CVector3_f_ *); // @ 0x156F20 (0x10 bytes) -- mangled: GetRotVelocity__7CObjectFP11CVector3_f_
    /* ?ret */ void GetRotAcceleration(CVector3_f_ *); // @ 0x156F30 (0x10 bytes) -- mangled: GetRotAcceleration__7CObjectFP11CVector3_f_
    /* ?ret */ void GetVelocity(void); // @ 0x156F40 (0x10 bytes) -- mangled: GetVelocity__7CObjectFv
    /* ?ret */ void GetAcceleration(void); // @ 0x156F50 (0x10 bytes) -- mangled: GetAcceleration__7CObjectFv
    /* ?ret */ void GetGravity(void); // @ 0x156F60 (0x10 bytes) -- mangled: GetGravity__7CObjectFv
    /* ?ret */ void GetMoment(void); // @ 0x156F70 (0x10 bytes) -- mangled: GetMoment__7CObjectFv
    /* ?ret */ void GetRotation(void); // @ 0x156F80 (0x10 bytes) -- mangled: GetRotation__7CObjectFv
    /* ?ret */ void GetRotVelocity(void); // @ 0x156F90 (0x10 bytes) -- mangled: GetRotVelocity__7CObjectFv
    /* ?ret */ void GetRotAcceleration(void); // @ 0x156FA0 (0x10 bytes) -- mangled: GetRotAcceleration__7CObjectFv
    /* ?ret */ void SetScale(float, float, float); // @ 0x156FB0 (0x20 bytes) -- mangled: SetScale__7CObjectFfff
    /* ?ret */ void SetScale(float *); // @ 0x156FD0 (0x20 bytes) -- mangled: SetScale__7CObjectFPf
    /* ?ret */ void GetScale(float *); // @ 0x156FF0 (0x20 bytes) -- mangled: GetScale__7CObjectFPf
    CObject(float); // @ 0x157010 (0x40 bytes) -- mangled: __ct__7CObjectFf
    /* ?ret */ void Initialize(float); // @ 0x157050 (0x70 bytes) -- mangled: Initialize__7CObjectFf
};

class CFrameAttr {
public:
    /* ?ret */ void Initialize(void); // @ 0x127CC0 (0x80 bytes) -- mangled: Initialize__10CFrameAttrFv
    CFrameAttr(void); // @ 0x127D40 (0x30 bytes) -- mangled: __ct__10CFrameAttrFv
};
