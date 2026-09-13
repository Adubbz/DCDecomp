#pragma once

#include "common.h"
#include "texture.hpp"

class CCharacter;
class CCamera;
class C3DSprite;
class CFrame;
class CMapParts;
class CNPCharacter;
struct ED_EVENT_POINT;
struct EDITPARTS_INFO;
class CNPCharacter;
template <int> class CDataAlloc2;
struct EPARTS_FUNC_DATA;
struct RS_STACKDATA;
struct OBJ_ANIME_SEQ;
struct VILLAGER_INFO;
class CEditGround;

/**
 * Shares the active editor map objects with event-point and villager helpers.
 */
struct ED_EXCHANGE_INFO {
    CCharacter *player;         /**< Player character used for villager proximity checks. */
    u8 unk_04[0x8];             /**< Editor-loop state not consumed by this translation unit. */
    CEditGround *ground;        /**< Editable ground used to resolve part-relative event points. */
    CFrame *event_marker;       /**< Frame drawn at system event points. */
    C3DSprite *system_effect;   /**< Sprite drawn at special event points. */
    CCamera *camera;            /**< Camera used to prioritize nearby villagers for drawing. */
};

STATIC_ASSERT(sizeof(ED_EXCHANGE_INFO) == 0x1C);

/** Shared editor objects used by event-point and villager processing. */
extern ED_EXCHANGE_INFO EdExchangeInfo;

/**
 * Loads a villager from an already resident character pack.
 *
 * @mangled EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_
 * @address 0x1860C0
 * @size 0x1CC
 */
int EdLoadVillager(u_int *pack, char *name, CNPCharacter *villager, CDataAlloc2<1> *arena);

/**
 * Reads and loads the named villager character pack.
 *
 * @mangled EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_
 * @address 0x186290
 * @size 0xC8
 */
int EdLoadVillager(char *name, CNPCharacter *villager, CDataAlloc2<1> *arena);

/**
 * Places the initialized event villagers at their selected map positions.
 *
 * @mangled EdInitVilagerPosition__FP12CNPCharacterP13VILLAGER_INFOP11CEditGroundPA4_f
 * @address 0x186510
 * @size 0x7E0
 */
void EdInitVilagerPosition(CNPCharacter *villagers, VILLAGER_INFO *info,
                           CEditGround *ground, float (*transform)[4]);

/**
 * Advances and positions the selected villagers on the editable town map.
 *
 * @mangled EdMoveVillager__FP13VILLAGER_INFO
 * @address 0x186EF0
 * @size 0x5B4
 */
void EdMoveVillager(VILLAGER_INFO *villagers);

/**
 * Advances the selected villagers while displaying an editor sub-map.
 *
 * @mangled EdMoveVillagerSubMap__FP13VILLAGER_INFO
 * @address 0x1874B0
 * @size 0x258
 */
void EdMoveVillagerSubMap(VILLAGER_INFO *villagers);

/**
 * Finds the nearest event point that the character position and facing satisfy.
 *
 * @mangled EdGetEvent__FP14ED_EVENT_POINTiP14ED_EVENT_PARAMPfPff
 * @address 0x184350
 * @size 0x400
 */
int EdGetEvent(ED_EVENT_POINT *points, int count, ED_EVENT_PARAM *param, float *position,
               float *rotation, float time);

/**
 * Adds the collision polygons surrounding active system event points.
 *
 * @mangled EdEventPointCpPoly__FPfP14ED_EVENT_POINTiP6CCPolyf
 * @address 0x184A50
 * @size 0x260
 */
int EdEventPointCpPoly(float *position, ED_EVENT_POINT *points, int count, CCPoly *polygons,
                       float time);

/**
 * Starts loading the editor resources belonging to a named destination map.
 *
 * @mangled EdMapJump__FiPc
 * @address 0x184EB0
 * @size 0x1F0
 */
void EdMapJump(int kind, char *name);

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
 * Toggles whether advancement of the current editor event is paused.
 *
 * @mangled EdEventPause__Fv
 * @address 0x18A2B0
 * @size 0x1C
 */
void EdEventPause();

/**
 * Applies one editable part definition's object visibility to its map part.
 *
 * @mangled EdPartsObjectOnOff__FP9CMapPartsP14EDITPARTS_INFOi
 * @address 0x1850A0
 * @size 0x204
 */
void EdPartsObjectOnOff(CMapParts *, EDITPARTS_INFO *, int);

/**
 * Expands the object names attached to one editable-parts definition.
 *
 * @mangled GetElementObjName__FP14EDITPARTS_INFOPPcii
 * @address 0x19B680
 * @size 0x104
 */
void GetElementObjName(EDITPARTS_INFO *info, char **names, int element, int mode);

/**
 * Loads one villager from an already resident character pack.
 *
 * @mangled EdLoadVillager__FPUiPcP12CNPCharacterP14CDataAlloc2_1_
 * @address 0x1860C0
 * @size 0x1CC
 */
int EdLoadVillager(unsigned int *pack, char *name, CNPCharacter *villager,
                   CDataAlloc2<1> *arena);

/**
 * Loads one villager's character pack from the editor data directory.
 *
 * @mangled EdLoadVillager__FPcP12CNPCharacterP14CDataAlloc2_1_
 * @address 0x186290
 * @size 0xC8
 */
int EdLoadVillager(char *name, CNPCharacter *villager, CDataAlloc2<1> *arena);

/**
 * Installs the common and map-specific event bytecode streams.
 *
 * @mangled EdSetEventScript__FPcPcP14CDataAlloc2_1_
 * @address 0x196CF0
 * @size 0x208
 */
int EdSetEventScript(char *common_script, char *map_script, CDataAlloc2<1> *allocator);

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
 * Clears every active editor event and its associated presentation state.
 *
 * @mangled EdEventAllClear__Fv
 * @address 0x197810
 * @size 0x234
 */
int EdEventAllClear();

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
 * Reports whether an editable part has been placed and still has work left.
 *
 * @mangled CheckPartsInfo__FP14EDITPARTS_INFO
 * @address 0x199F90
 * @size 0x3C
 */
int CheckPartsInfo(EDITPARTS_INFO *info);
