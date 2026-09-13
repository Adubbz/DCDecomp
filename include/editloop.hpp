#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

#include <libvu0.h>

#include "edit.hpp"
#include "objanime.hpp"

class CFrame;
class CMapParts;
class CMapObject;
class CCamera;
class CCameraFollow;
class ClsMes;
class CTexture;
class CRect_i_;
struct sceVif1Packet;

/** Working arena used to load event villagers and the event player model. */
extern CDataAlloc2<1> EdVillagerBuffer;

/** Working arena used to load map NPC resources. */
extern CDataAlloc2<1> EdNPCBuffer;

/**
 * Loads the player model and motion archive used by an editor event.
 *
 * @mangled EdLoadMainChara__FPcPcP14CDataAlloc2_1_
 * @address 0x17E4B0
 * @size 0x2CC
 */
void EdLoadMainChara(char *model, char *motion, CDataAlloc2<1> *arena);

/**
 * Describes one image resource assigned while loading an editor map.
 */
struct EDIT_IMAGE_INFO {
    char name[0x40]; /**< Resource path relative to the active script directory. */
    int type;        /**< Image slot receiving the resource. */
    int number;      /**< Image number selected within the resource. */
};

/**
 * Stores one scene-layer resource selected by a sky or sun script command.
 */
struct EDIT_SCENE_LAYER_INFO {
    char name[0x40]; /**< Resource path relative to the active script directory. */
    int unk_40;      /**< Runtime state reset when the layer is selected. */
    int unk_44;      /**< Runtime state reset when the layer is selected. */
    int unk_48;      /**< Runtime state reset when the layer is selected. */
    u8 unk_4c[0xac];
};

/**
 * Stores one editor-area definition parsed from the map script.
 */
struct EDIT_AREA_INFO {
    char name[0x40]; /**< Resource path relative to the active script directory. */
    int width;       /**< Width of the editable area. */
    int height;      /**< Height of the editable area. */
    float unk_48;    /**< First area-placement parameter. */
    float unk_4c;    /**< Second area-placement parameter. */
    float unk_50;    /**< Third area-placement parameter. */
    float unk_54;    /**< Fourth area-placement parameter. */
    float unk_58;    /**< Fifth area-placement parameter. */
};

/**
 * Stores one named moving map-part range parsed from the map script.
 */
struct EDIT_MOTION_PARTS_INFO {
    char name[0x40]; /**< Name of the moving map part. */
    float values[6]; /**< Motion limits and rates supplied by the script. */
    u8 unk_58[0xc];
};

/**
 * Stores one map-part resource and the classification supplied by its script command.
 */
struct MAP_PARTS_INFO {
    char name[9][0x40];  /**< Model resource names: seven shape variants then two more. */
    int parts_no;        /**< Part number supplied by the script. */
    int subtype;         /**< Road, river, bridge, or surface subtype. */
    int kind;            /**< Broad ground, building, or terrain classification. */
    float position[3];   /**< World-space placement of the part. */
    float rotation[3];   /**< Orientation of the part, in radians. */
    float unk_264;       /**< Scalar parameter supplied by the script. */
    s16 anime[8];        /**< Object animations attached to this part. */
    u8 unk_278[0x50];
    s16 events[8];       /**< Event points attached to this part. */
};

/**
 * Stores the cell grid and attached resources of one script-defined map part.
 */
struct EDIT_PARTS_DEF {
    int width;           /**< Cells the part covers from west to east. */
    int height;          /**< Cells the part covers from north to south. */
    s16 cells[32];       /**< One entry per grid cell, row by row. */
    int unk_48;          /**< Classification supplied by the script. */
    int values[6];       /**< Numeric parameter for each attached resource. */
    char names[6][0x20]; /**< Name of each attached resource. */
};

/**
 * Provides the overlapping edit-area and map-part views of script work storage.
 */
union EDIT_MAP_PARTS_WORK {
    EDIT_AREA_INFO edit_areas[444]; /**< Editable-area resources parsed for this map. */
    struct {
        u8 unk_0000[0x170];
        MAP_PARTS_INFO parts[24]; /**< General map-part definitions parsed for this map. */
    } general;
    struct {
        u8 unk_0000[0x45b0];
        EDIT_PARTS_DEF defs[24]; /**< Cell grids defined for the general map parts. */
    } parts_defs;
    struct {
        u8 unk_0000[0x6110];
        MAP_PARTS_INFO parts[6]; /**< Road definitions parsed for this map. */
    } roads;
    struct {
        u8 unk_0000[0x7220];
        MAP_PARTS_INFO parts[16]; /**< River and bridge definitions parsed for this map. */
    } rivers;
    u8 unk_0000[0x9fa0];
};

