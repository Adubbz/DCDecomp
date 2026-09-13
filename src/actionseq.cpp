#include "actionseq.hpp"
#include "sce/libvu0.h"

void CActionSeq::Initialize(ACT_SEQ *records, int count) {
    ClearSeq();
    pool = records;
    capacity = count;
}

CActionSeq::CActionSeq() {
    Initialize(NULL, 0);
}

void CActionSeq::ClearSeq() {
    character = NULL;
    move_tail = NULL;
    move_head = NULL;
    move_frame = 0;
    rotation_mode = 0;
    rotation_complete = 0;
    rotation_tail = NULL;
    rotation_head = NULL;
    rotation_frame = 0;
    motion_tail = NULL;
    motion_head = NULL;
    anime_tail = NULL;
    anime_head = NULL;
    rotation_delay = 0;
    anime_frame = 0;
    motion_trigger = 0;
    motion_delay = 0;
    anime_trigger = 0;
    anime_delay = 0;
}
ACT_SEQ *CActionSeq::GetNextSeq() {
    ACT_SEQ *sequence = pool;
    int index = 0;
    for (; index < capacity; index++, sequence++) {
        if (sequence->operation == ACT_SEQ_UNUSED) {
            sequence->next = NULL;
            return sequence;
        }
    }
    return NULL;
}
INCLUDE_ASM("asm/nonmatchings/actionseq", SyncChara__10CActionSeqFP10CCharacter);

ACT_SEQ *CActionSeq::NextMoveSeq() {
    ACT_SEQ *sequence = GetNextSeq();
    if (sequence == NULL) {
        return NULL;
    }
    if (move_tail != NULL) {
        move_tail->next = sequence;
    }
    move_tail = sequence;
    sequence->next = NULL;
    if (move_head == NULL) {
        move_head = sequence;
    }
    return sequence;
}

ACT_SEQ *CActionSeq::NextMotionSeq() {
    ACT_SEQ *sequence = GetNextSeq();
    if (sequence == NULL) {
        return NULL;
    }
    if (motion_tail != NULL) {
        motion_tail->next = sequence;
    }
    motion_tail = sequence;
    sequence->next = NULL;
    if (motion_head == NULL) {
        motion_head = sequence;
    }
    return sequence;
}

ACT_SEQ *CActionSeq::NextAnimeSeq() {
    ACT_SEQ *sequence = GetNextSeq();
    if (sequence == NULL) {
        return NULL;
    }
    if (anime_tail != NULL) {
        anime_tail->next = sequence;
    }
    anime_tail = sequence;
    sequence->next = NULL;
    if (anime_head == NULL) {
        anime_head = sequence;
    }
    return sequence;
}

void CActionSeq::MoveSeq(float *destination, int frames) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_MOVE;
        sceVu0CopyVector(sequence->arguments.vector, destination);
        sceVu0CopyVector(queued_position, destination);
        sequence->duration = frames;
    }
}

INCLUDE_ASM("asm/nonmatchings/actionseq", MoveSeq__10CActionSeqFPff);

void CActionSeq::MoveSeq(int frames) {
    MoveSeq(queued_position, frames);
}

void CActionSeq::SetPos(float *destination) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_SET_POSITION;
        sceVu0CopyVector(sequence->arguments.vector, destination);
        sceVu0CopyVector(queued_position, destination);
        sequence->duration = 0;
    }
}

INCLUDE_ASM("asm/nonmatchings/actionseq", RotRefSeq__10CActionSeqFPff);
INCLUDE_ASM("asm/nonmatchings/actionseq", RotAngleSeq__10CActionSeqFff);
INCLUDE_ASM("asm/nonmatchings/actionseq", RotMoveSeq__10CActionSeqFf);
INCLUDE_ASM("asm/nonmatchings/actionseq", ClearRotSeq__10CActionSeqFv);
INCLUDE_ASM("asm/nonmatchings/actionseq", WaitRotSeq__10CActionSeqFv);
INCLUDE_ASM("asm/nonmatchings/actionseq", SetRot__10CActionSeqFPf);
INCLUDE_ASM("asm/nonmatchings/actionseq", SetDelayRot__10CActionSeqFi);
INCLUDE_ASM("asm/nonmatchings/actionseq", MotionTrg__10CActionSeqFi);
INCLUDE_ASM("asm/nonmatchings/actionseq", AnimeTrg__10CActionSeqFi);
INCLUDE_ASM("asm/nonmatchings/actionseq", MotionSeq__10CActionSeqFiifi);
INCLUDE_ASM("asm/nonmatchings/actionseq", AnimeSeq__10CActionSeqFiiii);
INCLUDE_ASM("asm/nonmatchings/actionseq", CheckEnd__10CActionSeqFv);
INCLUDE_ASM("asm/nonmatchings/actionseq", DeleteSeq__FP7ACT_SEQ);
INCLUDE_ASM("asm/nonmatchings/actionseq", Play__10CActionSeqFv);
