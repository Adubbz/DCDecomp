#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

#include <libvu0.h>

#include "fakepointlight.hpp"
#include "gameutil.hpp"
#include "object.hpp"
#include "textureanime.hpp"


/**
 * @file
 * Declares the character that a motion drives.
 */

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCPoly;
class CCloth;
class CFrame;
class CCamera;
class CVector3_f_;

/** Number of sets of motions that one character can hold. */
#define CHARA_MOTION_MAX 8
/** Number of point lights that one character can stand in. */
#define CHARA_POINT_LIGHT_MAX 2
/** Number of pieces of cloth that one character can wear. */
#define CHARA_CLOTH_MAX 4
/** Number of foot sounds that one motion can ask for. */
#define CHARA_FOOT_SOUND_MAX 6
/** Number of events that one motion can ask for. */
#define CHARA_EVENT_MAX 32

/**
 * Names one sound that a motion plays as a foot reaches the ground.
 */
struct CHARA_FOOT_SOUND {
    s32 frame; /**< Frame of the motion that plays the sound; below zero where the slot is free. */
    s32 unk_04;
    s32 foot;      /**< Foot that reaches the ground. */
    s32 motion_no; /**< Motion that plays the sound. */
    s32 unk_10;
};

STATIC_ASSERT(sizeof(CHARA_FOOT_SOUND) == 0x14);

/**
 * Names one thing that a motion does as it reaches a frame.
 */
struct CHARA_EVENT {
    s32 frame;     /**< Frame of the motion that fires the event; below zero where the slot is free. */
    s32 kind;      /**< 0 to play a foot sound, 1 to play a sound effect. */
    s32 no;        /**< Sound that the event plays. */
    s32 motion_no; /**< Motion that fires the event. */
    s32 unk_10;
};

STATIC_ASSERT(sizeof(CHARA_EVENT) == 0x14);

/**
 * Names one thing that a motion does over a range of frames.
 */
struct CHARA_UNK_1068 {
    s32 unk_00;
    float unk_04;
    s32 unk_08;
    s32 unk_0C;
    s32 unk_10;
};

STATIC_ASSERT(sizeof(CHARA_UNK_1068) == 0x14);

/**
 * One motion set, as a character holds it while it plays.
 */
class MotionParam {
public:
    /**
     * @mangled __ct__11MotionParamFv
     * @address 0x143610
     * @size 0xC
     */
    MotionParam();

    u8 unk_00[128];
};

STATIC_ASSERT(sizeof(MotionParam) == 0x80);

/**
 * Moves and animates one character in the world.
 */
class CCharacter : public CObject {
public:
    /**
     * Sets a character to the state it starts in. The call goes through the
     * table: this compiler dispatches a virtual from a constructor rather
     * than binding it to the class being built.
     */
    CCharacter() { Initialize(); }

    /**
     * Selects the motion the character plays next, without advancing it.
     */
    void SetMotion(int no, int mode, float speed = -1.0f) {
        motion_no = no;
        flags = mode;
        motion_speed = speed;
    }

    /**
     * Sets the speed of the motion the character plays.
     */
    void SetMotionSpeed(float speed) { motion_speed = speed; }

