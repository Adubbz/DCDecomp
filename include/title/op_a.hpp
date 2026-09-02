#pragma once

#include "common.h"

/**
 *          Initializes the dungeon-square opening scene.
 *
 * @mangled OpA_InitProcess__Fv
 * @address 0x1DB4EC0
 * @size 0x1B0
 * @unknownret
 */
void OpA_InitProcess(void);

/**
 *          Loads the dungeon-square scene textures.
 *
 * @mangled LoadTexture__Fv__3
 * @address 0x1DB5070
 * @size 0x3B0
 * @unknownret
 * @note disambiguated by disassembler ("__3" suffix); real retail name has no suffix
 */
void LoadTexture(void);

/**
 *          Loads the dungeon-square actors and effects.
 *
 * @mangled LoadData__Fv__2
 * @address 0x1DB5420
 * @size 0x330
 * @unknownret
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
void LoadData(void);

/**
 *          Installs the couple's initial dance motions.
 *
 * @mangled SetDanceMotion__Fv
 * @address 0x1DB5750
 * @size 0x150
 * @unknownret
 */
void SetDanceMotion(void);

/**
 *          Initializes the crowd positions around the dancers.
 *
 * @mangled InitDancerPos__Fv
 * @address 0x1DB58A0
 * @size 0x130
 * @unknownret
 */
void InitDancerPos(void);

/**
 *          Draws one frame of the dungeon-square scene.
 *
 * @mangled OpA_DrawProcess__Fv
 * @address 0x1DB59D0
 * @size 0xD40
 * @unknownret
 */
void OpA_DrawProcess(void);

/**
 *          Draws the scrolling cloud model.
 *
 * @mangled DrawCloud__Fv
 * @address 0x1DB6710
 * @size 0x230
 * @unknownret
 */
void DrawCloud(void);

/**
 *          Emits and advances the chimney smoke particles.
 *
 * @mangled SmokeProcess__Fv
 * @address 0x1DB6940
 * @size 0x2B0
 * @unknownret
 */
void SmokeProcess(void);

/**
 *          Advances the dungeon-square scene state.
 *
 * @mangled OpA_MotionProcess__Fv
 * @address 0x1DB6BF0
 * @size 0x9E0
 * @unknownret
 */
void OpA_MotionProcess(void);

/**
 *          Places the crowd on the camera model's dancer frames.
 *
 * @mangled MoveDancers__Fv
 * @address 0x1DB75D0
 * @size 0x190
 * @unknownret
 */
void MoveDancers(void);

/**
 *          Draws the reader's paired foot shadows.
 *
 * @mangled ReaderShadow__Fv
 * @address 0x1DB7760
 * @size 0xC0
 * @unknownret
 */
void ReaderShadow(void);

/**
 *          Draws the dancer's paired foot shadows.
 *
 * @mangled DancerShadow__Fv
 * @address 0x1DB7820
 * @size 0xC0
 * @unknownret
 */
void DancerShadow(void);

/**
 *          Draws the shogun's scene shadow.
 *
 * @mangled ShogunShadow__Fv
 * @address 0x1DB78E0
 * @size 0xD0
 * @unknownret
 */
void ShogunShadow(void);

/**
 *          Draws the priest's scene shadow.
 *
 * @mangled ShisaiShadow__Fv
 * @address 0x1DB79B0
 * @size 0xD0
 * @unknownret
 */
void ShisaiShadow(void);

/**
 *          Places and fades the shared ground-shadow model.
 *
 * @mangled DrawShadow__Ffff
 * @address 0x1DB7A80
 * @size 0x110
 * @unknownret
 */
void DrawShadow(float, float, float);

/**
 *          Updates sound and music for the dungeon-square scene.
 *
 * @mangled OpA_SoundProcess__Fv
 * @address 0x1DB7B90
 * @size 0x740
 * @unknownret
 */
void OpA_SoundProcess(void);

/**
 *          Scrolls the waterfall texture plate.
 *
 * @mangled setTexScroll__Fv
 * @address 0x1DB82D0
 * @size 0x280
 * @unknownret
 */
void setTexScroll(void);

/**
 *          Scrolls the cloud texture plate.
 *
 * @mangled setCloudTexScroll__Fv
 * @address 0x1DB8550
 * @size 0x280
 * @unknownret
 */
void setCloudTexScroll(void);