/**
 * Stores the ordered bounds of one rectangular editor region.
 */
struct EDIT_AREA_RECT_INFO {
    sceVu0FVECTOR maximum; /**< Greater corner of the region. */
    sceVu0FVECTOR minimum; /**< Lesser corner of the region. */
};

/**
 * Stores transient wave offsets for editor water surfaces.
 */
struct EDIT_WATER_INFO {
    char name[0x10];        /**< Water-surface resource name. */
    int type;               /**< Image slot the surface draws from. */
    int number;             /**< Image number selected within that slot. */
    int parts_no;           /**< Map part the surface belongs to. */
    u8 unk_1c[0x4];
    sceVu0FVECTOR corner_a; /**< First corner of the surface. */
    sceVu0FVECTOR corner_b; /**< Second corner of the surface. */
    sceVu0FVECTOR corner_c; /**< Third corner of the surface. */
    int unk_50;
    int unk_54;
    int unk_58;
    u8 unk_5c[0x4];
    sceVu0FVECTOR texture_scroll; /**< Texture offset and scroll rates. */
    int unk_70;
    int unk_74;
    int unk_78;
    u8 unk_7c[0x4];
    sceVu0FVECTOR wave[4]; /**< Pending water-wave parameters, terminated by an empty entry. */
};

/**
 * Provides the overlapping view used to address one water-wave slot.
 */
struct EDIT_WATER_WAVE_VIEW {
    u8 unk_00[0x80];
    float x;      /**< First wave parameter. */
    float y;      /**< Second wave parameter. */
    float z;      /**< Third wave parameter. */
    float active; /**< Fourth wave parameter and slot-usage marker. */
};

/**
 * Stores the editor's runtime state for one town villager.
 */
struct VILLAGER_INFO {
    char name[0x40];       /**< Villager resource name. */
    int placed;             /**< Whether runtime placement has assigned this villager to a slot. */
    int index;             /**< Position of the villager in the parsed list. */
    int character_no;      /**< Character definition selected for the villager. */
    int model_no;          /**< Model variant selected for the villager. */
    int weapon_no;         /**< Equipment or prop selected for the villager. */
    int initial_motion;    /**< Initial motion selected for the villager. */
    float move_speed;       /**< Speed used when the villager walks to a selected destination. */
    int hide_when_complete; /**< Whether completing the associated part suppresses this villager. */
    int talk_event_no;    /**< Event number started when the villager is addressed. */
    int talk_event_level; /**< Priority or variant associated with the talk event. */
    int talk_rotation;    /**< Rotation constraint applied while the villager talks. */
    int talk_direction;   /**< Direction constraint applied while the villager talks. */
    sceVu0FVECTOR position; /**< Initial villager position and scale component. */
    sceVu0FVECTOR rotation; /**< Initial villager rotation. */
};

/**
 * Copies the current editor resource directory into a caller buffer.
 *
 * @mangled GetEditDataDir__FPc
 * @address 0x1777D0
 * @size 0x20
 */
void GetEditDataDir(char *name);

/**
 * Stores the fog parameters belonging to one lighting preset.
 */
struct EDIT_FOG_INFO {
    float near_distance; /**< Distance at which fog begins. */
    float far_distance;  /**< Distance at which fog reaches full strength. */
    u8 red;              /**< Red component of the fog colour. */
    u8 green;            /**< Green component of the fog colour. */
    u8 blue;             /**< Blue component of the fog colour. */
    u8 unk_0b;
    float intensity;     /**< Fog-density parameter supplied by the script. */
    float exponent;      /**< Fog falloff parameter supplied by the script. */
};

/**
 * Describes one spatial or scripted event trigger in an editor map.
 */
struct ED_EVENT_POINT {
    int enabled;              /**< Whether this event-point entry is available for evaluation. */
    int map_no;               /**< Map the event moves the player to. */
    int completion_flag;      /**< Map flag which suppresses an event after completion. */
    int parts_no;             /**< Ground-parts object associated with the event. */
    int event_type;           /**< Kind of event represented by the entry. */
    CMapObject *map_object;   /**< Optional map object associated with the event. */
    CFrame *frame;            /**< Optional frame whose draw state gates the event. */
    int side;                 /**< Which side of the entrance the player arrives on. */
    int linked_value;         /**< Parameter supplied by a paired or directional marker. */
    int minimum_progress;     /**< Minimum story-progress value required by this event. */
    int secondary_progress;   /**< Additional progress parameter used by scripted event points. */
    u8 unk_2c[0x4];
    char destination[0x10];   /**< Name of the map the event leads to. */
    float start_time;         /**< Beginning of the event's active time interval. */
    float end_time;           /**< End of the event's active time interval. */
    u8 unk_48[0x8];
    sceVu0FVECTOR position;   /**< Primary world-space event position. */
    sceVu0FVECTOR unk_60;
    sceVu0FVECTOR rotation;   /**< World-space orientation associated with the event. */
    sceVu0FVECTOR extent;     /**< Secondary point or spatial extent of the event. */
};