    float body_width;  /**< Width of the character collision body. */
    float body_height; /**< Height used for targeting and camera framing. */
    float body_depth;  /**< Depth of the character collision body. */
    CFrame *frame;        /**< Frame that draws the character; zero if it has no model. */
    CFrame *shadow_frame; /**< Frame that draws the shadow; zero if it casts none. */
    u_int *images[4];
    char *unk_0D4;
    s32 unk_0D8;
    CTextureAnime tex_anime; /**< Animation of every texture that the character draws. */
    tagFRAME_INF *unk_2cc;
    tagFRAME_INF *unk_2d0;
    tagMOTION_TYPE motion_type;         /**< Motions of the model. */
    tagMOTION_TYPE shadow_motion_type;  /**< Motions of the shadow. */
    s32 motion_start[CHARA_MOTION_MAX]; /**< First motion number of each set; -1 where it holds none. */
    s32 motion_end[CHARA_MOTION_MAX];   /**< Motion number after the last one of each set. */
    MotionParam unk_420[CHARA_MOTION_MAX];
    MotionParam unk_820[CHARA_MOTION_MAX];
    tagMOTION_TYPE *motion[CHARA_MOTION_MAX];        /**< Motions of each set; zero where it holds none. */
    tagMOTION_TYPE *shadow_motion[CHARA_MOTION_MAX]; /**< Shadow motions of each set. */
    float motion_speed;                              /**< Speed of the motion; -1.0 for the speed the motion gives. */
    s32 flags;
    s32 motion_no; /**< Identifier of the motion that the character plays. */
    float unk_C6C;
    s32 motion_state; /**< 0 while no motion plays, 2 while one plays, 3 as one ends. */
    CCloth **cloth;   /**< Pieces of cloth that the character wears. */
    CCloth *cloth_buf[8]; /**< Storage the cloth pointers start in. */
    s32 unk_C98;
    s32 unk_C9C;
    s32 unk_CA0;
    sceVu0FVECTOR unk_CB0[2];
    sceVu0FVECTOR unk_CD0;
    sceVu0FVECTOR ambient_offset; /**< Ambient RGB added while drawing and an optional alpha override. */
    float fade[4];                                      /**< Alpha the character draws with, two spare values, and the alpha it fades down to. */
    CFakePointLight point_light[CHARA_POINT_LIGHT_MAX]; /**< Lights that the character stands in. */
    CHARA_FOOT_SOUND foot_sound[CHARA_FOOT_SOUND_MAX];  /**< Sounds that the feet play. */
    s32 foot_sound_id;                                  /**< Set of foot sounds that the ground asks for; below zero for none. */
    s32 foot_sound_enable;                              /**< 1 while the feet play a sound. */
    s32 unk_DE0;
    s32 event_enable;                   /**< 1 while the motion fires its events. */
    CHARA_EVENT event[CHARA_EVENT_MAX]; /**< Events that the motions fire. */
    CHARA_UNK_1068 unk_1068[16];

    /**
     * Clears every point light that affects the character.
     *
     * @mangled ClearPointLight__10CCharacterFv
     * @address 0x137EA0
     * @size 0x40
     */
    void ClearPointLight(void);

    /**
     * Adds a point light to the first free light slot.
     *
     * @mangled SetPointLight__10CCharacterFPfffffff
     * @address 0x137EE0
     * @size 0x110
     */
    int SetPointLight(float *pos, float inner_range, float outer_range, float red, float green,
                      float blue, float alpha);

    /**
     * Initializes the character texture animation from animation data.
     *
     * @mangled InitializeTexAnime__10CCharacterFP13CTexAnimeDatai
     * @address 0x137FF0
     * @size 0x30
     */
    void InitializeTexAnime(CTexAnimeData *data, int count);

    /**
     * Clears the character texture animation.
     *
     * @mangled ClearTexAnime__10CCharacterFv
     * @address 0x138020
     * @size 0x30
     */
    void ClearTexAnime(void);

    /**
     * Advances the character texture animation.
     *
     * @mangled TextureAnime__10CCharacterFi
     * @address 0x138050
     * @size 0x30
     */
    void TextureAnime(int step);

    /**
     * Enables one character texture animation.
     *
     * @mangled TexAnimeOn__10CCharacterFi
     * @address 0x138080
     * @size 0x30
     */
    void TexAnimeOn(int no);

    /**
     * Disables one character texture animation.
     *
     * @mangled TexAnimeOff__10CCharacterFi
     * @address 0x1380B0
     * @size 0x30
     */
    void TexAnimeOff(int no);

    /**
     * Adds footstep events across a motion frame range.
     *
     * @mangled SetFootSound__10CCharacterFffi
     * @address 0x1380E0
     * @size 0x130
     */
    int SetFootSound(float left_frame, float right_frame, int motion_no);

    /**
     * Selects the footstep sound set for the current ground.
     *
     * @mangled SetFootSoundID__10CCharacterFi
     * @address 0x138210
     * @size 0x10
     */
    void SetFootSoundID(int id);

    /**
     * Enables or disables motion footstep sounds.
     *
     * @mangled FootSoundEnable__10CCharacterFi
     * @address 0x138220
     * @size 0x10
     */
    void FootSoundEnable(int on);

    /**
     * Enables or disables motion events.
     *
     * @mangled EventEnable__10CCharacterFi
     * @address 0x138230
     * @size 0x10
     */
    void EventEnable(int on);

