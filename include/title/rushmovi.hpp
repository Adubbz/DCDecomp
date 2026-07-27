#pragma once

#include "common.h"

/* ?ret */ void RushInit(void); // @ 0x1DC8C50 (0x260 bytes) -- mangled: RushInit__Fv
/* ?ret */ void RushLoop(void); // @ 0x1DC8EB0 (0x1F0 bytes) -- mangled: RushLoop__Fv
/* ?ret */ void MotionProcess(void); // @ 0x1DC90A0 (0xDD0 bytes) -- mangled: MotionProcess__Fv__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void DrawProcess(void); // @ 0x1DC9E70 (0x350 bytes) -- mangled: DrawProcess__Fv__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void SoundProcess(void); // @ 0x1DCA1C0 (0xD00 bytes) -- mangled: SoundProcess__Fv__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void SetObjAnime(char *, CFrameVu1 *, float *, float *); // @ 0x1DCAEC0 (0x160 bytes) -- mangled: SetObjAnime__FPcP9CFrameVu1PfPf
/* ?ret */ void WaterProcess(void); // @ 0x1DCB020 (0x290 bytes) -- mangled: WaterProcess__Fv__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
