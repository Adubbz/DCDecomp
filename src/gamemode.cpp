#include "common.h"

/* The game's top-level modes and the transitions between them: map jumps, the
 * menu, the save and memory-card screens, the trial ending. */

INCLUDE_ASM("main", MapJump__Fii);
INCLUDE_ASM("main", MenuInit__Fv);
INCLUDE_ASM("main", MenuLoop__Fv);
INCLUDE_ASM("main", MemCheckInit__Fv);
INCLUDE_ASM("main", MemCheckLoop__Fv);
INCLUDE_ASM("main", InitSave__Fv);
INCLUDE_ASM("main", LoopSave__Fv);
INCLUDE_ASM("main", TrialEndInit__Fv);
INCLUDE_ASM("main", TrialEndLoop__Fv);
INCLUDE_ASM("main", TrialStart__Fv);
INCLUDE_ASM("main", CheckTrialEnd__Fv);
INCLUDE_ASM("main", __as__13MAP_NPC_MODELFRC13MAP_NPC_MODEL);
INCLUDE_ASM("main", __as__10CCharacterFRC10CCharacter);
INCLUDE_ASM("main", __as__7CObjectFRC7CObject);
INCLUDE_ASM("main", __as__6CWaterFR6CWater);
INCLUDE_ASM("main", __as__14CVisualPolyVu1FRC14CVisualPolyVu1);
INCLUDE_ASM("main", __as__10CVisualVu1FRC10CVisualVu1);
INCLUDE_ASM("main", __as__7CVisualFRC7CVisual);
INCLUDE_ASM("main", __ct__12CategoryAttrFv);
INCLUDE_ASM("main", Initialize__12CategoryAttrFv);
INCLUDE_ASM("main", __ct__11CBombEffectFv);
INCLUDE_ASM("main", Initialize__11CBombEffectFv);
INCLUDE_ASM("main", __ct__10CMajinBeemFv);
INCLUDE_ASM("main", Initialize__10CMajinBeemFv);
INCLUDE_ASM("main", __ct__13MAP_NPC_MODELFv);
INCLUDE_ASM("main", __ct__10CCharacterFv);
INCLUDE_ASM("main", __ct__11MotionParamFv);
INCLUDE_ASM("main", __ct__13CTextureAnimeFv);
INCLUDE_ASM("main", __ct__7CObjectFv);
INCLUDE_ASM("main", __ct__12CSHOT_EFFECTFv);
INCLUDE_ASM("main", __ct__8CHitMarkFv);
INCLUDE_ASM("main", Alloc__18CDataAlloc_1_6000_Fi);
INCLUDE_ASM("main", Align64__18CDataAlloc_1_6000_Fv);
