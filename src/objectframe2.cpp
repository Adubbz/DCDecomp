#include "objectframe.hpp"

void CObjectFrame::SetMoment(CVector3_f_ moment) {
    this->moment = moment;
    this->unk_0C0 = 1;
}

void CObjectFrame::SetRotation(float x, float y, float z) {
    this->rotation.x = x;
    this->rotation.y = y;
    this->rotation.z = z;
    this->unk_0C0 = 1;
}

void CObjectFrame::SetRotation(CVector3_f_ rotation) {
    this->rotation = rotation;
    this->unk_0C0 = 1;
}

void CObjectFrame::SetRotVelocity(CVector3_f_ rot_velocity) {
    this->rot_velocity = rot_velocity;
    this->unk_0C0 = 1;
}

void CObjectFrame::SetRotAcceleration(CVector3_f_ rot_acceleration) {
    this->rot_acceleration = rot_acceleration;
    this->unk_0C0 = 1;
}
