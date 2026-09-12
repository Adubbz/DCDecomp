#pragma once

/**
 * @file
 * Declares the shared editor helpers implemented by retail editetc.cpp.
 */

class CCamera;
class CCharacter;
class CDebugFont;
class CEditGround;
class CFrameVu1;
class CMapParts;
class CTexture;
struct EDIT_EFFECT_INFO;
struct EPARTS_FUNC_DATA;
class CCharacter;
class CCamera;
class CEditGround;
struct ED_EVENT_POINT;
class CCameraFollow;

/**
 * Describes the event the player is standing in, and where it puts them.
 */
struct ED_EVENT_PARAM {
    int kind;                 /**< What kind of event the point is; 1 for a door. */
    int entrance;             /**< Entrance of the map the door leads to. */
    u8 unk_08[0x8];
    sceVu0FVECTOR position;   /**< Where the player stands while the door plays. */
    sceVu0FVECTOR camera_pos; /**< Where the camera stands while the door plays. */
    sceVu0FVECTOR rotation;   /**< Which way the player faces while it plays. */
    u8 unk_40[0x10];
    ED_EVENT_POINT *point;    /**< Event point the parameters were read from. */
    u8 unk_54[0xc];
};

/**
 * What the editor hands to EdMoveChara, and what it gets back.
 */
struct ED_MOVE_CHARA_INFO {
    float time;              /**< Time of day the step happens at. */
    CCharacter *chara;       /**< Character being moved. */
    CCamera *camera;         /**< Camera the movement is relative to. */
    CCameraFollow *follow;   /**< Camera that follows the character. */
    int key_lock;            /**< Whether the pad is ignored this step. */
    u8 unk_14[0x4];
    int unk_18;
    CEditGround *ground;     /**< Ground the character walks on. */
    u8 unk_20[0x8];
    int event_ready;         /**< Set where the character stands in an event. */
    u8 unk_2c[0x4];
    ED_EVENT_PARAM param;    /**< The event the character stands in. */
    ED_EVENT_POINT *points;  /**< Event points of the map. */
    int point_count;         /**< How many of them there are. */
    int event_no;            /**< Map event the step asks to run. */
    int system_event_no;     /**< System event the step asks to run. */
    u8 unk_a0[0x4];
    int in_event;            /**< Whether an event already has the character. */
    float motion_previous;   /**< Motion time at the previous step. */
    float motion_current;    /**< Motion time at this one. */
};

STATIC_ASSERT(sizeof(ED_EVENT_PARAM) == 0x60);
STATIC_ASSERT(sizeof(ED_MOVE_CHARA_INFO) == 0xb0);
struct ED_EVENT_POINT;
struct EDIT_MAP_INFO;
/**
 * Stores one script-defined timer that gates a map object.
 */
struct EDIT_OBJECT_TIMER {
    u8 unk_00[0x10];
    u8 active; /**< Whether the timer takes part in map processing. */
    u8 unk_11[0xf];
};

STATIC_ASSERT(sizeof(EDIT_OBJECT_TIMER) == 0x20);
struct EPARTS_INFO_HEADER;
struct INIT_PARTSINFO;
struct MAP_PARTS_INFO;
struct OBJ_ANIME_SEQ;
struct VILLAGER_INFO;
class CCameraFollow;
class CMapParts;

/** Names the sound effects the editor plays for itself. */
enum ED_SOUND_ID {
    ED_SOUND_NONE,
    ED_SOUND_COUNT = 15,
};

class CFrame;
class CFrameVu1;
class CCharacter;
class CNPCharacter;
class ClsMes;

/**
 * Names what the Georama editor is doing; the dungeon reads a few of its
 * fields on the way in and out.
 */
