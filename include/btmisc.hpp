#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

class CFrame;
class CFrameVu1;

/**
 * Loads a model from a pack file.
 *
 * @mangled LoadMDSFilePack__FPUiPcP14CDataAlloc2_1_
 * @address 0x1B6D70
 * @size 0x8C
 */
CFrame *LoadMDSFilePack(unsigned int *pack, char *name, CDataAlloc2<1> *buffer);

/**
 * Loads a collision model from a pack file.
 *
 * @mangled LoadCollisionFilePack__FPUiPcP14CDataAlloc2_1_
 * @address 0x1B6E00
 * @size 0x80
 */
CFrame *LoadCollisionFilePack(unsigned int *pack, char *name, CDataAlloc2<1> *buffer);

/**
 * Loads a model from memory.
 *
 * @mangled LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
 * @address 0x1262B0
 * @size 0x4BC
 */
CFrameVu1 *LoadMDSFile(unsigned int *data, CDataAlloc2<1> *buffer, int flags,
                       char **model_name, char **texture_name);

/**
 * Gives the world position of one frame of a model.
 *
 * @mangled getFramePos__FP9CFrameVu1PcPf
 * @address 0x1B6F30
 * @size 0x50
 * @unknownret
 */
void getFramePos(CFrameVu1 *frame, char *name, float *position);

/**
 * Resolves the model and texture paths for a battle item.
 *
 * @mangled BtGetItemNamePath__FPcPci
 * @address 0x1B7120
 * @size 0x124
 */
void BtGetItemNamePath(char *model_path, char *texture_path, int item_no);

/**
 * Builds the model and texture file names of one of a character's weapons into
 * the two given buffers.
 *
 * @mangled BtGetWeaponNamePath2__FPcPcii
 * @address 0x1B7250
 * @size 0x158
 */
void BtGetWeaponNamePath2(char *name, char *path, int chara, int weapon);

/**
 * Builds the model and effect names for an absolute weapon item identifier.
 *
 * @mangled BtGetWeaponNamePath3__FPcPci
 * @address 0x1B73B0
 * @size 0xB4
 */
void BtGetWeaponNamePath3(char *name, char *effect_name, int weapon_no);

/**
 * Stops the current battle music.
 *
 * @mangled BtBattleMusic_Stop__Fv
 * @address 0x1B7640
 * @size 0x48
 */
void BtBattleMusic_Stop(void);
