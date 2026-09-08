#pragma once

#include "common.h"
#include "texture.hpp"

class CMapParts;
struct ED_EVENT_POINT;
struct EDITPARTS_INFO;
struct EPARTS_FUNC_DATA;
struct RS_STACKDATA;
struct OBJ_ANIME_SEQ;

/**
 * Allocates and initializes an event point from one map-part function marker.
 *
 * @mangled GetNewEventPoint__FP9CMapPartsP16EPARTS_FUNC_DATAP14ED_EVENT_POINTi
 * @address 0x183C40
 * @size 0x110
 */
ED_EVENT_POINT *GetNewEventPoint(CMapParts *parts, EPARTS_FUNC_DATA *function,
                                 ED_EVENT_POINT *points, int count);

/**
 * Stores one script-controlled sprite drawn during an editor event.
 */
struct ED_SPRITE {
    /**
     * Constructs the texture owned by an editor event sprite.
     *
     * @mangled __ct__9ED_SPRITEFv
     * @address 0x199F50
     * @size 0x34
     */
    ED_SPRITE();

    s16 enabled;          /**< Whether the sprite is active. */
    s16 layer;            /**< Drawing layer that selects when the sprite is emitted. */
    s16 rotated;          /**< Whether the sprite uses the rotated drawing path. */
    s16 bilinear;         /**< Texture filtering mode used while drawing the sprite. */
    float x;              /**< Horizontal screen position. */
    float y;              /**< Vertical screen position. */
    s16 width;            /**< Destination width, or negative to use the source width. */
    s16 height;           /**< Destination height, or negative to use the source height. */
    s16 source_x;         /**< Horizontal texture origin. */
    s16 source_y;         /**< Vertical texture origin. */
    s16 source_width;     /**< Width of the source texture rectangle. */
    s16 source_height;    /**< Height of the source texture rectangle. */
    s16 red;              /**< Red colour component. */
    s16 green;            /**< Green colour component. */
    s16 blue;             /**< Blue colour component. */
    s16 alpha;            /**< Alpha colour component. */
    s16 rotation_x;       /**< Horizontal centre used for rotation. */
    s16 rotation_y;       /**< Vertical centre used for rotation. */
    float rotation;       /**< Sprite rotation angle. */
    float move_x;         /**< Horizontal displacement applied per frame. */
    float move_y;         /**< Vertical displacement applied per frame. */
    u8 unk_34[4];
    CTexture texture;     /**< Texture rendered by this sprite. */
};

STATIC_ASSERT(sizeof(ED_SPRITE) == 0x88);

/**
 * Returns the greatest cursor height supplied by a region containing the position.
 *
 * @mangled GetMaxHeightCursor__FPf
 * @address 0x189A10
 * @size 0x16C
 */
float GetMaxHeightCursor(float *position);

/**
 * Returns one of the editor event's script-controlled sprite slots.
 *
 * @mangled GetSprite__Fi
 * @address 0x18A150
 * @size 0x40
 */
ED_SPRITE *GetSprite(int index);

/**
 * Resets one editor event sprite to its default colour and rectangle state.
 *
 * @mangled InitSprite__FP9ED_SPRITE
 * @address 0x18A190
 * @size 0x5C
 */
void InitSprite(ED_SPRITE *sprite);

/**
 * Returns one of the object-animation slots available to editor event scripts.
 *
 * @mangled GetObjAnime__Fi
 * @address 0x18A1F0
 * @size 0x40
 */
OBJ_ANIME_SEQ *GetObjAnime(int index);

/**
 * Releases one object-animation slot or every slot when given a negative index.
 *
 * @mangled ClearObjAnime__Fi
 * @address 0x18A230
 * @size 0x7C
 */
void ClearObjAnime(int index);

/**
 * Toggles whether advancement of the current editor event is paused.
 *
 * @mangled EdEventPause__Fv
 * @address 0x18A2B0
 * @size 0x1C
 */
void EdEventPause();

/**
 * Writes one integer scratch flag exposed to editor event scripts.
 *
 * @mangled SetWorkFlag__Fii
 * @address 0x18A2D0
 * @size 0x40
 */
int SetWorkFlag(int index, int value);

/**
 * Reads one integer scratch flag exposed to editor event scripts.
 *
 * @mangled GetWorkFlag__Fi
 * @address 0x18A310
 * @size 0x40
 */
int GetWorkFlag(int index);

/**
 * Applies one editable part definition's object visibility to its map part.
 *
 * @mangled EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi
 * @address 0x1850A0
 * @size 0x204
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

/**
 * Scales and clamps the shadow-light component used by the editor.
 *
 * @mangled EdLimitShadowLight__FPA4_ff
 * @address 0x187F50
 * @size 0x34
 */
void EdLimitShadowLight(float light[][4], float scale);

/**
 * Tests whether an editor time falls inside a possibly wrapping interval.
 *
 * @mangled EdCheckTime__Ffff
 * @address 0x187DD0
 * @size 0x84
 */
int EdCheckTime(float time, float start, float end);

/**
 * Classifies an editor time into one of four daily lighting periods.
 *
 * @mangled EdGetTime__Ff
 * @address 0x187E60
 * @size 0xEC
 */
int EdGetTime(float time);

/**
 * Provides the retail no-op memory diagnostic hook.
 *
 * @mangled PrintMemory__Fv
 * @address 0x18A420
 * @size 0x10
 */
void PrintMemory();

/**
 * Tests whether an editable part has usable placement information.
 *
 * @mangled CheckPartsInfo__FP14EDITPARTS_INFO
 * @address 0x199F90
 * @size 0x40
 */
int CheckPartsInfo(EDITPARTS_INFO *info);

/**
 * Implements the event interpreter's always-successful test opcode.
 *
 * @mangled _TEST__FP12RS_STACKDATAi
 * @address 0x18B830
 * @size 0xC
 */
int _TEST(RS_STACKDATA *stack, int argument_count);
