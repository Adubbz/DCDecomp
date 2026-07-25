#pragma once

#include "common.h"

class CSound {
public:
    /* ?ret */ void GetMidiState(void); // @ 0x143B50 (0x10 bytes) -- mangled: GetMidiState__6CSoundFv
    /* ?ret */ void GetSeInfTbl(void); // @ 0x143B60 (0x10 bytes) -- mangled: GetSeInfTbl__6CSoundFv
    /* ?ret */ void GetSeNo(int, int); // @ 0x143B70 (0x80 bytes) -- mangled: GetSeNo__6CSoundFii
    /* ?ret */ void StopVoice(int); // @ 0x143BF0 (0x60 bytes) -- mangled: StopVoice__6CSoundFi
    /* ?ret */ void SetReverb(int, int, int); // @ 0x143C50 (0x120 bytes) -- mangled: SetReverb__6CSoundFiii
    /* ?ret */ void LoadSoundFileFromPack(char *, unsigned int *); // @ 0x1440D0 (0x9C0 bytes) -- mangled: LoadSoundFileFromPack__6CSoundFPcPUi
    /* ?ret */ void LoadSqInf(char *, unsigned int *); // @ 0x144A90 (0x130 bytes) -- mangled: LoadSqInf__6CSoundFPcPUi
    /* ?ret */ void LoadSeInf(char *, unsigned int *); // @ 0x144BC0 (0x1A0 bytes) -- mangled: LoadSeInf__6CSoundFPcPUi
    /* ?ret */ void Init(int, int, int, int); // @ 0x144D60 (0x4C0 bytes) -- mangled: Init__6CSoundFiiii
    /* ?ret */ void SQ_Play(int, int); // @ 0x145220 (0x1D0 bytes) -- mangled: SQ_Play__6CSoundFii
    /* ?ret */ void SQ_Play(int, int, int); // @ 0x1453F0 (0x1B0 bytes) -- mangled: SQ_Play__6CSoundFiii
    /* ?ret */ void SQ_RePlay(int); // @ 0x1455A0 (0x50 bytes) -- mangled: SQ_RePlay__6CSoundFi
    /* ?ret */ void SE_Play(int, int, int, int, int, int, int); // @ 0x1455F0 (0x6C bytes) -- mangled: SE_Play__6CSoundFiiiiiii
    /* ?ret */ void SE_Play(int, int, int); // @ 0x1457C0 (0x60 bytes) -- mangled: SE_Play__6CSoundFiii
    /* ?ret */ void SE_Play(int, int, int, int, int); // @ 0x145820 (0x30 bytes) -- mangled: SE_Play__6CSoundFiiiii
    /* ?ret */ void SE_Play(int, int, int, int); // @ 0x145850 (0x30 bytes) -- mangled: SE_Play__6CSoundFiiii
    /* ?ret */ void SE_SetVol(int, int, int, int, int); // @ 0x145880 (0x50 bytes) -- mangled: SE_SetVol__6CSoundFiiiii
    /* ?ret */ void SE_SetPan(int, int, int, int, int); // @ 0x145990 (0x50 bytes) -- mangled: SE_SetPan__6CSoundFiiiii
    /* ?ret */ void SE_SetPan(int, int, int, int); // @ 0x145AA0 (0x50 bytes) -- mangled: SE_SetPan__6CSoundFiiii
    /* ?ret */ void SE_Stop(int, int, int, int); // @ 0x145AF0 (0x48 bytes) -- mangled: SE_Stop__6CSoundFiiii
    /* ?ret */ void Fade(int, float, int); // @ 0x145BF0 (0x330 bytes) -- mangled: Fade__6CSoundFifi
    /* ?ret */ void Step(void); // @ 0x145F20 (0x9F0 bytes) -- mangled: Step__6CSoundFv
    /* ?ret */ void Stop(int); // @ 0x146910 (0x50 bytes) -- mangled: Stop__6CSoundFi
    /* ?ret */ void SetVol(int, int); // @ 0x146960 (0x30 bytes) -- mangled: SetVol__6CSoundFii
    /* ?ret */ void SetStereoMode(int); // @ 0x146990 (0x30 bytes) -- mangled: SetStereoMode__6CSoundFi
    /* ?ret */ void LoadHdBd_A(int, int, int, int); // @ 0x1469C0 (0x180 bytes) -- mangled: LoadHdBd_A__6CSoundFiiii
    /* ?ret */ void LoadHdBd_C(int, int, int, int); // @ 0x146B40 (0x230 bytes) -- mangled: LoadHdBd_C__6CSoundFiiii
    /* ?ret */ void LoadHdBd_E(int, int, int, int); // @ 0x146D70 (0x180 bytes) -- mangled: LoadHdBd_E__6CSoundFiiii
    /* ?ret */ void LoadHdBd_G(int, int, int, int); // @ 0x146EF0 (0x180 bytes) -- mangled: LoadHdBd_G__6CSoundFiiii
    /* ?ret */ void LoadHdBd_I(int, int, int, int); // @ 0x147070 (0x270 bytes) -- mangled: LoadHdBd_I__6CSoundFiiii
    /* ?ret */ void LoadHdBd_M(int, int, int, int); // @ 0x1472E0 (0x170 bytes) -- mangled: LoadHdBd_M__6CSoundFiiii
    /* ?ret */ void LoadHdBd_Q(int, int, int, int); // @ 0x147450 (0x170 bytes) -- mangled: LoadHdBd_Q__6CSoundFiiii
    /* ?ret */ void LoadHdBd_S(int, int, int, int); // @ 0x1475C0 (0x170 bytes) -- mangled: LoadHdBd_S__6CSoundFiiii
    /* ?ret */ void LoadSeq_A(int, int); // @ 0x147730 (0xC0 bytes) -- mangled: LoadSeq_A__6CSoundFii
    /* ?ret */ void LoadSeq_E(int, int); // @ 0x1477F0 (0xC0 bytes) -- mangled: LoadSeq_E__6CSoundFii
    /* ?ret */ void LoadSeq_I(int, int); // @ 0x1478B0 (0xC0 bytes) -- mangled: LoadSeq_I__6CSoundFii
};
