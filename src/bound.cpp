#include "bound.hpp"

/**
 * Returns the length of a three-component vector.
 */
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
#ifdef NON_MATCHING
void CBound::SetDir(CFrame *frame, float *from_position, float *to_position,
                    float *up_direction, float half_width, float half_height) {
    state = 1;
    frame0 = frame;
    frame1 = NULL;
    ChangeDir(from_position, to_position, up_direction);

    // The depth is whatever the box already had; only the two across the
    // span are given here.
    float half_depth = extent[2];
    extent[0] = half_width;
    extent[1] = half_height;
    extent[2] = half_depth;
    if (!(extent[0] <= 0.0f)) {
        reciprocal[0] = 1.0f / half_width;
    }
    if (!(extent[1] <= 0.0f)) {
        reciprocal[1] = 1.0f / half_height;
    }
    if (!(extent[2] <= 0.0f)) {
        reciprocal[2] = 1.0f / half_depth;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/bound", SetDir__6CBoundFP6CFramePfPfPfff);
#endif

void CBound::ChangeDir(float *from_position, float *to_position, float *up_direction) {
    sceVu0CopyVector(from, from_position);
    sceVu0CopyVector(to, to_position);
    sceVu0CopyVector(up, up_direction);
}

INCLUDE_ASM("asm/nonmatchings/bound", UpDateDir__6CBoundFv);
#ifdef NON_MATCHING
void CBound::SetDir(float *direction, float *up_direction) {
    sceVu0FVECTOR origin = {0.0f, 0.0f, 0.0f, 1.0f};

    sceVu0CameraMatrix(inverse, origin, direction, up_direction);
    sceVu0TransposeMatrix(matrix, inverse);
}
#else
INCLUDE_ASM("asm/nonmatchings/bound", SetDir__6CBoundFPfPf);
#endif
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

void CBound::InitParam() {
    position[0] = 0.0f;
    position[1] = 0.0f;
    position[2] = 0.0f;
    position[3] = 1.0f;
    next = 0;
    unk_04 = 0;
    friction = 0.5f;
    frame0 = frame1 = 0;
    sceVu0CopyVector(from, position);
    sceVu0CopyVector(to, position);
    length0 = length1 = 1.0f;
}
#ifdef NON_MATCHING
CBound::CBound(float half_width, float half_height, float half_depth) {
    sceVu0FVECTOR forward = {0.0f, 0.0f, 1.0f, 0.0f};

    InitParam();
    extent[0] = half_width;
    extent[1] = half_height;
    extent[2] = half_depth;
    if (!(extent[0] <= 0.0f)) {
        reciprocal[0] = 1.0f / half_width;
    }
    if (!(extent[1] <= 0.0f)) {
        reciprocal[1] = 1.0f / half_height;
    }
    if (!(extent[2] <= 0.0f)) {
        reciprocal[2] = 1.0f / half_depth;
    }
    SetDir(forward);
}
#else
INCLUDE_ASM("asm/nonmatchings/bound", __ct__6CBoundFfff);
#endif
