#pragma once

#include "common.h"

#include <libvu0.h>

class CFrame;
class CMapParts;
class CMapObject;

/**
 * Describes one image resource assigned while loading an editor map.
 */
struct EDIT_IMAGE_INFO {
    char name[0x40]; /**< Resource path relative to the active script directory. */
    int type;        /**< Image slot receiving the resource. */
    int number;      /**< Image number selected within the resource. */
};

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
    u8 unk_1bec[0x167e4];
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
    u8 unk_18400[0x1e00];
    int people_list[15];                /**< Villager identifiers parsed for this map. */
    u8 unk_1a23c[0x12024];
};

/**
 * Describes one spatial or scripted event trigger in an editor map.
 */
struct ED_EVENT_POINT {
    int enabled;              /**< Whether this event-point entry is available for evaluation. */
    u32 unk_04;
    int completion_flag;      /**< Map flag which suppresses an event after completion. */
    int parts_no;             /**< Ground-parts object associated with the event. */
    int event_type;           /**< Kind of event represented by the entry. */
    CMapObject *map_object;   /**< Optional map object associated with the event. */
    CFrame *frame;            /**< Optional frame whose draw state gates the event. */
    u8 unk_1c[0x8];
    int minimum_progress;     /**< Minimum story-progress value required by this event. */
    u8 unk_28[0x18];
    float start_time;         /**< Beginning of the event's active time interval. */
    float end_time;           /**< End of the event's active time interval. */
    u8 unk_48[0x8];
    sceVu0FVECTOR position;   /**< Primary world-space event position. */
    sceVu0FVECTOR unk_60;
    sceVu0FVECTOR rotation;   /**< World-space orientation associated with the event. */
    sceVu0FVECTOR extent;     /**< Secondary point or spatial extent of the event. */
};

/**
 * Stores the editor's runtime state for one town villager.
 */
struct VILLAGER_INFO {
    u8 unk_00[0x60];
    int talk_event_no;    /**< Event number started when the villager is addressed. */
    int talk_event_level; /**< Priority or variant associated with the talk event. */
    int talk_rotation;    /**< Rotation constraint applied while the villager talks. */
    int talk_direction;   /**< Direction constraint applied while the villager talks. */
    u8 unk_70[0x20];
};

/** Current parsed editor-map description. */
extern EDIT_MAP_INFO *EditMapInfo;

/** Villager currently receiving map-script attributes. */
extern VILLAGER_INFO *now_villinfo;

STATIC_ASSERT(sizeof(EDIT_IMAGE_INFO) == 0x48);
STATIC_ASSERT(sizeof(EDIT_MAP_INFO) == 0x2C260);
STATIC_ASSERT(sizeof(ED_EVENT_POINT) == 0x90);
STATIC_ASSERT(sizeof(VILLAGER_INFO) == 0x90);

/**
 * Returns the integer value addressed by a script argument slot.
 *
 * @mangled test__FPPv
 * @address 0x1741D0
 * @size 0x10
 */
int test(void **argument);

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
