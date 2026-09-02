#pragma once

#include "common.h"

/**
 *          Updates and transfers one actor's eye and mouth textures.
 *
 * @mangled FaceChange__Fi
 * @address 0x1DB87D0
 * @size 0x730
 */
void FaceChange(int actor_no);

/**
 *          Loads one village-scene character into the requested slot.
 *
 * @mangled LoadCharaData__Fii
 * @address 0x1DB8F00
 * @size 0x1E0
 * @unknownret
 */
void LoadCharaData(int, int);

/**
 *          Streams the next motion segment for the dancing couple.
 *
 * @mangled LoadMotionData__Fv
 * @address 0x1DB90E0
 * @size 0x2F0
 * @unknownret
 */
void LoadMotionData(void);

/**
 *          Loads the first village background phase.
 *
 * @mangled OpB_LoadDataBG__Fv
 * @address 0x1DB93D0
 * @size 0x50
 * @unknownret
 */
void OpB_LoadDataBG(void);

/**
 *          Loads the second village background phase.
 *
 * @mangled OpB_LoadDataBG2__Fv
 * @address 0x1DB9420
 * @size 0x50
 * @unknownret
 */
void OpB_LoadDataBG2(void);

/**
 *          Initializes the first phase of the village scene.
 *
 * @mangled OpB_InitProcess__Fv
 * @address 0x1DB9470
 * @size 0xD50
 * @unknownret
 */
void OpB_InitProcess(void);

/**
 *          Initializes the Toan-house phase of the village scene.
 *
 * @mangled OpB_InitProcess2__Fv
 * @address 0x1DBA1C0
 * @size 0x700
 * @unknownret
 */
void OpB_InitProcess2(void);

/**
 *          Advances the village scene's scripted motion state.
 *
 * @mangled OpB_MotionProcess__Fv
 * @address 0x1DBA8C0
 * @size 0x460
 * @unknownret
 */
void OpB_MotionProcess(void);

/**
 *          Updates sound and music for the village scene.
 *
 * @mangled OpB_SoundProcess__Fv
 * @address 0x1DBAD20
 * @size 0x500
 * @unknownret
 */
void OpB_SoundProcess(void);

/**
 *          Draws one frame of the village scene.
 *
 * @mangled OpB_DrawProcess__Fv
 * @address 0x1DBB220
 * @size 0x680
 * @unknownret
 */
void OpB_DrawProcess(void);

/**
 *          Advances the village sign's texture animation.
 *
 * @mangled setTexAnime__Fv
 * @address 0x1DBB8A0
 * @size 0x1F0
 * @unknownret
 */
void setTexAnime(void);
