#include "object.hpp"

#include <libvu0.h>

#include "mathutil.hpp"

INCLUDE_ASM("asm/nonmatchings/object", __ct__15CFakePointLightFv);

void CObject::Step() {
}

float CObject::GetDistance(CObject &other) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR other_pos;

    sceVu0CopyVector(other_pos, other.pos);
    sceVu0CopyVector(pos, this->pos);
    return DistVector(pos, other_pos);
}

void CObject::GetDir(CObject &other, float *out_direction) {
    sceVu0FVECTOR pos;
    sceVu0FVECTOR other_pos;

    sceVu0CopyVector(other_pos, other.pos);
    sceVu0CopyVector(pos, this->pos);
    sceVu0SubVector(out_direction, other_pos, pos);
}

void CObject::SetMass(float mass) {
    this->mass = mass;
}

INCLUDE_ASM("asm/nonmatchings/object", SetPosition__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", SetPosition__7CObjectFfff);
INCLUDE_ASM("asm/nonmatchings/object", SetVelocity__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", SetAcceleration__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", SetGravity__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", SetMoment__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", SetRotation__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", SetRotation__7CObjectFfff);
INCLUDE_ASM("asm/nonmatchings/object", SetRotation__7CObjectFPf);
INCLUDE_ASM("asm/nonmatchings/object", SetRotVelocity__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", SetRotAcceleration__7CObjectF11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetMass__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", GetPosition__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetVelocity__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetAcceleration__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetGravity__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetMoment__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetRotation__7CObjectFPf);
INCLUDE_ASM("asm/nonmatchings/object", GetRotation__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetRotVelocity__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetRotAcceleration__7CObjectFP11CVector3_f_);
INCLUDE_ASM("asm/nonmatchings/object", GetVelocity__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", GetAcceleration__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", GetGravity__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", GetMoment__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", GetRotation__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", GetRotVelocity__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", GetRotAcceleration__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/object", SetScale__7CObjectFfff);
INCLUDE_ASM("asm/nonmatchings/object", SetScale__7CObjectFPf);
INCLUDE_ASM("asm/nonmatchings/object", GetScale__7CObjectFPf);
INCLUDE_ASM("asm/nonmatchings/object", __ct__7CObjectFf);
INCLUDE_ASM("asm/nonmatchings/object", Initialize__7CObjectFf);