struct ED_EVENT_INFO {
    u8 unk_000[0x30];
    s32 map_jump_bgm_stop; /**< Whether a map jump stops the current background music. */
    s32 fukidashi;
    s32 sound_off_count; /**< Number of sound channels suppressed by the event. */
    float projection; /**< Projection distance used while rendering an event. */
    CCameraFollow *camera; /**< Camera controller used by the active event. */
    s32 reset_camera_angle; /**< Camera-angle reset mode requested by the event. */
    float reset_camera_yaw; /**< Yaw offset used by the requested camera reset. */
    CCharacter *main_character; /**< Player character controlled by the active event. */
    s32 unk_050;
    u8 unk_054[0x4];
    CNPCharacter *npcs; /**< Contiguous array of event NPC characters. */
    s32 player_collision; /**< Whether ground collision is applied to the player during the event. */
    s32 player_draw; /**< Whether the player model is drawn during the event. */
    s32 player_shadow_draw; /**< Whether the player's shadow is drawn during the event. */
    s32 player_foot_sound; /**< Footstep mode applied to the player during the event. */
    s32 player_stop; /**< Whether the player's event motion is held. */
    u8 unk_070[0x4];
    s32 npc_collision[16]; /**< Ground-collision mode assigned to each event NPC. */
    s32 npc_draw[16]; /**< Whether each event NPC model is drawn. */
    s32 npc_shadow_draw[16]; /**< Whether each event NPC shadow is drawn. */
    s32 npc_foot_sound[16]; /**< Footstep mode assigned to each event NPC. */
    s32 npc_stop[16]; /**< Whether each event NPC's motion is held. */
    s32 npc_draw_before[17]; /**< Draw-order group assigned to each event character. */
    s32 npc_count; /**< Number of valid entries in the event NPC array. */
    VILLAGER_INFO *villagers; /**< Metadata array for the event villagers. */
    ClsMes *messages[8]; /**< Message windows owned by the active event. */
    float current_time; /**< Current editor time used by time-of-day opcodes. */
    u8 unk_224[0xC];
    sceVu0FVECTOR wind; /**< Wind vector applied while the event is active. */
    CEditGround *edit_ground; /**< Ground and placed-part database used by the active event. */
    s32 fixed_parts_count; /**< Number of fixed map parts available to object-handle opcodes. */
    CMapParts *fixed_parts; /**< Fixed map parts available to object-handle opcodes. */
    s32 edit_parts_count; /**< Number of placed map parts available to object-handle opcodes. */
    CMapParts *edit_parts; /**< Placed map parts available to object-handle opcodes. */
    s32 interior_parts_count; /**< Number of interior parts available to object-handle opcodes. */
    CMapParts *interior_parts; /**< Interior parts available to object-handle opcodes. */
    CFrameVu1 *item_frame[1]; /**< VU1 frame used for the single event-held item. */
    s32 talk_npc_id; /**< Identifier of the NPC currently engaged in conversation. */
    s32 talk_messages[16]; /**< Message identifiers assigned to the current conversation sequence. */
    s32 talk_select_message; /**< Message selected after a conversation choice. */
    s32 talk_select_prompt; /**< Message containing the current conversation choices. */
    s32 unk_2ac;
    char unk_2b0[0x20];
    s32 unk_2d0;
    s32 outside_map_no; /**< Map requested when an event exits to the outside. */
    s32 draw_exclamation_mark; /**< Whether the event requests the attention marker. */
    s32 suppress_background; /**< Whether event rendering suppresses the scene background. */
    s32 suppress_shadows; /**< Whether event rendering suppresses character shadows. */
    u8 unk_2e4[0xC];
    float background_color[3]; /**< RGB override for the event background. */
    u8 unk_2fc[4];
    s32 screen_filter; /**< Whether a full-screen event colour filter is active. */
    u8 unk_304[0xC];
    sceVu0FVECTOR screen_filter_color; /**< RGBA colour of the event screen filter. */
    s32 lighting_override; /**< Whether script-provided scene lighting replaces the map lighting. */
    u8 unk_324[0xC];
    sceVu0FMATRIX light_direction; /**< Direction vectors for the four event point lights. */
    sceVu0FMATRIX light_color; /**< RGB intensities for the four event point lights. */
    sceVu0FVECTOR ambient_color; /**< RGBA ambient-light colour for the event scene. */
    sceVu0FVECTOR vector_arguments[4]; /**< Vector arguments supplied to the active event. */
    s32 integer_arguments[8]; /**< Integer arguments supplied to the active event. */
    s32 flag_arguments[8]; /**< Flag-like arguments supplied to the active event. */
    s32 fadeout_event_no; /**< Event started after the current fade-out completes. */
    s32 next_event; /**< Event number requested by the NEXT_EVENT opcode. */
    s32 return_code; /**< Result code passed from an editor event back to the game loop. */
    s32 exit_code; /**< Exit status supplied by the event script. */
};