/**
 * Resolves a map object's local position and yaw into world coordinates.
 *
 * @mangled GetPosRot__FP10CMapObjectPfPf
 * @address 0x1838F0
 * @size 0x118
 */
int GetPosRot(CMapObject *object, float *position, float *rotation);

/**
 * Tests whether an event point is enabled and valid at the requested map time.
 *
 * @mangled CheckEventPoint__FP14ED_EVENT_POINTf
 * @address 0x183A60
 * @size 0x1D4
 */
int CheckEventPoint(ED_EVENT_POINT *point, float time);

/**
 * Provides the overlapping work-record views used by editor map loading.
 */
union EDIT_MAP_WORK_INFO {
    OBJ_ANIME_SEQ obj_anime[128]; /**< Object animations parsed for this map. */
    struct {
        u8 unk_0000[0x4800];
        EDIT_EFFECT_INFO first[64];  /**< Effects placed on the general map parts. */
        EDIT_EFFECT_INFO second[64]; /**< Effects placed on the map objects. */
    } effects;
    struct {
        u8 unk_0000[0x7ff0];
        EDIT_OBJECT_TIMER timers[128]; /**< Object timers parsed for this map. */
    } object_timers;
    struct {
        u8 unk_0000[0x9000];
        ED_EVENT_POINT points[256]; /**< Event points parsed for this map. */
    } events;
};

/**
 * Exposes the message-speed word used from the saved configuration block.
 */
struct EDIT_CONFIG_VIEW {
    u8 unk_00[0x8];
    int clock_hidden;  /**< Whether the player has turned the editor clock off. */
    u8 unk_0C[0x4];
    int message_speed; /**< Whether editor messages use the faster reveal rate. */
};

/**
 * Stores the parsed resources and environmental settings for an editor map.
 */
struct EDIT_MAP_INFO {
    char scene_name[0x40];              /**< Scene resource named by the map script. */
    int time_stop;                      /**< Whether the map clock is stopped. */
    int ambient_sound_off;              /**< Whether ambient map sound is disabled. */
    int bgm_no;                         /**< Background-music number selected by the script. */
    int sound_set_no;                   /**< Environmental sound-set number. */
    u8 unk_0050[0x10];
    float wind[4];                      /**< Wind direction and strength parameters. */
    float ambient[12][4];               /**< Ambient light colours for each light preset. */
    float light_direction[12][4][4];    /**< Normalized light directions per preset, one light per column. */
    float light_colour[12][4][4];       /**< Colours for four lights per preset. */
    float background_colour[12][4];     /**< Primary background colours for each light preset. */
    float background_colour_2[12][4];   /**< Secondary background colours for each light preset. */
    EDIT_FOG_INFO fog[12];              /**< Fog parameters for each light preset. */
    float character_ambient[4][4];      /**< Per-character ambient light colours. */
    EDIT_IMAGE_INFO images[64];         /**< Image resources assigned to map rendering slots. */
    int sky_follow[3];                  /**< Sky-follow parameters supplied by the map script. */
    u8 unk_1bec[0x4];
    EDIT_SCENE_LAYER_INFO sky_layers[5]; /**< Scene layers selected by the SKY command. */
    EDIT_SCENE_LAYER_INFO sun_layers[4]; /**< Scene layers selected by the SUN command. */
    u8 unk_24a8[0xf8];
    MAP_PARTS_INFO map_objects[64]; /**< Ground, building and water objects placed by the script. */
    EDIT_MAP_PARTS_WORK parts_work; /**< Overlapping area and part-definition work storage. */
    EDIT_MOTION_PARTS_INFO motion_parts[4]; /**< Named map parts with scripted motion. */
    EDIT_WATER_INFO water_surfaces[8]; /**< Water surfaces parsed for this map. */
    EDIT_AREA_RECT_INFO edit_area_rects[8]; /**< Rectangular editor regions parsed for this map. */
    float dof_start_time;               /**< Time at which the depth-of-field interval begins. */
    float dof_end_time;                 /**< Time at which the depth-of-field interval ends. */
    float dof_near;                     /**< Near depth-of-field distance. */
    float dof_far;                      /**< Far depth-of-field distance. */
    int dof_near_level;                 /**< Near depth-of-field blur level. */
    int dof_far_level;                  /**< Far depth-of-field blur level. */
    int dof_alpha;                      /**< Alpha used while drawing depth of field. */
    float shadow_near;                  /**< Near distance used by map shadow rendering. */
    float shadow_far;                   /**< Far distance used by map shadow rendering. */
    int shadow_level;                   /**< Shadow-quality level selected by the map script. */
    int shadow_mode;                    /**< First map shadow-mode setting. */
    int shadow_mode_2;                  /**< Second map shadow-mode setting. */
    VILLAGER_INFO villagers[16];     /**< Villager placements parsed for this map. */
    int time_tables[7][12][16];      /**< Weekly villager schedules parsed for this map. */
    int people_list[16];                /**< Villager identifiers parsed for this map. */
    u8 unk_1a240[0x10];
    int event_count;                    /**< Number of event points the map defines. */
    u8 unk_1a254[0xc];
    EDIT_MAP_WORK_INFO work;            /**< Overlapping work records reset during map initialization. */
};


