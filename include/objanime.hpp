#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;
class CEffectGroup;
class CFrame;
struct EDIT_EFFECT_INFO;
struct EPARTS_FUNC_DATA;
struct OBJ_ANIME_SEQ;


/**
 * @mangled ObjAnimeAllStop__Fv
 * @address 0x165CE0
 * @size 0x10
 * @unknownret
 */
void ObjAnimeAllStop(void);

/**
 * @mangled ObjAnimeAllStart__Fv
 * @address 0x165CF0
 * @size 0x10
 * @unknownret
 */
void ObjAnimeAllStart(void);

/**
 * @mangled InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
 * @address 0x165D00
 * @size 0xD0
 * @unknownret
 */
void InitObjAnime(CFrame *, OBJ_ANIME_SEQ *);

/**
 * @mangled InitObjAnime__FPP6CFrameP13OBJ_ANIME_SEQ
 * @address 0x165DD0
 * @size 0x100
 * @unknownret
 */
void InitObjAnime(CFrame **, OBJ_ANIME_SEQ *);

/**
 * @mangled InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ
 * @address 0x165ED0
 * @size 0x140
 * @unknownret
 */
void InitObjAnime(CFrame **, int, OBJ_ANIME_SEQ *);

/**
 * @mangled InitObjAnime__FPP6CFrameiP16EPARTS_FUNC_DATAP13OBJ_ANIME_SEQ
 * @address 0x166010
 * @size 0x160
 * @unknownret
 */
void InitObjAnime(CFrame **, int, EPARTS_FUNC_DATA *, OBJ_ANIME_SEQ *);

/**
 * @mangled end_check__Ffff
 * @address 0x166170
 * @size 0x70
 * @unknownret
 */
void end_check(float, float, float);

/**
 * @mangled ObjAnimePlay__FP13OBJ_ANIME_SEQ
 * @address 0x1661E0
 * @size 0x790
 * @unknownret
 */
void ObjAnimePlay(OBJ_ANIME_SEQ *);

/**
 * @mangled InitEditEffect__FP6CFrameP16EDIT_EFFECT_INFO
 * @address 0x166970
 * @size 0x60
 * @unknownret
 */
void InitEditEffect(CFrame *, EDIT_EFFECT_INFO *);

/**
 * @mangled InitEditEffect__FP6CFrameP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFO
 * @address 0x1669D0
 * @size 0x1E0
 * @unknownret
 */
void InitEditEffect(CFrame *, EPARTS_FUNC_DATA *, EDIT_EFFECT_INFO *);

/**
 * @mangled CheckEditEffect__FP16EDIT_EFFECT_INFOf
 * @address 0x166BB0
 * @size 0x160
 * @unknownret
 */
void CheckEditEffect(EDIT_EFFECT_INFO *, float);

/**
 * @mangled EditEffectStep__Fv
 * @address 0x166D10
 * @size 0xD0
 * @unknownret
 */
void EditEffectStep(void);

/**
 * @mangled EditEffectStep2__Fv
 * @address 0x166DE0
 * @size 0x30
 * @unknownret
 */
void EditEffectStep2(void);

/**
 * @mangled DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup
 * @address 0x166E10
 * @size 0x250
 * @unknownret
 */
void DrawEditEffect(EDIT_EFFECT_INFO *, CCamera *, CEffectGroup *);
