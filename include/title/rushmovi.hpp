#pragma once

#include "common.h"

/**
 * @mangled RushInit__Fv
 * @address 0x1DC8C50
 * @size 0x260
 * @unknownret
 */
void RushInit(void);

/**
 * @mangled RushLoop__Fv
 * @address 0x1DC8EB0
 * @size 0x1F0
 * @unknownret
 */
void RushLoop(void);

/**
 * @mangled MotionProcess__Fv__2
 * @address 0x1DC90A0
 * @size 0xDD0
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void MotionProcess(void);

/**
 * @mangled DrawProcess__Fv__2
 * @address 0x1DC9E70
 * @size 0x350
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void DrawProcess(void);

/**
 * @mangled SoundProcess__Fv__2
 * @address 0x1DCA1C0
 * @size 0xD00
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void SoundProcess(void);

/**
 * @mangled SetObjAnime__FPcP9CFrameVu1PfPf
 * @address 0x1DCAEC0
 * @size 0x160
 * @unknownret
 */
void SetObjAnime(char *, CFrameVu1 *, float *, float *);

/**
 * @mangled WaterProcess__Fv__2
 * @address 0x1DCB020
 * @size 0x290
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void WaterProcess(void);