/** Current parsed editor-map description. */
extern EDIT_MAP_INFO *EditMapInfo;

/** The same description as the map script is being read into it. */
extern EDIT_MAP_INFO *edit_info;

/** Villager currently receiving map-script attributes. */
extern VILLAGER_INFO *now_villinfo;

/** Storage arena containing editor event scripts. */
extern CDataAlloc2<1> EdScriptBuffer;

/** Name of the editor map whose resources are active. */
extern char EditMapName[0x20];

/** Optional map-specific event script loaded into the script arena. */
extern char *EdEventData;

/** Shared system event script loaded into the script arena. */
extern char *EdSystemEventData;

/** Whether map geometry drawing is suppressed while an editor event is active. */
extern int EdDrawOffMap;

/** Camera used while an editor event controls the viewpoint. */
extern CCameraFollow EventCamera;

/** Number of the currently running map event. */
extern int start_event_no;

/** Number of the currently running system event. */
extern int start_system_event;

/** Whether the editor clock overlay is drawn. */
extern int draw_clock;

/** Suppresses the editor's parameter and system overlays for debug captures. */
extern int EdDebugParamDrawOff;

/** Current projected position of the editor's map cursor. */
extern sceVu0FVECTOR NowCursorPos;

/** Target position toward which the editor's map cursor interpolates. */
extern sceVu0FVECTOR NextCursorPos;

/** Map part currently under the editor cursor. */
extern void *NowFocusParts;

/** Number of frames for which the focused part name remains visible. */
extern int DrawPartsNameCount;

/** Number of labels available for the focused map part. */
extern int PartsNameNum;

/** Primary message window used by ordinary editor conversations. */
extern ClsMes EditMes1;

/** Primary message window used while an editor event is running. */
extern ClsMes EditEventMes1;

/** Message window used for editor character names. */
extern ClsMes EditNameMes;

/** Message window used for editor system notifications. */
extern ClsMes EditSystemMes;

STATIC_ASSERT(sizeof(EDIT_IMAGE_INFO) == 0x48);
STATIC_ASSERT(sizeof(EDIT_SCENE_LAYER_INFO) == 0xf8);
STATIC_ASSERT(sizeof(EDIT_AREA_INFO) == 0x5c);
STATIC_ASSERT(sizeof(EDIT_MOTION_PARTS_INFO) == 0x64);
STATIC_ASSERT(sizeof(EDIT_AREA_RECT_INFO) == 0x20);
STATIC_ASSERT(sizeof(EDIT_WATER_INFO) == 0xc0);
STATIC_ASSERT(sizeof(MAP_PARTS_INFO) == 0x2d8);
STATIC_ASSERT(sizeof(EDIT_MAP_PARTS_WORK) == 0x9fa0);
STATIC_ASSERT(sizeof(EDIT_PARTS_DEF) == 0x124);
STATIC_ASSERT(sizeof(EDIT_MAP_WORK_INFO) == 0x12000);
STATIC_ASSERT(sizeof(EDIT_MAP_INFO) == 0x2C260);
STATIC_ASSERT(sizeof(ED_EVENT_POINT) == 0x90);
STATIC_ASSERT(sizeof(VILLAGER_INFO) == 0x90);

