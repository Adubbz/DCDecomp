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


/* ?ret */ void ObjAnimeAllStop(void); // @ 0x165CE0 (0x10 bytes) -- mangled: ObjAnimeAllStop__Fv
/* ?ret */ void ObjAnimeAllStart(void); // @ 0x165CF0 (0x10 bytes) -- mangled: ObjAnimeAllStart__Fv
/* ?ret */ void InitObjAnime(CFrame *, OBJ_ANIME_SEQ *); // @ 0x165D00 (0xD0 bytes) -- mangled: InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
/* ?ret */ void InitObjAnime(CFrame **, OBJ_ANIME_SEQ *); // @ 0x165DD0 (0x100 bytes) -- mangled: InitObjAnime__FPP6CFrameP13OBJ_ANIME_SEQ
/* ?ret */ void InitObjAnime(CFrame **, int, OBJ_ANIME_SEQ *); // @ 0x165ED0 (0x140 bytes) -- mangled: InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ
/* ?ret */ void InitObjAnime(CFrame **, int, EPARTS_FUNC_DATA *, OBJ_ANIME_SEQ *); // @ 0x166010 (0x160 bytes) -- mangled: InitObjAnime__FPP6CFrameiP16EPARTS_FUNC_DATAP13OBJ_ANIME_SEQ
/* ?ret */ void end_check(float, float, float); // @ 0x166170 (0x70 bytes) -- mangled: end_check__Ffff
/* ?ret */ void ObjAnimePlay(OBJ_ANIME_SEQ *); // @ 0x1661E0 (0x790 bytes) -- mangled: ObjAnimePlay__FP13OBJ_ANIME_SEQ
/* ?ret */ void InitEditEffect(CFrame *, EDIT_EFFECT_INFO *); // @ 0x166970 (0x60 bytes) -- mangled: InitEditEffect__FP6CFrameP16EDIT_EFFECT_INFO
/* ?ret */ void InitEditEffect(CFrame *, EPARTS_FUNC_DATA *, EDIT_EFFECT_INFO *); // @ 0x1669D0 (0x1E0 bytes) -- mangled: InitEditEffect__FP6CFrameP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFO
/* ?ret */ void CheckEditEffect(EDIT_EFFECT_INFO *, float); // @ 0x166BB0 (0x160 bytes) -- mangled: CheckEditEffect__FP16EDIT_EFFECT_INFOf
/* ?ret */ void EditEffectStep(void); // @ 0x166D10 (0xD0 bytes) -- mangled: EditEffectStep__Fv
/* ?ret */ void EditEffectStep2(void); // @ 0x166DE0 (0x30 bytes) -- mangled: EditEffectStep2__Fv
/* ?ret */ void DrawEditEffect(EDIT_EFFECT_INFO *, CCamera *, CEffectGroup *); // @ 0x166E10 (0x250 bytes) -- mangled: DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup
