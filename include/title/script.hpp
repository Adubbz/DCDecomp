#pragma once

#include "common.h"

#include <libvu0.h>

/**
 *          Describes one command recognized by the title script parser.
 */
struct CSCRIPT_COMMAND {
    const char *name; /**< Text that identifies the command. */
    int length;       /**< Number of bytes compared from the command name. */
    int arg_count;    /**< Number of arguments consumed by the command. */
    int arg_type[8];  /**< Syntax category of each possible argument. */
};

STATIC_ASSERT(sizeof(CSCRIPT_COMMAND) == 0x2C);

/**
 *          Holds the pending title-script requests for one scene object.
 */
struct SCRIPT_OBJ {
    u8 disp; /**< Whether the object is displayed. */
    u8 unk_01[3];
    int motion;     /**< Motion requested for the object. */
    int motion_end; /**< Motion selected when the request finishes. */
    int move;       /**< Movement requested for the object. */
    u8 move_req;    /**< Whether the movement request is pending. */
    u8 unk_11[3];
    int eye;          /**< Eye animation requested for the object. */
    float eye_time;   /**< Duration of the eye animation. */
    int mouth;        /**< Mouth animation requested for the object. */
    float mouth_time; /**< Duration of the mouth animation. */
    u8 talk;          /**< Whether the object is the active speaker. */
    u8 unk_25[3];
    int load;        /**< Model requested for the object. */
    int load_motion; /**< Initial motion requested with the model. */
    float step;      /**< Motion step used by the object. */
};

STATIC_ASSERT(sizeof(SCRIPT_OBJ) == 0x34);

/**
 *          Parses and stores the state of the title overlay's text script.
 */
class CScript {
public:
    /**
     *          Loads a title script and resets its execution state.
     *
     * @mangled Load__7CScriptFPCc
     * @address 0x1DABD80
     * @size 0x160
     */
    void Load(const char *name);

    /**
     *          Advances the title script until a command yields execution.
     *
     * @mangled Step__7CScriptFv
     * @address 0x1DABEE0
     * @size 0x230
     */
    void Step(void);

    /**
     *          Applies one parsed command to the title scene state.
     *
     * @mangled CheckScript__7CScriptFPciP15CSCRIPT_COMMANDi
     * @address 0x1DAC110
     * @size 0xB40
     */
    int CheckScript(char *buffer, int position, CSCRIPT_COMMAND *command, int command_no);

    /**
     *          Parses the arguments required by one title script command.
     *
     * @mangled CheckArg__7CScriptFPciP15CSCRIPT_COMMAND
     * @address 0x1DACC50
     * @size 0x440
     */
    int CheckArg(char *buffer, int position, CSCRIPT_COMMAND *command);

    /**
     *          Skips whitespace and comments before the next script token.
     *
     * @mangled SkipSpace__7CScriptFPci
     * @address 0x1DAD090
     * @size 0x150
     */
    int SkipSpace(char *buffer, int position);

    int camera_start; /**< Camera selected by the current command. */
    int camera_no;    /**< Camera that was selected before the current command. */
    int fade;         /**< Fade request consumed by the title movie. */
    float fade_speed; /**< Rate of the pending fade. */
    u8 end;           /**< Whether the script reached its end command. */
    u8 unk_11[3];
    int sprite;   /**< Sprite request consumed by the scene. */
    int scene;    /**< Scene selected by the script. */
    int load_no;  /**< Scene data requested for loading. */
    int init_no;  /**< Scene selected for initialization. */
    int mes_wait; /**< Whether message completion blocks execution. */
    float wait;   /**< Remaining scripted wait time. */
    u8 unk_2C;
    u8 unk_2D[3];
    SCRIPT_OBJ obj[23]; /**< Pending state for each scripted object. */
    int motion_start;   /**< First frame of the requested camera motion. */
    int motion_end;     /**< Last frame of the requested camera motion. */
    float motion_step;  /**< Step applied to the requested camera motion. */
    u8 motion_req;      /**< Whether a camera motion request is pending. */
    u8 unk_4E1[3];
    int mes_no;      /**< Message selected for display. */
    float mes_timer; /**< Duration assigned to the message. */
    int mes_x;       /**< Horizontal message position. */
    int mes_y;       /**< Vertical message position. */
    int mes_talker;  /**< Object speaking the message. */
    int mes_tail_x;  /**< Horizontal position of the message tail. */
    int mes_tail_y;  /**< Vertical position of the message tail. */
    int mes_fuchi;   /**< Message outline setting. */
    int unk_504;
    int bom_no; /**< Circular slot used by the next bomb request. */
    u8 bom_req; /**< Whether a bomb request is pending. */
    u8 unk_50D[11];
    sceVu0FVECTOR bom_pos[3]; /**< Positions of pending bomb effects. */
    float bom_size[4];        /**< Sizes assigned to the bomb slots. */
    int beem_no;              /**< Circular slot used by the next beam request. */
    u8 beem_req;              /**< Whether a beam request is pending. */
    u8 beem_end;              /**< Whether the beam should finish. */
    u8 unk_566[10];
    sceVu0FVECTOR beem_from[3]; /**< Starting points of beam requests. */
    sceVu0FVECTOR beem_to[3];   /**< Ending points of beam requests. */
    int se_kind;                /**< Kind of sound request issued by the script. */
    int se_no;                  /**< Sound selected by the script. */
    int se_voice;               /**< Voice selected for the sound. */
    int se_fade_time;           /**< Fade duration assigned to the sound. */
    int se_stop;                /**< Whether the selected sound should stop. */
    int bgm_fade;               /**< Background-music fade request. */
    int size;                   /**< Size in bytes of the loaded script. */
    u8 unk_5E4[20];
    char data[56000]; /**< Storage containing the loaded script text. */
    char *p;          /**< Script buffer currently being parsed. */
    int pos;          /**< Current byte position in the script. */
    float arg[128];   /**< Arguments parsed for the current command. */
    u8 unk_E2C0[56];
};

STATIC_ASSERT(sizeof(CScript) == 0xE300);

extern CSCRIPT_COMMAND Command[26];
extern CScript CScript;
