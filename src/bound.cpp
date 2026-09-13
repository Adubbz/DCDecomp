#include "bound.hpp"

float vuabs(float *);

int CBound::InCheck(float *point, float *result) {
    float length;

    result[0] = point[0] - position[0];
    result[1] = point[1] - position[1];
    result[2] = point[2] - position[2];
    result[3] = 0.0f;
    sceVu0ApplyMatrix(result, inverse, result);
    if (result[0] > extent[0])
        return 0;
    if (result[1] > extent[1])
        return 0;
    if (result[2] > extent[2])
        return 0;
    if (result[0] < -extent[0])
        return 0;
    if (result[1] < -extent[1])
        return 0;
    if (result[2] < -extent[2])
        return 0;
    result[0] = result[0] * reciprocal[0];
    result[1] = result[1] * reciprocal[1];
    result[2] = result[2] * reciprocal[2];
    length = vuabs(result);
    if (length < 1.0f) {
        if (length == 0.0f) {
            result[0] = extent[0];
            result[1] = extent[1];
            result[2] = extent[2];
        } else {
            result[0] = result[0] * extent[0] / length;
            result[1] = result[1] * extent[1] / length;
            result[2] = result[2] * extent[2] / length;
        }
        result[3] = 0.0f;
        sceVu0ApplyMatrix(result, matrix, result);
        result[0] += position[0];
        result[1] += position[1];
        result[2] += position[2];
        result[3] = 1.0f;
        return 1;
    }
    return 0;
}
INCLUDE_ASM("asm/nonmatchings/bound", SetDir__6CBoundFP6CFramePfPfPfff);
void CBound::ChangeDir(float *from_position, float *to_position, float *up_direction) {
    sceVu0CopyVector(from, from_position);
    sceVu0CopyVector(to, to_position);
    sceVu0CopyVector(up, up_direction);
}

INCLUDE_ASM("asm/nonmatchings/bound", UpDateDir__6CBoundFv);
INCLUDE_ASM("asm/nonmatchings/bound", SetDir__6CBoundFPfPf);
INCLUDE_ASM("asm/nonmatchings/bound", SetDir__6CBoundFPf);
INCLUDE_ASM("asm/nonmatchings/bound", UpDateDirPos__6CBoundFv);
void CBound::UpDate() {
    switch (state) {
    case 1:
        UpDateDir();
        break;
    case 2:
        UpDateDirPos();
        break;
    }
    if (next)
        next->UpDate();
}
INCLUDE_ASM("asm/nonmatchings/bound", InitParam__6CBoundFv);
INCLUDE_ASM("asm/nonmatchings/bound", __ct__6CBoundFfff);
