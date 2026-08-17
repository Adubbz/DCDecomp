#include "common.h"

/* The game's top-level modes and the transitions between them: map jumps, the
 * menu, the save and memory-card screens, the trial ending. */

INCLUDE_ASM("asm/nonmatchings/gamemode", MapJump__Fii);
INCLUDE_ASM("asm/nonmatchings/gamemode", MenuInit__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", MenuLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", MemCheckInit__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", MemCheckLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", InitSave__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", LoopSave__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", TrialEndInit__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", TrialEndLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", TrialStart__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", CheckTrialEnd__Fv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__13MAP_NPC_MODELFRC13MAP_NPC_MODEL);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__10CCharacterFRC10CCharacter);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__7CObjectFRC7CObject);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__6CWaterFR6CWater);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__14CVisualPolyVu1FRC14CVisualPolyVu1);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__10CVisualVu1FRC10CVisualVu1);
INCLUDE_ASM("asm/nonmatchings/gamemode", __as__7CVisualFRC7CVisual);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__12CategoryAttrFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Initialize__12CategoryAttrFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__11CBombEffectFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Initialize__11CBombEffectFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__10CMajinBeemFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Initialize__10CMajinBeemFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__13MAP_NPC_MODELFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__10CCharacterFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__11MotionParamFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__13CTextureAnimeFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__7CObjectFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__12CSHOT_EFFECTFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", __ct__8CHitMarkFv);
INCLUDE_ASM("asm/nonmatchings/gamemode", Alloc__18CDataAlloc_1_6000_Fi);
INCLUDE_ASM("asm/nonmatchings/gamemode", Align64__18CDataAlloc_1_6000_Fv);
