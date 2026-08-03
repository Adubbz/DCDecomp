#pragma once

#include "common.h"

/**
 * @mangled OpeningInit__Fv
 * @address 0x1DAF1C0
 * @size 0x300
 * @unknownret
 */
void OpeningInit(void);

/**
 * @mangled LoadMessage__Fv
 * @address 0x1DAF4C0
 * @size 0x200
 * @unknownret
 */
void LoadMessage(void);

/**
 * @mangled LoadScene__Fv
 * @address 0x1DAF6C0
 * @size 0x120
 * @unknownret
 */
void LoadScene(void);

/**
 * @mangled LoadSceneBG__Fv
 * @address 0x1DAF7E0
 * @size 0x190
 * @unknownret
 */
void LoadSceneBG(void);

/**
 * @mangled OpeningLoop__Fv
 * @address 0x1DAF970
 * @size 0x130
 * @unknownret
 */
void OpeningLoop(void);

/**
 * @mangled SceneChange__Fv
 * @address 0x1DAFAA0
 * @size 0x1B0
 * @unknownret
 */
void SceneChange(void);

/**
 * @mangled PauseProcess__Fv
 * @address 0x1DAFC50
 * @size 0x280
 * @unknownret
 */
void PauseProcess(void);

/**
 * @mangled SoundStop__Fv
 * @address 0x1DAFED0
 * @size 0x40
 * @unknownret
 */
void SoundStop(void);

/**
 * @mangled WaitKeyProcess__Fv
 * @address 0x1DAFF10
 * @size 0x180
 * @unknownret
 */
void WaitKeyProcess(void);

/**
 * @mangled MotionProcess__Fv
 * @address 0x1DB0090
 * @size 0x3C0
 * @unknownret
 */
void MotionProcess(void);

/**
 * @mangled SoundProcess__Fv
 * @address 0x1DB0450
 * @size 0x330
 * @unknownret
 */
void SoundProcess(void);

/**
 * @mangled DrawProcess__Fv
 * @address 0x1DB0780
 * @size 0x360
 * @unknownret
 */
void DrawProcess(void);

/**
 * @mangled DrawMess__Fv
 * @address 0x1DB0AE0
 * @size 0x3D0
 * @unknownret
 */
void DrawMess(void);

/**
 * @mangled OpBgmPlay__Fv
 * @address 0x1DB0EB0
 * @size 0x90
 * @unknownret
 */
void OpBgmPlay(void);

/**
 * @mangled OpPlayVolPanSE__FPfffiii
 * @address 0x1DB0F40
 * @size 0x160
 * @unknownret
 */
void OpPlayVolPanSE(float *, float, float, int, int, int);

/**
 * @mangled OpSetVolPanSE__FPfffiii
 * @address 0x1DB10A0
 * @size 0x170
 * @unknownret
 */
void OpSetVolPanSE(float *, float, float, int, int, int);

/**
 * @mangled OpPlayVolSE__Fiiif
 * @address 0x1DB1210
 * @size 0xE0
 * @unknownret
 */
void OpPlayVolSE(int, int, int, float);

/**
 * @mangled OpGetVolSQ__Fi
 * @address 0x1DB12F0
 * @size 0x70
 * @unknownret
 */
void OpGetVolSQ(int);

/**
 * @mangled FadeCansel__Fv
 * @address 0x1DB1360
 * @size 0xA0
 * @unknownret
 */
void FadeCansel(void);

/**
 * @mangled OPAnalyz__FPc
 * @address 0x1DB1400
 * @size 0x1530
 * @unknownret
 */
void OPAnalyz(char *);

/**
 * @mangled OPMdsLoad__Fv
 * @address 0x1DB2930
 * @size 0x1F00
 * @unknownret
 */
void OPMdsLoad(void);

/**
 * @mangled skipSpace__FPci
 * @address 0x1DB4830
 * @size 0x110
 * @unknownret
 */
void skipSpace(char *, int);

/**
 * @mangled checkArg__FPciPi
 * @address 0x1DB4940
 * @size 0x580
 * @unknownret
 */
void checkArg(char *, int, int *);
