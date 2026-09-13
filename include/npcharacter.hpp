#pragma once

#include "common.h"

#include "character.hpp"

class CCPoly;

// clang-format off
/**
 * Selects the movement or wait operation in an NPC sequence record.
 */
enum NP_SEQUENCE_OPERATION {
    NP_SEQUENCE_UNUSED = 0,
    NP_SEQUENCE_MOVE = 1,
    NP_SEQUENCE_WAIT = 2
};
// clang-format on

/**
 * Stores the destination and timing of one queued NPC action.
 */
struct NP_SEQUENCE {
    NP_SEQUENCE_OPERATION operation; /**< Operation performed by the record. */
    int wait_frames;                 /**< Frames remaining for a wait action. */
    u8 unk_08[8];
    float destination[4]; /**< Destination position of a movement action. */
    float speed[3];       /**< Movement speed values set for each coordinate. */
    u8 unk_2C[0x24];
};

STATIC_ASSERT(sizeof(NP_SEQUENCE) == 0x50);

/**
 * Controls a non-player character and its queued movement actions.
 */
class CNPCharacter {
public:
    CCharacter chara;     /**< The character that the walker draws and moves with. */
    int sequence_enabled; /**< Enables advancement of queued actions. */
    int read_index;       /**< Index of the current action. */
    int write_index;      /**< Index of the next record to fill. */
    u8 unk_11BC[4];
    NP_SEQUENCE sequences[8]; /**< Circular storage for movement and wait actions. */
    int unk_1440;
    s32 villager_id; /**< Villager-table identifier represented by this event NPC. */
    int unk_1448;
    u8 unk_144C[0x1C];
    int unk_1468;
    int enabled; /**< Enables NPC stepping, drawing, and collision queries. */
    int unk_1470;
    s32 unk_1474;
    int step_hidden;  /**< Steps the character while it is not visible. */
    s32 event_status; /**< Status value exposed to an event script for the talking NPC. */
    int unk_1480;
    int alpha_step; /**< Default alpha change per frame. */
    s32 unk_1488;
    s32 unk_148C;             /**< Texture set that the walker's model animates with. */
    s32 recurring_talk_event; /**< Event number used for repeated conversations with this villager. */
    u8 unk_1494[0xC];

    /**
     * Advances the character, its fade, and its movement sequence.
     *
     * @mangled Step__12CNPCharacterFv
     * @address 0x155FB0
     * @size 0x140
     */
    void Step(void);

    /**
     * Advances the shadow while the NPC is visible.
     *
     * @mangled ShadowStep__12CNPCharacterFv
     * @address 0x1560F0
     * @size 0x50
     */
    void ShadowStep(void);

    /**
     * Advances the current movement or wait action.
     *
     * @mangled PlaySeq__12CNPCharacterFv
     * @address 0x156140
     * @size 0x210
     */
    void PlaySeq(void);

    /**
     * Clears the action ring and enables sequence playback.
     *
     * @mangled ClearSeq__12CNPCharacterFv
     * @address 0x156350
     * @size 0x50
     */
    void ClearSeq(void);

    /**
     * Queues movement to a destination at the specified speed.
     *
     * @mangled SetSeq__12CNPCharacterFPff
     * @address 0x1563A0
     * @size 0x70
     */
    int SetSeq(float *destination, float speed);

    /**
     * Queues a wait lasting the specified frame count.
     *
     * @mangled SetWait__12CNPCharacterFi
     * @address 0x156410
     * @size 0x40
     */
    int SetWait(int frames);

    /**
     * Reports whether the action ring contains pending entries.
     *
     * @mangled CheckSeq__12CNPCharacterFv
     * @address 0x156450
     * @size 0x20
     */
    int CheckSeq(void);

    /**
     * Returns the next writable action record and advances the write index.
     *
     * @mangled GetNextSeq__12CNPCharacterFv
     * @address 0x156470
     * @size 0x40
     */
    NP_SEQUENCE *GetNextSeq(void);

    /**
     * Returns the current action record.
     *
     * @mangled GetNowSeq__12CNPCharacterFv
     * @address 0x1564B0
     * @size 0x20
     */
    NP_SEQUENCE *GetNowSeq(void);

    /**
     * Releases the current action and advances the read index.
     *
     * @mangled NextSeq__12CNPCharacterFv
     * @address 0x1564D0
     * @size 0x70
     */
    void NextSeq(void);

    /**
     * Draws the NPC with its ambient colour and alpha overrides.
     *
     * @mangled Draw__12CNPCharacterFv
     * @address 0x156540
     * @size 0xE0
     */
    void Draw(void);

    /**
     * Draws the shadow while the NPC is visible.
     *
     * @mangled DrawShadow__12CNPCharacterFv
     * @address 0x156620
     * @size 0x50
     */
    void DrawShadow(void);

    /**
     * Reports whether the enabled NPC has a model and positive alpha.
     *
     * @mangled CheckDraw__12CNPCharacterFv
     * @address 0x156670
     * @size 0x60
     */
    int CheckDraw(void);

    /**
     * Builds collision polygons for the NPC when enabled.
     *
     * @mangled PickUpPoly__12CNPCharacterFPfP6CCPoly
     * @address 0x1566D0
     * @size 0x40
     */
    int PickUpPoly(float *position, CCPoly *polygons);

    /**
     * Initializes the NPC state and clears queued actions.
     *
     * @mangled Initialize__12CNPCharacterFv
     * @address 0x1569E0
     * @size 0x90
     */
    void Initialize(void);

    /**
     * Constructs a non-player character.
     *
     * @mangled __ct__12CNPCharacterFv
     * @address 0x156A70
     * @size 0xF0
     */
    CNPCharacter(void);
};

STATIC_ASSERT(sizeof(CNPCharacter) == 0x14A0);
