#pragma once

#include "common.h"

class CSound {
public:
    /**
     * @mangled GetMidiState__6CSoundFv
     * @address 0x143B50
     * @size 0x10
     * @unknownret
     */
    void GetMidiState(void);

    /**
     * @mangled GetSeInfTbl__6CSoundFv
     * @address 0x143B60
     * @size 0x10
     * @unknownret
     */
    void GetSeInfTbl(void);

    /**
     * @mangled GetSeNo__6CSoundFii
     * @address 0x143B70
     * @size 0x80
     * @unknownret
     */
    void GetSeNo(int, int);

    /**
     * @mangled StopVoice__6CSoundFi
     * @address 0x143BF0
     * @size 0x60
     * @unknownret
     */
    void StopVoice(int);

    /**
     * @mangled SetReverb__6CSoundFiii
     * @address 0x143C50
     * @size 0x120
     * @unknownret
     */
    void SetReverb(int, int, int);

    /**
     * @mangled LoadSoundFileFromPack__6CSoundFPcPUi
     * @address 0x1440D0
     * @size 0x9C0
     * @unknownret
     */
    void LoadSoundFileFromPack(char *, unsigned int *);

    /**
     * @mangled LoadSqInf__6CSoundFPcPUi
     * @address 0x144A90
     * @size 0x130
     * @unknownret
     */
    void LoadSqInf(char *, unsigned int *);

    /**
     * @mangled LoadSeInf__6CSoundFPcPUi
     * @address 0x144BC0
     * @size 0x1A0
     * @unknownret
     */
    void LoadSeInf(char *, unsigned int *);

    /**
     * @mangled Init__6CSoundFiiii
     * @address 0x144D60
     * @size 0x4C0
     * @unknownret
     */
    void Init(int, int, int, int);

    /**
     * @mangled SQ_Play__6CSoundFii
     * @address 0x145220
     * @size 0x1D0
     * @unknownret
     */
    void SQ_Play(int, int);

    /**
     * @mangled SQ_Play__6CSoundFiii
     * @address 0x1453F0
     * @size 0x1B0
     * @unknownret
     */
    void SQ_Play(int, int, int);

    /**
     * @mangled SQ_RePlay__6CSoundFi
     * @address 0x1455A0
     * @size 0x50
     * @unknownret
     */
    void SQ_RePlay(int);

    /**
     * @mangled SE_Play__6CSoundFiiiiiii
     * @address 0x1455F0
     * @size 0x6C
     * @unknownret
     */
    void SE_Play(int, int, int, int, int, int, int);

    /**
     * @mangled SE_Play__6CSoundFiii
     * @address 0x1457C0
     * @size 0x60
     * @unknownret
     */
    void SE_Play(int, int, int);

    /**
     * @mangled SE_Play__6CSoundFiiiii
     * @address 0x145820
     * @size 0x30
     * @unknownret
     */
    void SE_Play(int, int, int, int, int);

    /**
     * @mangled SE_Play__6CSoundFiiii
     * @address 0x145850
     * @size 0x30
     * @unknownret
     */
    void SE_Play(int, int, int, int);

    /**
     * @mangled SE_SetVol__6CSoundFiiiii
     * @address 0x145880
     * @size 0x50
     * @unknownret
     */
    void SE_SetVol(int, int, int, int, int);

    /**
     * @mangled SE_SetPan__6CSoundFiiiii
     * @address 0x145990
     * @size 0x50
     * @unknownret
     */
    void SE_SetPan(int, int, int, int, int);

    /**
     * @mangled SE_SetPan__6CSoundFiiii
     * @address 0x145AA0
     * @size 0x50
     * @unknownret
     */
    void SE_SetPan(int, int, int, int);

    /**
     * @mangled SE_Stop__6CSoundFiiii
     * @address 0x145AF0
     * @size 0x48
     * @unknownret
     */
    void SE_Stop(int, int, int, int);

    /**
     * @mangled Fade__6CSoundFifi
     * @address 0x145BF0
     * @size 0x330
     * @unknownret
     */
    void Fade(int, float, int);

    /**
     * @mangled Step__6CSoundFv
     * @address 0x145F20
     * @size 0x9F0
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Stop__6CSoundFi
     * @address 0x146910
     * @size 0x50
     * @unknownret
     */
    void Stop(int);

    /**
     * @mangled SetVol__6CSoundFii
     * @address 0x146960
     * @size 0x30
     * @unknownret
     */
    void SetVol(int, int);

    /**
     * @mangled SetStereoMode__6CSoundFi
     * @address 0x146990
     * @size 0x30
     * @unknownret
     */
    void SetStereoMode(int);

    /**
     * @mangled LoadHdBd_A__6CSoundFiiii
     * @address 0x1469C0
     * @size 0x180
     * @unknownret
     */
    void LoadHdBd_A(int, int, int, int);

    /**
     * @mangled LoadHdBd_C__6CSoundFiiii
     * @address 0x146B40
     * @size 0x230
     * @unknownret
     */
    void LoadHdBd_C(int, int, int, int);

    /**
     * @mangled LoadHdBd_E__6CSoundFiiii
     * @address 0x146D70
     * @size 0x180
     * @unknownret
     */
    void LoadHdBd_E(int, int, int, int);

    /**
     * @mangled LoadHdBd_G__6CSoundFiiii
     * @address 0x146EF0
     * @size 0x180
     * @unknownret
     */
    void LoadHdBd_G(int, int, int, int);

    /**
     * @mangled LoadHdBd_I__6CSoundFiiii
     * @address 0x147070
     * @size 0x270
     * @unknownret
     */
    void LoadHdBd_I(int, int, int, int);

    /**
     * @mangled LoadHdBd_M__6CSoundFiiii
     * @address 0x1472E0
     * @size 0x170
     * @unknownret
     */
    void LoadHdBd_M(int, int, int, int);

    /**
     * @mangled LoadHdBd_Q__6CSoundFiiii
     * @address 0x147450
     * @size 0x170
     * @unknownret
     */
    void LoadHdBd_Q(int, int, int, int);

    /**
     * @mangled LoadHdBd_S__6CSoundFiiii
     * @address 0x1475C0
     * @size 0x170
     * @unknownret
     */
    void LoadHdBd_S(int, int, int, int);

    /**
     * @mangled LoadSeq_A__6CSoundFii
     * @address 0x147730
     * @size 0xC0
     * @unknownret
     */
    void LoadSeq_A(int, int);

    /**
     * @mangled LoadSeq_E__6CSoundFii
     * @address 0x1477F0
     * @size 0xC0
     * @unknownret
     */
    void LoadSeq_E(int, int);

    /**
     * @mangled LoadSeq_I__6CSoundFii
     * @address 0x1478B0
     * @size 0xC0
     * @unknownret
     */
    void LoadSeq_I(int, int);
};