    /**
     * Adds an event to one motion frame.
     *
     * @mangled SetEvent__10CCharacterFfiii
     * @address 0x138240
     * @size 0xC0
     */
    void SetEvent(float frame, int kind, int no, int motion_no);

    /**
     * Clears events for one motion or every motion.
     *
     * @mangled ClearEvent__10CCharacterFi
     * @address 0x138300
     * @size 0x70
     */
    void ClearEvent(int motion_no);

    /**
     * Assigns a camera to every loaded motion set.
     *
     * @mangled SetMotionCamera__10CCharacterFP7CCamera
     * @address 0x138370
     * @size 0x40
     */
    void SetMotionCamera(CCamera *camera);

    /**
     * Finds the motion set and local index for a motion number.
     *
     * @mangled GetMotionParam__10CCharacterFiPiPiPiPi
     * @address 0x1383B0
     * @size 0xC0
     */
    tagMOTION_TYPE *GetMotionParam(int motion_no, int *out_index, int *out_start, int *out_end,
                                   int *out_set);

    /**
     * Gets the motion information for one motion number.
     *
     * @mangled GetMotionInfo__10CCharacterFi
     * @address 0x138470
     * @size 0x70
     */
    MOTION_INFO *GetMotionInfo(int motion_no);

    /**
     * Gets the current frame time of the active motion.
     *
     * @mangled GetNowTime__10CCharacterFv
     * @address 0x1384E0
     * @size 0x50
     */
    float GetNowTime(void);

    /**
     * Advances the model motion and fires frame events.
     *
     * @mangled Step__10CCharacterFv
     * @address 0x138530
     * @size 0x760
     */
    virtual void Step(void);

    /**
     * Synchronizes and advances the shadow motion.
     *
     * @mangled ShadowStep__10CCharacterFv
     * @address 0x138C90
     * @size 0x1C0
     */
    virtual void ShadowStep(void);

    /**
     * Advances every cloth simulation worn by the character.
     *
     * @mangled ClothStep__10CCharacterFi
     * @address 0x138E50
     * @size 0x120
     */
    virtual void ClothStep(int step);

    /**
     * Sets the floor height for every cloth simulation.
     *
     * @mangled ClothFloor__10CCharacterFi
     * @address 0x138F70
     * @size 0x40
     */
    virtual void ClothFloor(int floor);

    /**
     * Stops every cloth simulation worn by the character.
     *
     * @mangled StopCloth__10CCharacterFi
     * @address 0x13B390
     * @size 0x44
     */
    virtual void StopCloth(int unused);

    /**
     * Copies the character position to an output vector.
     *
     * @mangled GetPosition__10CCharacterFPf
     * @address 0x1390B0
     * @size 0x2C
     */
    virtual void GetPosition(float *out_position);

    /**
     * Sets the character, model, and shadow positions.
     *
     * @mangled SetPosition__10CCharacterFfff
     * @address 0x138FB0
     * @size 0x90
     */
    virtual void SetPosition(float x, float y, float z);

    /**
     * Gets the character position in world coordinates.
     *
     * @mangled GetWorldPosition__10CCharacterFPf
     * @address 0x139040
     * @size 0x70
     */
    virtual void GetWorldPosition(float *out_position);

    /**
     * Moves the character onto a reachable collision polygon.
     *
     * @mangled PickUpPoly__10CCharacterFPfP6CCPoly
     * @address 0x156710
     * @size 0x2D0
     */
    virtual int PickUpPoly(float *position, CCPoly *poly);

    /**
     * Sets the character position from a vector.
     *
     * @mangled SetPosition__10CCharacterFPf
     * @address 0x1390E0
     * @size 0x30
     */
    virtual void SetPosition(float *position);

    /**
     * Sets the character position from a three-component vector.
     *
     * @mangled SetPosition__10CCharacterF11CVector3_f_
     * @address 0x139110
     * @size 0x40
     */
    virtual void SetPosition(CVector3_f_ position);

    /**
     * Sets the character, model, and shadow rotations.
     *
     * @mangled SetRotation__10CCharacterFfff
     * @address 0x139150
     * @size 0x90
     */
    virtual void SetRotation(float x, float y, float z);

    /**
     * Sets the character rotation from a vector.
     *
     * @mangled SetRotation__10CCharacterFPf
     * @address 0x1391E0
     * @size 0x30
     */
    virtual void SetRotation(float *rotation);