STATIC_ASSERT(sizeof(ED_EVENT_INFO) == 0x450);

/** What the Georama editor is doing now. */
extern "C" ED_EVENT_INFO EdEventInfo;

/**
 * Steps the editor's event system, and says what the event asks the loop to do.
 *
 * @mangled EdEventMode__FP13CCameraFollowi
 * @address 0x197AD0
 * @size 0xCFC
 */
int EdEventMode(CCameraFollow *camera, int kind);

/**
 * Puts the camera back on the parameters the editor uses outside events.
 *
 * @mangled EdInitCameraParam__FP13CCameraFollow
 * @address 0x169F80
 * @size 0x4C
 */
void EdInitCameraParam(CCameraFollow *camera);

/**
 * Starts the editor's ambient sound at the requested volume.
 *
 * @mangled EdAmbientPlay__Ff
 * @address 0x1715D0
 * @size 0x40
 */
void EdAmbientPlay(float volume);

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
 * Enables or disables the editor debug controls.
 *
 * @mangled EdDDebug__Fi
 * @address 0x170250
 * @size 0xC
 */
void EdDDebug(int on);

/**
 * Selects the font used by the editor debug overlay.
 *
 * @mangled EdDSetFont__FP10CDebugFont
 * @address 0x170260
 * @size 0xC
 */
void EdDSetFont(CDebugFont *font);

/**
 * Draws text queued by the editor debug overlay.
 *
 * @mangled EdDDrawFont__Fv
 * @address 0x170270
 * @size 0xB0
 */
void EdDDrawFont();

/**
 * Updates the editor debug overlay and free-movement controls.
 *
 * @mangled EdDCheck__Fv
 * @address 0x170320
 * @size 0x2C
 */
void EdDCheck();

/**
 * Writes the editor debug text buffer to its output file.
 *
 * @mangled EdOutPutFile__Fv
 * @address 0x170350
 * @size 0x7C
 */
void EdOutPutFile();

/**
 * Queues a labelled vector in the editor debug overlay.
 *
 * @mangled EdDPrintVector__FPcPf
 * @address 0x170450
 * @size 0xB8
 */
void EdDPrintVector(char *name, float *vector);

/**
 * Queues a line of text in the editor debug overlay.
 *
 * @mangled EdDPrint__FPc
 * @address 0x170510
 * @size 0x3C
 */
void EdDPrint(char *text);

/**
 * Moves the editor camera from debug-pad input.
 *
 * @mangled EdDMoveCamera__FPfPf
 * @address 0x170550
 * @size 0x378
 */
void EdDMoveCamera(float *position, float *reference);

/**
 * Moves the editor camera reference point from debug-pad input.
 *
 * @mangled EdDMoveCameraRef__FPfPf
 * @address 0x1708D0
 * @size 0x294
 */
void EdDMoveCameraRef(float *position, float *reference);

/**
 * Moves an editor character using the debug camera controls.
 *
 * @mangled EdDMoveChara__FP10CCharacterP7CCamera
 * @address 0x170B70
 * @size 0x428
 */
void EdDMoveChara(CCharacter *character, CCamera *camera);

