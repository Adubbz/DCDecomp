#include "actionseq.hpp"

INCLUDE_ASM("asm/nonmatchings/actionseq", Initialize__10CActionSeqFP7ACT_SEQi);
INCLUDE_ASM("asm/nonmatchings/actionseq", __ct__10CActionSeqFv);
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
INCLUDE_ASM("asm/nonmatchings/actionseq", GetNextSeq__10CActionSeqFv);
INCLUDE_ASM("asm/nonmatchings/actionseq", SyncChara__10CActionSeqFP10CCharacter);
INCLUDE_ASM("asm/nonmatchings/actionseq", NextMoveSeq__10CActionSeqFv);
INCLUDE_ASM("asm/nonmatchings/actionseq", NextMotionSeq__10CActionSeqFv);
INCLUDE_ASM("asm/nonmatchings/actionseq", NextAnimeSeq__10CActionSeqFv);
INCLUDE_ASM("asm/nonmatchings/actionseq", MoveSeq__10CActionSeqFPfi);
INCLUDE_ASM("asm/nonmatchings/actionseq", MoveSeq__10CActionSeqFPff);
INCLUDE_ASM("asm/nonmatchings/actionseq", MoveSeq__10CActionSeqFi);
INCLUDE_ASM("asm/nonmatchings/actionseq", SetPos__10CActionSeqFPf);
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
