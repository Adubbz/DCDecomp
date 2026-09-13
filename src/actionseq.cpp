#include "actionseq.hpp"
#include "character.hpp"
#include "mathutil.hpp"
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

void CActionSeq::MoveSeq(float *destination, float speed) {
    float duration = DistVector(destination, queued_position) / speed;
    int frames = duration;
    if (duration - frames > 0.0) {
        frames++;
    }
    MoveSeq(destination, frames);
}

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

void CActionSeq::RotRefSeq(float *reference, float speed) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_ROTATE_REFERENCE;
        sceVu0CopyVector(sequence->arguments.vector, reference);
        sequence->arguments.vector[3] = speed;
        sequence->duration = 0;
    }
}

void CActionSeq::RotAngleSeq(float angle, float speed) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_ROTATE_ANGLE;
        sequence->arguments.vector[0] = 0;
        sequence->arguments.vector[1] = angle;
        sequence->arguments.vector[2] = 0;
        sequence->arguments.vector[3] = speed;
        sequence->duration = 0;
    }
}

void CActionSeq::RotMoveSeq(float speed) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_ROTATE_MOVEMENT;
        sequence->arguments.vector[3] = speed;
        sequence->duration = 0;
    }
}

void CActionSeq::ClearRotSeq() {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_CLEAR_ROTATION;
        sequence->duration = 0;
    }
}

void CActionSeq::WaitRotSeq() {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_WAIT_ROTATION;
        sequence->duration = 0;
    }
}

void CActionSeq::SetRot(float *angles) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_SET_ROTATION;
        sceVu0CopyVector(sequence->arguments.vector, angles);
        sequence->duration = 0;
    }
}

void CActionSeq::SetDelayRot(int delay) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_DELAY_ROTATION;
        sequence->duration = delay;
    }
}

void CActionSeq::MotionTrg(int delay) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_TRIGGER_MOTION;
        sequence->duration = delay;
    }
}

void CActionSeq::AnimeTrg(int delay) {
    ACT_SEQ *sequence = NextMoveSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_TRIGGER_ANIMATION;
        sequence->duration = delay;
    }
}

void CActionSeq::MotionSeq(int motion, int mode, float speed, int flags) {
    ACT_SEQ *sequence = NextMotionSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_MOTION;
        sequence->duration = 0;
        sequence->arguments.animation.id = motion;
        sequence->arguments.animation.mode = mode;
        sequence->arguments.animation.playback.speed = speed;
        sequence->arguments.animation.flags = flags & 4;
    }
}

void CActionSeq::AnimeSeq(int animation, int enabled, int frames, int disable_after) {
    ACT_SEQ *sequence = NextAnimeSeq();
    if (sequence != NULL) {
        sequence->operation = ACT_SEQ_ANIMATION;
        sequence->duration = frames;
        sequence->arguments.animation.id = animation;
        sequence->arguments.animation.mode = enabled;
        sequence->arguments.animation.playback.disable_after = 0;
        if (frames > 0) {
            sequence->arguments.animation.playback.disable_after = disable_after;
        }
    }
}

int CActionSeq::CheckEnd() {
    int motion_finished = 0;
    if (motion_head != NULL) {
        if (motion_head->arguments.animation.mode != 7) {
            motion_finished = 1;
        }
    } else {
        motion_finished = 1;
    }
    return move_head == NULL && motion_finished && anime_head == NULL;
}

INCLUDE_ASM("asm/nonmatchings/actionseq", DeleteSeq__FP7ACT_SEQ);
INCLUDE_ASM("asm/nonmatchings/actionseq", Play__10CActionSeqFv);
