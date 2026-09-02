#pragma once

#include "common.h"

/**
 *          Initializes the opening-movie controller and shared scene state.
 *
 * @mangled OpeningInit__Fv
 * @address 0x1DAF1C0
 * @size 0x300
 * @unknownret
 */
void OpeningInit(void);

/**
 *          Loads the opening movie's localized message resources.
 *
 * @mangled LoadMessage__Fv
 * @address 0x1DAF4C0
 * @size 0x200
 * @unknownret
 */
void LoadMessage(void);

/**
 *          Loads the assets required by the selected opening scene.
 *
 * @mangled LoadScene__Fv
 * @address 0x1DAF6C0
 * @size 0x120
 * @unknownret
 */
void LoadScene(void);

/**
 *          Loads the active opening scene's background phase.
 *
 * @mangled LoadSceneBG__Fv
 * @address 0x1DAF7E0
 * @size 0x190
 * @unknownret
 */
void LoadSceneBG(void);

/**
 *          Advances the opening movie and reports its completion state.
 *
 * @mangled OpeningLoop__Fv
 * @address 0x1DAF970
 * @size 0x130
 * @unknownret
 */
int OpeningLoop(void);

/**
 *          Advances to the next opening scene or loading phase.
 *
 * @mangled SceneChange__Fv
 * @address 0x1DAFAA0
 * @size 0x1B0
 * @unknownret
 */
void SceneChange(void);

/**
 *          Processes pause input and pause-screen state.
 *
 * @mangled PauseProcess__Fv
 * @address 0x1DAFC50
 * @size 0x280
 * @unknownret
 */
void PauseProcess(void);

/**
 *          Stops the opening scene's active sounds.
 *
 * @mangled SoundStop__Fv
 * @address 0x1DAFED0
 * @size 0x40
 * @unknownret
 */
void SoundStop(void);

/**
 *          Processes input while the movie is waiting for a key.
 *
 * @mangled WaitKeyProcess__Fv
 * @address 0x1DAFF10
 * @size 0x180
 * @unknownret
 */
void WaitKeyProcess(void);

/**
 *          Dispatches motion processing for the active opening scene.
 *
 * @mangled MotionProcess__Fv
 * @address 0x1DB0090
 * @size 0x3C0
 * @unknownret
 */
void MotionProcess(void);

/**
 *          Dispatches sound processing for the active opening scene.
 *
 * @mangled SoundProcess__Fv
 * @address 0x1DB0450
 * @size 0x330
 * @unknownret
 */
void SoundProcess(void);

/**
 *          Dispatches drawing for the active opening scene.
 *
 * @mangled DrawProcess__Fv
 * @address 0x1DB0780
 * @size 0x360
 * @unknownret
 */
void DrawProcess(void);

/**
 *          Draws opening subtitles and pause messages.
 *
 * @mangled DrawMess__Fv
 * @address 0x1DB0AE0
 * @size 0x3D0
 * @unknownret
 */
void DrawMess(void);

/**
 *          Starts the opening movie's selected background music.
 *
 * @mangled OpBgmPlay__Fv
 * @address 0x1DB0EB0
 * @size 0x90
 * @unknownret
 */
void OpBgmPlay(void);

/**
 *          Plays a positionally panned opening sound effect.
 *
 * @mangled OpPlayVolPanSE__FPfffiii
 * @address 0x1DB0F40
 * @size 0x160
 * @unknownret
 */
void OpPlayVolPanSE(float *, float, float, int, int, int);

/**
 *          Updates a positional opening sound effect's volume and pan.
 *
 * @mangled OpSetVolPanSE__FPfffiii
 * @address 0x1DB10A0
 * @size 0x170
 * @unknownret
 */
void OpSetVolPanSE(float *, float, float, int, int, int);

/**
 *          Plays an opening sound effect at an explicit volume.
 *
 * @mangled OpPlayVolSE__Fiiif
 * @address 0x1DB1210
 * @size 0xE0
 * @unknownret
 */
void OpPlayVolSE(int, int, int, float);

/**
 *          Returns the current volume of an opening sequence channel.
 *
 * @mangled OpGetVolSQ__Fi
 * @address 0x1DB12F0
 * @size 0x70
 * @unknownret
 */
int OpGetVolSQ(int);

/**
 *          Cancels active opening sound fades.
 *
 * @mangled FadeCansel__Fv
 * @address 0x1DB1360
 * @size 0xA0
 * @unknownret
 */
void FadeCansel(void);

/**
 *          Parses an opening scene definition file.
 *
 * @mangled OPAnalyz__FPc
 * @address 0x1DB1400
 * @size 0x1530
 * @unknownret
 */
void OPAnalyz(char *);

/**
 *          Constructs scene objects from the parsed definition tree.
 *
 * @mangled OPMdsLoad__Fv
 * @address 0x1DB2930
 * @size 0x1F00
 * @unknownret
 */
void OPMdsLoad(void);

/**
 *          Skips whitespace and comments in a scene definition.
 *
 * @mangled skipSpace__FPci
 * @address 0x1DB4830
 * @size 0x110
 * @unknownret
 */
int skipSpace(char *, int);

/**
 *          Parses one scene-definition command's typed arguments.
 *
 * @mangled checkArg__FPciPi
 * @address 0x1DB4940
 * @size 0x580
 * @unknownret
 */
int checkArg(char *, int, int *);