/**
 * Returns the first unused event-point slot after the reserved first entry.
 *
 * @mangled GetNewEventPoint__FP14ED_EVENT_POINTi
 * @address 0x183A10
 * @size 0x4C
 */
ED_EVENT_POINT *GetNewEventPoint(ED_EVENT_POINT *points, int count);

/**
 * Returns the integer value addressed by a script argument slot.
 *
 * @mangled test__FPPv
 * @address 0x1741D0
 * @size 0x10
 */
int test(void **argument);

/**
 * Starts a map event and optionally adopts a camera viewpoint.
 *
 * @mangled RunEvent__FiP7CCamera
 * @address 0x1779F0
 * @size 0xD0
 */
int RunEvent(int event_no, CCamera *camera);

/**
 * Starts a system event and optionally adopts a camera viewpoint.
 *
 * @mangled RunSystemEvent__FiP7CCamera
 * @address 0x177AC0
 * @size 0xA8
 */
void RunSystemEvent(int event_no, CCamera *camera);

/**
 * Draws one textured rectangle rotated about a caller-supplied pivot.
 *
 * @mangled set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUc
 * @address 0x1831D0
 * @size 0x590
 */
void set2DSpriteRot(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen,
                    const CRect_i_ &texel, int pivot_x, int pivot_y, float angle,
                    unsigned char alpha);

/**
 * Draws the editor's system overlays for the current frame.
 *
 * @mangled DrawSysGra__Fv
 * @address 0x17D9F0
 * @size 0x16C
 */
void DrawSysGra();

/**
 * Draws the cursor associated with one collection of event points.
 *
 * @mangled EdDrawSysCursor__FP14ED_EVENT_POINTi
 * @address 0x17CBF0
 * @size 0x418
 */
void EdDrawSysCursor(ED_EVENT_POINT *points, int count);

/**
 * Draws the current day and its transition overlay.
 *
 * @mangled DrawDay__Fv
 * @address 0x17D040
 * @size 0x9A8
 */
void DrawDay();

/**
 * Draws the editor cursor and focused-part label overlay.
 *
 * @mangled ParamDraw__Fv
 * @address 0x17C9B0
 * @size 0x224
 */
void ParamDraw();

/**
 * Draws the town clock at the requested screen offset.
 *
 * @mangled EdDrawClock__Fii
 * @address 0x17DB60
 * @size 0x1AC
 */
void EdDrawClock(int x, int y);

/**
 * Requests that the main editor loop terminate.
 *
 * @mangled EdExitLoop__Fv
 * @address 0x178110
 * @size 0x10
 */
int EdExitLoop();

/**
 * Requests a transition from the editor into a dungeon.
 *
 * @mangled GotoDungeon__Fv
 * @address 0x17ECE0
 * @size 0x10
 */
int GotoDungeon();

/**
 * Provides the empty map-object loading hook used by this editor loop.
 *
 * @mangled LoadMapObject__FP9CMapPartsPPc
 * @address 0x1831C0
 * @size 0x8
 */
void LoadMapObject(CMapParts *map_parts, char **script);

/**
 * Sets the town clock to the requested time of day.
 *
 * @mangled EdSetClock__Ff
 * @address 0x178170
 * @size 0x60
 */
void EdSetClock(float time);

/**
 * Returns the town clock's current time of day.
 *
 * @mangled EdGetClock__Fv
 * @address 0x178140
 * @size 0x24
 */
float EdGetClock();

/**
 * Starts the editor's day-transition display.
 *
 * @mangled EdStartDrawDay__Fv
 * @address 0x17D010
 * @size 0x18
 */
void EdStartDrawDay();

/**
 * Resets the editor's day-transition display.
 *
 * @mangled EdInitDrawDay__Fv
 * @address 0x17D030
 * @size 0x10
 */
void EdInitDrawDay();

/** Whether the current editor map is an interior. */
extern int EdInteriorFlag;

/** Whether the editor's thunder effect is active. */
extern int EdThunderEffectFlag;

/** Background music remembered before entering an interior. */
extern int EdBeforeInBgmNo;

/** Georama map currently being edited. */
extern int NowEditMap;

/** Returns a map-completion flag from the active Georama map. */
int EdGetMapFlag(int flag_no);

/** Sets a map-completion flag on the active Georama map. */
int EdSetMapFlag(int flag_no, int value);

/**
 * Removes the event-specific robot-part models.
 *
 * @mangled EdDeleteE05RoboParts__Fv
 * @address 0x17ECF0
 * @size 0xE8
 */
void EdDeleteE05RoboParts();