/**
 * Resets the positional sound-source slots.
 *
 * @mangled EdInitSoundSrc__Fv
 * @address 0x171800
 * @size 0x64
 */
void EdInitSoundSrc();

/**
 * Starts the positional sound sources prepared for the current frame.
 *
 * @mangled EdPlaySoundSrc__Fv
 * @address 0x171870
 * @size 0x260
 */
void EdPlaySoundSrc();

/**
 * Stops every active positional sound source.
 *
 * @mangled EdStopSoundSrc__Fv
 * @address 0x171AD0
 * @size 0x94
 */
void EdStopSoundSrc();

/**
 * Updates positional sound volume and panning for visible map parts.
 *
 * @mangled EdSetSoundSrcVol__FfPP9CMapPartsiPfPf
 * @address 0x171D20
 * @size 0x3E0
 */
void EdSetSoundSrcVol(float time, CMapParts **parts, int count, float *camera_position,
                      float *camera_reference);

/**
 * Selects the default depth-of-field parameters for a level.
 *
 * @mangled EdSetDOFLevel__Fi
 * @address 0x172210
 * @size 0x8C
 */
void EdSetDOFLevel(int level);

/**
 * Copies a map's depth-of-field parameters into editor state.
 *
 * @mangled EdSetDOF__FP19DEPTH_OF_FIELD_INFO
 * @address 0x1722A0
 * @size 0x50
 */
void EdSetDOF(DEPTH_OF_FIELD_INFO *info);

/**
 * Draws depth of field using either the stored or requested level.
 *
 * @mangled EdDrawDOF__Fi
 * @address 0x1722F0
 * @size 0x58
 */
void EdDrawDOF(int level);

/**
 * Resets the editor lightning effect.
 *
 * @mangled EdInitThunderEffect__Fv
 * @address 0x172350
 * @size 0x18
 */
void EdInitThunderEffect();

/**
 * Steps lightning for a map and its editable ground model.
 *
 * @mangled EdThunderEffect__FiP11CEditGround
 * @address 0x172370
 * @size 0x274
 */
void EdThunderEffect(int map, CEditGround *ground);

/**
 * Starts effects attached to the supplied map parts.
 *
 * @mangled EnterPartsEffect__FP9CMapPartsP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFOi
 * @address 0x172AC0
 * @size 0xC4
 */
void EnterPartsEffect(CMapParts *parts, EPARTS_FUNC_DATA *functions, EDIT_EFFECT_INFO *effects,
                      int count);

/**
 * Clears the editor's pending used-item selection.
 *
 * @mangled EdUseItemInit__Fv
 * @address 0x172BD0
 * @size 0x24
 */
void EdUseItemInit();

/**
 * Supplies the item list available to editor menus.
 *
 * @mangled EdSetUseItem__FPi
 * @address 0x172C00
 * @size 0x80
 */
void EdSetUseItem(int *items);

/**
 * Returns the item selected by the editor menu.
 *
 * @mangled EdGetUseItem__Fv
 * @address 0x172C80
 * @size 0x24
 */
int EdGetUseItem();

/**
 * Selects the character whose name the editor registers.
 *
 * @mangled EdSetNameRegChara__Fi
 * @address 0x172CB0
 * @size 0xC
 */
void EdSetNameRegChara(int character);

/**
 * Selects the shop opened by the editor menu.
 *
 * @mangled EdSetShopNo__Fi
 * @address 0x172CC0
 * @size 0xC
 */
void EdSetShopNo(int shop);

/**
 * Starts an editor menu in the requested mode.
 *
 * @mangled EdInitMenu__Fi
 * @address 0x172CD0
 * @size 0x60
 */
int EdInitMenu(int mode);

/**
 * Completes editor-menu initialization once its resources are ready.
 *
 * @mangled EdInitModeFinish__FP7CCameraP8CTexture
 * @address 0x172D30
 * @size 0x200
 */
