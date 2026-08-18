#pragma once

#include "common.h"

/**
 * @file
 * Declares the reader that fills a character out of a pack file.
 */

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
class CDataAlloc2_1_;

/**
 * Reads one character out of a pack file: its model, its motions, its textures
 * and everything that goes with them.
 *
 * @mangled ReadInfo__FP10CCharacterPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_iP14CDataAlloc2_1_ii
 * @address 0x139D10
 * @size 0x260
 * @unknownret
 */
void ReadInfo(CCharacter *chara, unsigned int *pack, char *name, CDataAlloc2_1_ *model_alloc,
              CDataAlloc2_1_ *motion_alloc, CDataAlloc2_1_ *texture_alloc, int motion_set,
              CDataAlloc2_1_ *extend_alloc, int unk_08, int unk_09);
