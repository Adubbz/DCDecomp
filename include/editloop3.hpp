#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"
#include "texture.hpp"

class CCharacter;
class CFrame;
class CMapParts;
class CNPCharacter;
struct ED_EVENT_POINT;
struct EDITPARTS_INFO;
struct EPARTS_FUNC_DATA;
struct RS_STACKDATA;
struct OBJ_ANIME_SEQ;
struct VILLAGER_INFO;
class CEditGround;

/**
 * Tests whether one villager is currently permitted to appear.
 *
 * @mangled EdCheckVillager__FiP13VILLAGER_INFOP11CEditGround
 * @address 0x187E50
 * @size 0x184
 */
int EdCheckVillager(int index, VILLAGER_INFO *villager, CEditGround *ground);

/**
 * Collects every object or frame controlled by one event-script object slot.
 */
struct OBJ_HANDLE {
    CMapParts *map_parts;   /**< Map part controlled directly by the slot. */
    CCharacter *character;  /**< Character controlled directly by the slot. */
    CFrame *frames[12];     /**< Model frames controlled when no complete object is retained. */
};

STATIC_ASSERT(sizeof(OBJ_HANDLE) == 0x38);

/**
 * Identifies the abstract confirm and cancel bits exposed to editor scripts.
 */
enum ED_PAD_BUTTON {
    ED_PAD_CONFIRM = 0x20,
    ED_PAD_CANCEL = 0x40,
};

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
 * Associates an object handle with a map part or its named model frames.
 *
 * @mangled SetObjHandle__FiP9CMapPartsPc
 * @address 0x18A470
 * @size 0x1C4
 */
int SetObjHandle(int index, CMapParts *map_parts, char *frame_name);

/**
 * Associates an object handle with a character or its named model frames.
 *
 * @mangled SetObjHandle__FiP10CCharacterPc
 * @address 0x18A640
 * @size 0x13C
 */
int SetObjHandle(int index, CCharacter *character, char *frame_name);

/**
 * Associates an object handle with one frame.
 *
 * @mangled SetObjHandle__FiP6CFrame
 * @address 0x18A780
 * @size 0x68
 */
int SetObjHandle(int index, CFrame *frame);

/**
 * Enables or disables drawing of everything held by an object handle.
 *
 * @mangled obj_draw__FP10OBJ_HANDLEi
 * @address 0x18A7F0
 * @size 0x80
 */
void obj_draw(OBJ_HANDLE *handle, int draw);

/**
 * Moves everything held by an object handle to a position.
 *
 * @mangled set_obj_pos__FP10OBJ_HANDLEPf
 * @address 0x18A870
 * @size 0xBC
 */
void set_obj_pos(OBJ_HANDLE *handle, float *position);

/**
 * Reads the local position of the first object or frame in a handle.
 *
 * @mangled get_obj_pos__FP10OBJ_HANDLEPf
 * @address 0x18A930
 * @size 0xA8
 */
void get_obj_pos(OBJ_HANDLE *handle, float *out_position);

/**
 * Reads the world position of the first object or frame in a handle.
 *
 * @mangled get_obj_world_pos__FP10OBJ_HANDLEPf
 * @address 0x18A9E0
 * @size 0xBC
 */
void get_obj_world_pos(OBJ_HANDLE *handle, float *out_position);

/**
 * Rotates everything held by an object handle.
 *
 * @mangled set_obj_rot__FP10OBJ_HANDLEPf
 * @address 0x18AAA0
 * @size 0xF8
 */
void set_obj_rot(OBJ_HANDLE *handle, float *rotation);

/**
 * Reads the rotation of the first object or frame in a handle.
 *
 * @mangled get_obj_rot__FP10OBJ_HANDLEPf
 * @address 0x18ABA0
 * @size 0xAC
 */
void get_obj_rot(OBJ_HANDLE *handle, float *out_rotation);

/**
 * Scales everything held by an object handle.
 *
 * @mangled set_obj_scale__FP10OBJ_HANDLEPf
 * @address 0x18AC50
 * @size 0xBC
 */
