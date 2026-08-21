#pragma once

#include "common.h"

class CFrameVu1;

/**
 * @file
 * Declares the calls that read a file off the disc, and the ones that reach
 * into a pack file once it has been read.
 */

/**
 * Steps the background read, and says whether one is still going.
 *
 * @mangled ReadBGSync__Fv
 * @address 0x13EE30
 * @size 0x88
 */
int ReadBGSync(void);

/**
 * Reads a whole file off the disc.
 *
 * @mangled LoadFile__FPcPvPi
 * @address 0x13F360
 * @size 0x6C
 * @unknownret
 */
void LoadFile(char *path, void *buffer, int *out_size);

/**
 * Finds a file inside a pack that has already been read.
 *
 * @mangled GetPackFile__FPUiPcPi
 * @address 0x13F720
 * @size 0xD8
 */
char *GetPackFile(unsigned int *pack, char *name, int *out_size);

/**
 * Turns a model towards one heading, a step at a time, and gives back the
 * heading it stands on now.
 *
 * @mangled unitRotation__FP9CFrameVu1f
 * @address 0x140810
 * @size 0x28C
 */
float unitRotation(CFrameVu1 *frame, float heading);