int EdInitModeFinish(CCamera *camera, CTexture *texture);

/**
 * Closes the active editor menu.
 *
 * @mangled EdExitMenu__Fv
 * @address 0x172F30
 * @size 0x44
 */
void EdExitMenu();

/**
 * Steps the active editor-menu mode.
 *
 * @mangled EdMenuMode__Fv
 * @address 0x172F80
 * @size 0x114
 */
int EdMenuMode();

/**
 * Adds an item awarded by an editor event.
 *
 * @mangled EdGetItem__Fiii
 * @address 0x1730A0
 * @size 0xD4
 */
void EdGetItem(int item, int count, int attachment);

/**
 * Expands the inventory limit used by editor rewards.
 *
 * @mangled EdAddMaxItem__Fi
 * @address 0x173180
 * @size 0x84
 */
int EdAddMaxItem(int amount);

/**
 * Returns whether the preceding editor reward exceeded inventory capacity.
 *
 * @mangled EdCheckItemOver__Fv
 * @address 0x173210
 * @size 0x28
 */
int EdCheckItemOver();

/**
 * Clears the editor reward's inventory-overflow flag.
 *
 * @mangled EdClearItemOverFlag__Fv
 * @address 0x173240
 * @size 0x28
 */
void EdClearItemOverFlag();

/**
 * Returns whether the inventory contains the requested item.
 *
 * @mangled EdCheckItem__Fi
 * @address 0x173270
 * @size 0x6C
 */
int EdCheckItem(int item);

/**
 * Sets the number of event sound channels which remain disabled.
 *
 * @mangled EdSetSoundOffCount__Fi
 * @address 0x177760
 * @size 0x28
 */
void EdSetSoundOffCount(int count);

/**
 * Returns whether the requested item can be awarded.
 *
 * @mangled EdCheckGetItem__Fi
 * @address 0x1732E0
 * @size 0x6C
 */
int EdCheckGetItem(int item);

/**
 * Configures the editor's system-message prompt.
 *
 * @mangled EdSetSystemMes__FiiiiPii
 * @address 0x1733E0
 * @size 0xB4
 */
void EdSetSystemMes(int number, int count, int position, int input_key, int *arguments,
                    int argument_count);

/**
 * Configures the editor's contextual help message.
 *
 * @mangled EdSetHelpMes__FiiiPii
 * @address 0x1734A0
 * @size 0x134
 */
void EdSetHelpMes(int number, int count, int position, int *arguments, int argument_count);

/**
 * Clears the active editor system message.
 *
 * @mangled EdClearSystemMes__Fv
 * @address 0x1735E0
 * @size 0x60
 */
void EdClearSystemMes();

/**
 * Returns whether the active editor system message has completed.
 *
 * @mangled EdSystemMesCheck__Fv
 * @address 0x173640
 * @size 0x20
 */
int EdSystemMesCheck();

/**
 * Advances the active editor system message.
 *
 * @mangled EdSystemMesStep__Fv
 * @address 0x173660
 * @size 0xE8
 */
void EdSystemMesStep();

/**
 * Draws the active editor system message.
 *
 * @mangled EdSystemMesDraw__Fv
 * @address 0x173750
 * @size 0x70
 */
void EdSystemMesDraw();

/**
 * Selects the main editor help message for the current build state.
 *
 * @mangled EdEditMainHelpMes__Fi
 * @address 0x1737C0
 * @size 0x6C
 */
void EdEditMainHelpMes(int building);

/**
 * Displays the prompt for walking into editor mode.
 *
 * @mangled EdWalkToEditMes__Fi
 * @address 0x173830
 * @size 0x50
 */
void EdWalkToEditMes(int wait);

/**
 * Displays the contextual help for placing a building part.
 *
 * @mangled EdEditBuildHelpMes__Fi
 * @address 0x173880
 * @size 0xAC
 */
void EdEditBuildHelpMes(int part);

