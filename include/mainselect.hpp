#pragma once

#include "common.h"

// LOW CONFIDENCE: this header's filename is a guess -- the TU has no __sinit_*.cpp symbol to recover a real name from.

extern s32 MapNo;
extern s32 OldMapNo;
extern s32 LocalMapNo;
extern s32 StartEventNo;
extern s32 SystemMes;
extern char CSnd; /* 1 byte in retail, not 4 -- padded to a 4-byte slot in this globals group. */
extern s32 main_select_padrup;
extern s32 PolyCount;

extern s32 GameClearFlag;
extern s32 main_select_menu_no;
extern char main_select_param[256];

extern s32 old_main_mode;
