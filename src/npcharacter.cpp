#include "npcharacter.hpp"
#include "collision.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include <cmath>

void CNPCharacter::Step() {
    if (!enabled || chara.frame == NULL) {
        return;
    }
    if (unk_1474 || step_hidden) {
        chara.CCharacter::Step();
    }
    int fade_step = alpha_step;
    int override_step = unk_1488;
    if (!(float(override_step) <= 0.0f)) {
        fade_step = override_step;
    }
    unk_1488 = -1;
    if (unk_1474) {
        chara.ambient_offset[3] += float(fade_step);
    } else {
        chara.ambient_offset[3] -= float(fade_step);
    }
    if (chara.ambient_offset[3] < 0.0f) {
        chara.ambient_offset[3] = 0;
    }
    if (!(chara.ambient_offset[3] <= 128.0f)) {
        chara.ambient_offset[3] = 128.0f;
    }
    PlaySeq();
}

void CNPCharacter::ShadowStep() {
    if (!enabled || chara.frame == NULL) {
        return;
    }
    if (unk_1474) {
        chara.CCharacter::ShadowStep();
    }
}

INCLUDE_ASM("asm/nonmatchings/npcharacter", PlaySeq__12CNPCharacterFv);

void CNPCharacter::ClearSeq() {
    read_index = 0;
    write_index = 0;
    sequence_enabled = 1;
    for (int index = 0; index < 8; index++) {
        sequences[index].operation = NP_SEQUENCE_UNUSED;
    }
}

int CNPCharacter::SetSeq(float *destination, float speed) {
    NP_SEQUENCE *sequence = GetNextSeq();
    sequence->operation = NP_SEQUENCE_MOVE;
    sceVu0CopyVector(sequence->destination, destination);
    sequence->speed[0] = speed;
    sequence->speed[1] = speed;
    sequence->speed[2] = speed;
    return 1;
}

int CNPCharacter::SetWait(int frames) {
    NP_SEQUENCE *sequence = GetNextSeq();
    sequence->operation = NP_SEQUENCE_WAIT;
    sequence->wait_frames = frames;
    return 1;
}

int CNPCharacter::CheckSeq() {
    return read_index != write_index;
}

INCLUDE_ASM("asm/nonmatchings/npcharacter", GetNextSeq__12CNPCharacterFv);

NP_SEQUENCE *CNPCharacter::GetNowSeq() {
    return &sequences[read_index];
}

void CNPCharacter::NextSeq() {
    GetNowSeq()->operation = NP_SEQUENCE_UNUSED;
    if (CheckSeq()) {
        read_index++;
        if (read_index >= 8) {
            read_index = 0;
        }
    }
}

void CNPCharacter::Draw() {
    sceVu0FVECTOR saved_ambient;
    sceVu0FVECTOR ambient;
    if (!enabled || chara.frame == NULL) {
        return;
    }
    if (!(chara.ambient_offset[3] <= 0.0f)) {
        MGGetAmbient(saved_ambient);
        sceVu0CopyVector(ambient, saved_ambient);
        ambient[0] += chara.ambient_offset[0];
        ambient[1] += chara.ambient_offset[1];
        ambient[2] += chara.ambient_offset[2];
        ambient[3] = chara.ambient_offset[3];
        MGSetAmbient(ambient);
        chara.CCharacter::Draw();
        MGSetAmbient(saved_ambient);
    }
}

void CNPCharacter::DrawShadow() {
    if (!enabled || chara.frame == NULL) {
        return;
    }
    if (unk_1474) {
        chara.CCharacter::DrawShadow();
    }
}

int CNPCharacter::CheckDraw() {
    if (!enabled || chara.frame == NULL) {
        return 0;
    }
    if (chara.ambient_offset[3] <= 0.0f) {
        return 0;
    }
    return 1;
}

int CNPCharacter::PickUpPoly(float *position, CCPoly *polygons) {
    if (enabled) {
        return chara.CCharacter::PickUpPoly(position, polygons);
    }
    return 0;
}

int CCharacter::PickUpPoly(float *position, CCPoly *polygons) {
    sceVu0FVECTOR origin;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR centre;
    sceVu0FVECTOR upper_left;
    sceVu0FVECTOR upper_right;
    sceVu0FVECTOR lower_left;
    sceVu0FVECTOR lower_right;
    GetPosition(origin);
    float radius = body_width;
    if (radius < 2.0f) {
        radius = 2.0f;
    }
    sceVu0SubVector(direction, position, origin);
    direction[1] = 0;
    float distance = DistVector(direction);
    if (!(distance <= 4.0f * radius) || distance < radius) {
        return 0;
    }
    if (origin[1] + body_height < position[1]) {
        return 0;
    }
    if (!(origin[1] - body_height <= position[1])) {
        return 0;
    }
    sceVu0Normalize(direction, direction);
    upper_left[0] = 20.0f * -direction[2];
    upper_left[1] = 30.0f;
    upper_left[2] = 20.0f * direction[0];
    upper_left[3] = 1.0f;
    sceVu0CopyVector(upper_right, upper_left);
    upper_right[0] = -upper_left[0];
    upper_right[2] = -upper_left[2];
    sceVu0CopyVector(lower_left, upper_left);
    lower_left[1] = -30.0f;
    sceVu0CopyVector(lower_right, upper_right);
    lower_right[1] = -30.0f;
    sceVu0ScaleVector(centre, direction, radius);
    sceVu0AddVector(centre, centre, origin);
    sceVu0AddVector(upper_left, upper_left, centre);
    sceVu0AddVector(upper_right, upper_right, centre);
    sceVu0AddVector(lower_left, lower_left, centre);
    sceVu0AddVector(lower_right, lower_right, centre);
    sceVu0CopyVector(polygons[0].vertex[0], upper_left);
    sceVu0CopyVector(polygons[0].vertex[1], upper_right);
    sceVu0CopyVector(polygons[0].vertex[2], lower_left);
    sceVu0CopyVector(polygons[0].normal, direction);
    sceVu0CopyVector(polygons[1].vertex[0], lower_left);
    sceVu0CopyVector(polygons[1].vertex[1], upper_right);
    sceVu0CopyVector(polygons[1].vertex[2], lower_right);
    sceVu0CopyVector(polygons[1].normal, direction);
    return 2;
}

void CNPCharacter::Initialize() {
    chara.CCharacter::Initialize();
    enabled = 0;
    unk_1474 = 0;
    chara.ambient_offset[0] = 0;
    chara.ambient_offset[1] = 0;
    chara.ambient_offset[2] = 0;
    chara.ambient_offset[3] = 0;
    alpha_step = 0;
    unk_1488 = -1;
    chara.body_width = 7.0f;
    unk_148C = 0;
    unk_1468 = 0;
    event_status = 0;
    unk_1470 = 0;
    unk_1448 = 0;
    ClearSeq();
    unk_1440 = 0;
    unk_1480 = 0;
    step_hidden = 0;
    recurring_talk_event = -1;
}

INCLUDE_ASM("asm/nonmatchings/npcharacter", __ct__12CNPCharacterFv);