/**
 * Displays the contextual help for moving an editor part.
 *
 * @mangled EdEditMoveHelpMes__Fv
 * @address 0x173930
 * @size 0x74
 */
void EdEditMoveHelpMes();

/**
 * Displays the fishing movement help message.
 *
 * @mangled EdFishingWalkHelpMes__Fi
 * @address 0x1739B0
 * @size 0x68
 */
void EdFishingWalkHelpMes(int fish);

/**
 * Displays the fishing-angle help message.
 *
 * @mangled EdFishingAngleHelpMEs__Fi
 * @address 0x173A20
 * @size 0x8
 */
void EdFishingAngleHelpMEs(int angle);

/**
 * Displays the message for losing fishing bait.
 *
 * @mangled EdFishingLostEsaMes__Fv
 * @address 0x173A30
 * @size 0x3C
 */
void EdFishingLostEsaMes();

/**
 * Displays the message describing an awarded item.
 *
 * @mangled EdItemGetMes__Fiiii
 * @address 0x173A70
 * @size 0x2C
 */
void EdItemGetMes(int item, int kind, int count, int attachment);

/**
 * Initializes the editor's animated item box frames.
 *
 * @mangled EdInitOpenItemBox__FP9CFrameVu1P9CFrameVu1
 * @address 0x173AA0
 * @size 0x1C
 */
void EdInitOpenItemBox(CFrameVu1 *frame, CFrameVu1 *base);

/**
 * Positions the editor's animated item box.
 *
 * @mangled EdSetOpenItemBox__FPfPf
 * @address 0x173AC0
 * @size 0x70
 */
void EdSetOpenItemBox(float *position, float *rotation);

/**
 * Advances the editor's item-box opening animation.
 *
 * @mangled EdStepOpenItemBox__Fv
 * @address 0x173B30
 * @size 0x1C8
 */
void EdStepOpenItemBox();

/**
 * Draws the editor's animated item box.
 *
 * @mangled EdDrawOpenItemBox__Fv
 * @address 0x173D00
 * @size 0xF8
 */
void EdDrawOpenItemBox();

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

/**
 * Gives back which of the editor views is on screen.
 *
 * @mangled EdCheckViewMode__Fv
 * @address 0x16A120
 * @size 0xC
 * @unknownret
 */
int EdCheckViewMode(void);

/**
 * Builds the villager table a map description asks for.
 *
 * @mangled EdCreateVillagerTable__FP13EDIT_MAP_INFO
 * @address 0x185320
 * @size 0x19C
 */
void EdCreateVillagerTable(EDIT_MAP_INFO *info);

/**
 * Draws one event-point marker at the requested size.
 *
 * @mangled EdEventPointDraw__FP14ED_EVENT_POINTif
 * @address 0x184750
 * @size 0x300
 */
void EdEventPointDraw(ED_EVENT_POINT *point, int kind, float size);

/**
 * Gives back the motion a door plays for one state.
 *
 * @mangled EdGetDoorMotion__Fii
 * @address 0x1721C0
 * @size 0x4C
 * @unknownret
 */
int EdGetDoorMotion(int door_no, int state);

/**
 * Clears the parameters an editor event script reads.
 *
 * @mangled EdInitEventParam__Fv
 * @address 0x197220
 * @size 0x190
 */
void EdInitEventParam(void);

/**
 * Fills the event points one map-parts entry describes.
 *
 * @mangled EdInitEventPoint__FP9CMapPartsPsP16EPARTS_FUNC_DATAiP14ED_EVENT_POINTi
 * @address 0x183D50
 * @size 0x600
 * @unknownret
 */
int EdInitEventPoint(CMapParts *parts, short *indices, EPARTS_FUNC_DATA *funcs, int count, ED_EVENT_POINT *points, int max_points);

/**
 * Prepares the event that walks the player into an interior.
 *
 * @mangled EdInitGotoInterior__FP13ED_EVENT_INFOP14ED_EVENT_PARAM
 * @address 0x16D7F0
 * @size 0x68
 */