    /**
     * Sets the character rotation from a three-component vector.
     *
     * @mangled SetRotation__10CCharacterF11CVector3_f_
     * @address 0x139210
     * @size 0x40
     */
    virtual void SetRotation(CVector3_f_ rotation);

    /**
     * Sets the character, model, and shadow scales.
     *
     * @mangled SetScale__10CCharacterFfff
     * @address 0x139250
     * @size 0x90
     */
    virtual void SetScale(float x, float y, float z);

    /**
     * Sets the character scale from a vector.
     *
     * @mangled SetScale__10CCharacterFPf
     * @address 0x1392E0
     * @size 0x30
     */
    virtual void SetScale(float *scale);

    /**
     * Draws the model and every cloth simulation.
     *
     * @mangled Draw__10CCharacterFv
     * @address 0x139310
     * @size 0x3F0
     */
    virtual void Draw(void);

    /**
     * Draws the character shadow below the model.
     *
     * @mangled DrawShadow__10CCharacterFv
     * @address 0x139700
     * @size 0xF0
     */
    virtual void DrawShadow(void);

    /**
     * Loads model and texture data from a character pack.
     *
     * @mangled LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_
     * @address 0x1397F0
     * @size 0x30
     */
    virtual void LoadPackData(unsigned int *pack, char *name, CDataAlloc2<1> *model_alloc,
                              CDataAlloc2<1> *texture_alloc);

    /**
     * Loads model, motion, and texture data from a character pack.
     *
     * @mangled LoadPackData__10CCharacterFPUiPcP14CDataAlloc2_1_P14CDataAlloc2_1_P14CDataAlloc2_1_
     * @address 0x139820
     * @size 0x30
     */
    virtual void LoadPackData(unsigned int *pack, char *name, CDataAlloc2<1> *model_alloc,
                              CDataAlloc2<1> *motion_alloc, CDataAlloc2<1> *texture_alloc);

    /**
     * Loads an additional motion set from a character pack.
     *
     * @mangled LoadPackData2__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_i
     * @address 0x139850
     * @size 0x40
     */
    virtual void LoadPackData2(unsigned int *pack, char *name, CDataAlloc2<1> *alloc,
                               int motion_set, CDataAlloc2<1> *extend_alloc, int unk_08);

    /**
     * Loads an additional motion set with separate read flags.
     *
     * @mangled LoadPackData3__10CCharacterFPUiPcP14CDataAlloc2_1_iP14CDataAlloc2_1_ii
     * @address 0x139890
     * @size 0x40
     */
    virtual void LoadPackData3(unsigned int *pack, char *name, CDataAlloc2<1> *alloc,
                               int motion_set, CDataAlloc2<1> *extend_alloc, int unk_08,
                               int unk_09);

    /**
     * Restores a texture block after extended character textures are deleted.
     *
     * @mangled DeleteExtendTexture__10CCharacterFi
     * @address 0x1398D0
     * @size 0xC0
     */
    void DeleteExtendTexture(int block_no);

    /**
     * Releases every extended motion set.
     *
     * @mangled DeleteExtendMotion__10CCharacterFv
     * @address 0x139990
     * @size 0x40
     */
    void DeleteExtendMotion(void);

    /**
     * Resets the character and all animation state.
     *
     * @mangled Initialize__10CCharacterFv
     * @address 0x1399D0
     * @size 0x2D0
     */
    virtual void Initialize(void);

    /** 1 while every character holds the motion where it stands. */
    static s32 MotionStopFlag;
};

STATIC_ASSERT(sizeof(CCharacter) == 0x11B0);

/**
 * Moves and animates the character that the player leads.
 */
class CMainChara : public CCharacter {
public:
    s32 unk_11B0;
    s32 unk_11B4;
    s32 unk_11B8;
    s32 unk_11BC;
    s32 unk_11C0;
    s32 unk_11C4;
    s32 unk_11C8;
    s32 unk_11CC;

    /**
     * Draws the player character.
     *
     * @mangled Draw__10CMainCharaFv
     * @address 0x139CA0
     * @size 0x20
     */
    virtual void Draw(void);

    /**
     * Puts the character at rest with no motion and nothing in hand.
     *
     * @mangled Initialize__10CMainCharaFv
     * @address 0x139CC0
     * @size 0x50
     */
    virtual void Initialize(void);
};

STATIC_ASSERT(sizeof(CMainChara) == 0x11D0);