void set_obj_scale(OBJ_HANDLE *handle, float *scale);

/**
 * Reads the scale of the first object or frame in a handle.
 *
 * @mangled get_obj_scale__FP10OBJ_HANDLEPf
 * @address 0x18AD10
 * @size 0xB8
 */
void get_obj_scale(OBJ_HANDLE *handle, float *out_scale);

/**
 * Configures an object-animation slot to animate the frames in an object handle.
 *
 * @mangled init_obj_anime__FiiiiPfPfPf
 * @address 0x18ADD0
 * @size 0xC8
 */
int init_obj_anime(int anime_index, int handle_index, int type, int number,
                   float *offset, float *range, float *speed);

/**
 * Makes every frame in one object handle follow the first frame in another.
 *
 * @mangled sync_obj_obj__FP10OBJ_HANDLEP10OBJ_HANDLE
 * @address 0x18AEA0
 * @size 0xB8
 */
void sync_obj_obj(OBJ_HANDLE *source, OBJ_HANDLE *targets);

/**
 * Removes frame references from every frame in an object handle.
 *
 * @mangled release_obj_obj__FP10OBJ_HANDLE
 * @address 0x18AF60
 * @size 0x64
 */
void release_obj_obj(OBJ_HANDLE *handle);

/**
 * Applies drawing attributes to the character or frames in an object handle.
 *
 * @mangled set_attr_obj__FP10OBJ_HANDLER10CFrameAttrii
 * @address 0x18AFD0
 * @size 0xBC
 */
void set_attr_obj(OBJ_HANDLE *handle, CFrameAttr &attr, int children, int mask);

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

/**
 * Exchanges the abstract confirm and cancel bits in a controller mask.
 *
 * @mangled exch_ok_cancel__Fi
 * @address 0x18B840
 * @size 0x34
 */
int exch_ok_cancel(int buttons);

/**
 * Writes the currently held controller buttons to an event-script result slot.
 *
 * @mangled _GET_PADON__FP12RS_STACKDATAi
 * @address 0x18B880
 * @size 0x68
 */
int _GET_PADON(RS_STACKDATA *stack, int argument_count);

/**
 * Writes the newly pressed controller buttons to an event-script result slot.
 *
 * @mangled _GET_PADDOWN__FP12RS_STACKDATAi
 * @address 0x18B8F0
 * @size 0x68
 */
int _GET_PADDOWN(RS_STACKDATA *stack, int argument_count);

/**
 * Writes the newly released controller buttons to an event-script result slot.
 *
 * @mangled _GET_PADUP__FP12RS_STACKDATAi
 * @address 0x18B960
 * @size 0x68
 */
int _GET_PADUP(RS_STACKDATA *stack, int argument_count);

/**
 * Writes a pseudorandom integer to an event-script result slot.
 *
 * @mangled _GET_RANDOM__FP12RS_STACKDATAi
 * @address 0x18BAC0
 * @size 0x54
 */
int _GET_RANDOM(RS_STACKDATA *stack, int argument_count);

/**
 * Sets the result code returned by the current editor event.
 *
 * @mangled _SET_RETURN_CODE__FP12RS_STACKDATAi
 * @address 0x18BB20
 * @size 0x2C
 */
int _SET_RETURN_CODE(RS_STACKDATA *stack, int argument_count);

/**
 * Selects the event that follows the current editor event.
 *
 * @mangled _NEXT_EVENT__FP12RS_STACKDATAi
 * @address 0x18BB50
 * @size 0x2C
 */
int _NEXT_EVENT(RS_STACKDATA *stack, int argument_count);

/**
 * Reinitializes the shared editor-event parameters.
 *
 * @mangled _INITIALIZE__FP12RS_STACKDATAi
 * @address 0x18BD70
 * @size 0x24
 */
int _INITIALIZE(RS_STACKDATA *stack, int argument_count);

