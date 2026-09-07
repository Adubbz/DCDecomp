#pragma once

class CMapParts;
struct EDITPARTS_INFO;

/**
 * Applies one editable part definition's object visibility to its map part.
 *
 * @mangled EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi
 * @address 0x18EC60
 * @size 0x138
 */
void EdPartsObjectOnOff(CMapParts *, EDITPARTS_INFO *, int);

/**
 * Installs the common and map-specific event bytecode streams.
 *
 * @mangled EdSetEventScript__FPcPcP14CDataAlloc2_1_
 * @address 0x196CF0
 * @size 0x208
 */
void EdSetEventScript(char *common_script, char *map_script, CDataAlloc2<1> *allocator);

/**
 * Initializes the editor's full-screen fade state.
 *
 * @mangled EdFadeInit__Fv
 * @address 0x1896D0
 * @size 0x34
 */
void EdFadeInit();

/**
 * Starts fading from an opaque colour to the scene.
 *
 * @mangled EdFadeIn__Fifff
 * @address 0x189710
 * @size 0x7C
 */
void EdFadeIn(int frames, float red, float green, float blue);

/**
 * Starts fading from the scene to an opaque colour.
 *
 * @mangled EdFadeOut__Fifff
 * @address 0x189790
 * @size 0x78
 */
void EdFadeOut(int frames, float red, float green, float blue);

/**
 * Returns whether the active fade has reached its endpoint.
 *
 * @mangled EdFadeOutCheck__Fv
 * @address 0x189810
 * @size 0xC
 */
int EdFadeOutCheck();

/**
 * Reads the colour currently used by the editor's screen fade.
 *
 * @mangled EdGetFadeColor__FPf
 * @address 0x189820
 * @size 0x38
 */
void EdGetFadeColor(float *colour);

/**
 * Steps and draws the active full-screen fade.
 *
 * @mangled EdFadeInOut__Fv
 * @address 0x189860
 * @size 0x1B0
 */
void EdFadeInOut();
