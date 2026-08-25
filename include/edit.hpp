#pragma once

#include "common.h"

class CEditGround;

/**
 * Describes the time range and rendering parameters of depth of field.
 */
struct DEPTH_OF_FIELD_INFO {
    float start;       /**< Start time on the game's twelve-unit clock. */
    float end;         /**< End time on the game's twelve-unit clock. */
    float distance[2]; /**< Near and far focus distances. */
    int level;         /**< Strength preset selected for the effect. */
    int alpha;         /**< Blend alpha of the effect. */
    int blur;          /**< Blur-kernel setting of the effect. */
};

/**
 * Initializes the editor's full-screen fade state.
 */
void EdFadeInit();
/**
 * Starts fading from an opaque colour to the scene.
 */
void EdFadeIn(int frames, float red, float green, float blue);
/**
 * Starts fading from the scene to an opaque colour.
 */
void EdFadeOut(int frames, float red, float green, float blue);
/**
 * Returns whether the active fade has reached its endpoint.
 */
int EdFadeOutCheck();
/**
 * Steps and draws the active full-screen fade.
 */
void EdFadeInOut();
/**
 * Selects the default depth-of-field parameters for a level.
 */
void EdSetDOFLevel(int level);
/**
 * Copies a map's depth-of-field parameters into editor state.
 */
void EdSetDOF(DEPTH_OF_FIELD_INFO *info);
/**
 * Draws depth of field using either the stored or requested level.
 */
void EdDrawDOF(int level);
/**
 * Resets the editor lightning effect.
 */
void EdInitThunderEffect();
/**
 * Steps lightning for a map and its editable ground model.
 */
void EdThunderEffect(int map, CEditGround *ground);

/**
 * @file
 * Declares what the dungeon needs from the Georama editor: the fade the
 * editor is part way through, which the dungeon carries on with.
 */

/**
 * Reads the colour the screen is faded to.
 *
 * @mangled EdGetFadeColor__FPf
 * @address 0x189820
 * @size 0x40
 * @unknownret
 */
void EdGetFadeColor(float *colour);

/**
 * Converts a clock hour into the game's twelve-unit time scale.
 *
 * @mangled ConvertTime__Ff
 * @address 0x1740F0
 * @size 0x54
 */
float ConvertTime(float hour);

/**
 * Converts the game's twelve-unit time scale back into a clock hour.
 *
 * @mangled InvertTime__Ff
 * @address 0x174150
 * @size 0x4C
 */
float InvertTime(float time);