/**
 * Stores an exit status in the current editor event.
 *
 * @mangled _EXIT_CODE__FP12RS_STACKDATAi
 * @address 0x18BDA0
 * @size 0x2C
 */
int _EXIT_CODE(RS_STACKDATA *stack, int argument_count);

/**
 * Requests the editor event's attention marker.
 *
 * @mangled _DRAW_EXCLAMATION_MARK__FP12RS_STACKDATAi
 * @address 0x18BDD0
 * @size 0x14
 */
int _DRAW_EXCLAMATION_MARK(RS_STACKDATA *stack, int argument_count);

/**
 * Clears all editor-event execution state and reports successful dispatch.
 *
 * @mangled _FINISH__FP12RS_STACKDATAi
 * @address 0x18BFB0
 * @size 0x24
 */
int _FINISH(RS_STACKDATA *stack, int argument_count);

/**
 * Clears every active editor event and its associated presentation state.
 *
 * @mangled EdEventAllClear__Fv
 * @address 0x197810
 * @size 0x234
 */
void EdEventAllClear();

/**
 * Returns the villager involved in the active conversation.
 *
 * @mangled EdNowTalkChara__Fv
 * @address 0x199070
 * @size 0xC
 */
CNPCharacter *EdNowTalkChara();

/**
 * Returns the metadata identifier of the active conversation character.
 *
 * @mangled EdNowTalkCharaInfoID__Fv
 * @address 0x199080
 * @size 0xC
 */
int EdNowTalkCharaInfoID();

/**
 * Builds the model and texture file paths an editor event loads one item from.
 *
 * @mangled EdGetItemFile__FiPcPc
 * @address 0x173350
 * @size 0x30
 */
void EdGetItemFile(int item_no, char *model_path, char *texture_path);

/**
 * Tests whether a villager can appear under the current selection and part availability.
 *
 * @mangled EdCheckVillagerIn__FiP13VILLAGER_INFO
 * @address 0x185AF0
 * @size 0x158
 */
int EdCheckVillagerIn(int index, VILLAGER_INFO *villager);

/**
 * Turns a character towards a world position, a limited step each call.
 *
 * @mangled turn_chara__FP10CCharacterPff
 * @address 0x18B0E0
 * @size 0xC4
 */
void turn_chara(CCharacter *character, float *position, float speed);

/**
 * Resets editor-event parameters, action sequences, sprites and object handles.
 *
 * @mangled EdInitEventParamSimple__Fv
 * @address 0x196F00
 * @size 0x31C
 */
int EdInitEventParamSimple();

/**
 * Splits the space-separated object names one editable part element carries
 * into the supplied buffers.
 *
 * @mangled GetElementObjName__FP14EDITPARTS_INFOPPcii
 * @address 0x19B680
 * @size 0x104
 */
void GetElementObjName(EDITPARTS_INFO *info, char **names, int element, int index);

/**
 * Reads one villager's model and motion out of an already loaded archive and
 * gives them to the villager character.
 *
 * @mangled EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_
 * @address 0x1860C0
 * @size 0x1CC
 */
int EdLoadVillager(u_int *pack, char *name, CNPCharacter *villager, CDataAlloc2<1> *arena);

/**
 * Reads one villager's archive from the editor data directory and loads the
 * villager out of it.
 *
 * @mangled EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_
 * @address 0x186290
 * @size 0xC8
 */
int EdLoadVillager(char *name, CNPCharacter *villager, CDataAlloc2<1> *arena);

/**
 * Starts one editor event: clears the event parameters, takes the light and
 * ambient colour the map is drawn with, loads the event script and runs it.
 *
 * @mangled EdEventInit__FiP14CDataAlloc2_1_Pc
 * @address 0x1973B0
 * @size 0x2E8
 */
int EdEventInit(int event_no, CDataAlloc2<1> *arena, char *name);

/**
 * Copies the editor's current resource directory into a caller buffer.
 *
 * @mangled GetEditDataDir__FPc
 * @address 0x1777D0
 * @size 0x28
 */
void GetEditDataDir(char *name);
