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
 * Reads the collision model a whole file holds.
 *
 * @mangled LoadCollisionFile__FPUiP14CDataAlloc2_1_
 * @address 0x126F70
 * @size 0x2E0
 */
CFrame *LoadCollisionFile(unsigned int *data, CDataAlloc2<1> *buffer);

/**
 * Loads a model from memory.
 *
 * @mangled LoadMDSFile__FPUiP14CDataAlloc2_1_iPPcPPc
 * @address 0x1262B0
 * @size 0x4BC
 */
CFrame *LoadMDSFile(unsigned int *data, CDataAlloc2<1> *buffer, int flags,
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