int EdInitGotoInterior(ED_EVENT_INFO *info, ED_EVENT_PARAM *param);

/**
 * Copies a parts-info header into the editor parts record.
 *
 * @mangled EdInitToEPInfo__FP14INIT_PARTSINFOP18EPARTS_INFO_HEADER
 * @address 0x189570
 * @size 0x154
 * @unknownret
 */
int EdInitToEPInfo(INIT_PARTSINFO *init, EPARTS_INFO_HEADER *header);

/**
 * Clears what the editor knows about villager movement.
 *
 * @mangled EdInitVillagerControl__Fv
 * @address 0x1852B0
 * @size 0x64
 */
void EdInitVillagerControl(void);

/**
 * Fills the villager table for one time of day.
 *
 * @mangled EdInitVillagerTable__FfP13EDIT_MAP_INFO
 * @address 0x1854C0
 * @size 0x94
 */
void EdInitVillagerTable(float clock, EDIT_MAP_INFO *info);

/**
 * Runs the player character for one editor frame.
 *
 * @mangled EdMoveChara__Fv
 * @address 0x16A160
 * @size 0x35B4
 */
void EdMoveChara(void);

/**
 * Clears the editor movement state before a map runs.
 *
 * @mangled EdMoveCharaInit__Fv
 * @address 0x169FD0
 * @size 0x18
 */
void EdMoveCharaInit(void);

/**
 * Runs one villager for a frame on the current map.
 *
 * @mangled EdMoveVillager__FP13VILLAGER_INFO
 * @address 0x186EF0
 * @size 0x5B4
 */
void EdMoveVillager(VILLAGER_INFO *villager);

/**
 * Runs one villager for a frame on the interior map.
 *
 * @mangled EdMoveVillagerSubMap__FP13VILLAGER_INFO
 * @address 0x1874B0
 * @size 0x258
 */
void EdMoveVillagerSubMap(VILLAGER_INFO *villager);

/**
 * Prepares the frame capture the editor writes to a file.
 *
 * @mangled EdSaveFrameImageInit__Fv
 * @address 0x173ED0
 * @size 0x2C
 */
void EdSaveFrameImageInit(void);

/**
 * Plays one of the editor sound effects.
 *
 * @mangled EdSePlay__F11ED_SOUND_IDi
 * @address 0x18A110
 * @size 0x40
 */
void EdSePlay(ED_SOUND_ID sound, int pan);

/**
 * Finds the event a name and a range select.
 *
 * @mangled EdSearchEvent__FP14ED_EVENT_PARAMPcif
 * @address 0x184CB0
 * @size 0x200
 * @unknownret
 */
int EdSearchEvent(ED_EVENT_PARAM *param, char *name, int kind, float range);

/**
 * Sets the editor background music volume.
 *
 * @mangled EdSetBgmVol__Ff
 * @address 0x171480
 * @size 0x14C
 */
void EdSetBgmVol(float volume);

/**
 * Applies a map description lighting preset to a frame.
 *
 * @mangled EdSetLightParam__FfiP13EDIT_MAP_INFOP9CFrameVu1
 * @address 0x188D50
 * @size 0x818
 */
void EdSetLightParam(float clock, int preset, EDIT_MAP_INFO *info, CFrameVu1 *frame);

/**
 * Runs the talking-to-a-villager mode for a frame.
 *
 * @mangled EdTalkMode__FP10CCharacterP13CCameraFollowiPi
 * @address 0x199090
 * @size 0xEBC
 * @unknownret
 */
int EdTalkMode(CCharacter *chara, CCameraFollow *camera, int mode, int *state);

/**
 * Holds the edit cursor inside the area the map allows.
 *
 * @mangled LimitEditCursorPos__FPfPf
 * @address 0x189B80
 * @size 0x588
 */
void LimitEditCursorPos(float *position, float *limit);
