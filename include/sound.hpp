#pragma once

#include "common.h"

/**
 *          One sequence the MIDI player holds, which is what the music is
 *          played and faded through.
 */
struct MIDI_SEQUENCE {
    u8 unk_00[12];
    s32 volume; /**< Volume the sequence plays at, out of 256. */
};

/**
 *          One volume fade the sequencer advances once a frame.
 */
struct MIDI_FADE {
    s32 active;        /**< Non-zero while the fade runs. */
    s32 target_volume; /**< Volume the fade stops at. */
    float volume;      /**< Volume the fade has reached. */
    float step;        /**< Volume added each frame. */
};

STATIC_ASSERT(sizeof(MIDI_FADE) == 0x10);

/**
 *          What the MIDI player holds for one port: the bank loaded into the
 *          sound processor, the sequences loaded beside it, and its fades.
 */
struct MIDI_PORT {
    void *bank;                  /**< IOP address of the port's bank header, or zero. */
    s32 spu_address;             /**< Sound processor address the port's bank body loads to. */
    void *sequence_address[10];  /**< IOP address of each loaded sequence. */
    MIDI_SEQUENCE *sequence[10]; /**< Description of each loaded sequence. */
    s32 sequence_count;          /**< Number of sequences loaded. */
    MIDI_FADE fade[2];           /**< The port's two volume fades. */
    u8 unk_7C[4];
};

STATIC_ASSERT(sizeof(MIDI_PORT) == 0x80);

/**
 *          What the MIDI player is doing, one record per port.
 */
struct MIDI_STATE {
    MIDI_PORT port[8]; /**< State of each port. */
};

STATIC_ASSERT(sizeof(MIDI_STATE) == 0x400);

/**
 *          The bank a load is handing to the MIDI player: where its header
 *          and body sit in IOP memory and where the body goes in the sound
 *          processor.
 */
struct MIDI_BANK {
    void *hd_address; /**< IOP address of the bank header. */
    void *bd_address; /**< IOP address of the bank body. */
    s32 bd_size;      /**< Size of the bank body in bytes. */
    s32 spu_address;  /**< Sound processor address the body loads to. */
    u8 unk_10[0x30];
};

STATIC_ASSERT(sizeof(MIDI_BANK) == 0x40);

/**
 *          How one sound effect is played: the bank and program it comes
 *          from and its volume.
 */
struct SE_INF {
    s8 bank;    /**< Bank the effect plays from. */
    s8 program; /**< Program within the bank. */
    s16 volume; /**< Volume the effect plays at. */
};

/**
 *          The sound-effect description table and how many entries it holds.
 */
struct SE_INF_TABLE {
    SE_INF entry[3000]; /**< Each effect's description. */
    s32 count;          /**< Number of entries read. */
};

STATIC_ASSERT(sizeof(SE_INF_TABLE) == 0x2EE4);

/**
 *          One buffer of MIDI messages queued for the stream input module,
 *          copied across to the IOP once a frame.
 */
struct MSIN_BUFFER {
    s32 size;   /**< Size of the buffer in bytes. */
    s32 length; /**< Bytes of messages waiting to be sent. */
    u8 unk_08[0x1F8];
};

STATIC_ASSERT(sizeof(MSIN_BUFFER) == 0x200);

class CSound {
public:
    /**
     * Gives the sequencer's state word.
     *
     * @mangled GetMidiState__6CSoundFv
     * @address 0x143B50
     * @size 0x10
     */
    MIDI_STATE *GetMidiState(void);

    /**
     * Gives the table describing each sound effect.
     *
     * @mangled GetSeInfTbl__6CSoundFv
     * @address 0x143B60
     * @size 0x10
     */
    short *GetSeInfTbl(void);

    /**
     * Gives the bank entry one sound effect plays from.
     *
     * @mangled GetSeNo__6CSoundFii
     * @address 0x143B70
     * @size 0x78
     */
    int GetSeNo(int, int);

    /**
     * Silences one hardware voice.
     *
     * @mangled StopVoice__6CSoundFi
     * @address 0x143BF0
     * @size 0x54
     */
    void StopVoice(int);

    /**
     * Sets the reverberation mode and depth of one channel.
     *
     * @mangled SetReverb__6CSoundFiii
     * @address 0x143C50
     * @size 0x120
     */
    void SetReverb(int, int, int);

    /**
     * Reads one sound file out of an archive.
     *
     * @mangled LoadSoundFileFromPack__6CSoundFPcPUi
     * @address 0x1440D0
     * @size 0x9B8
     */
    void LoadSoundFileFromPack(char *, unsigned int *);

    /**
     * Reads the sequence description table.
     *
     * @mangled LoadSqInf__6CSoundFPcPUi
     * @address 0x144A90
     * @size 0x12C
     */
    int LoadSqInf(char *, unsigned int *);

    /**
     * Reads the sound-effect description table.
     *
     * @mangled LoadSeInf__6CSoundFPcPUi
     * @address 0x144BC0
     * @size 0x198
     */
    int LoadSeInf(char *, unsigned int *);

    /**
     * Starts the sound system and its sequencer.
     *
     * @mangled Init__6CSoundFiiii
     * @address 0x144D60
     * @size 0x4C0
     */
    int Init(int, int, int, int);

    /**
     * Starts a sequence playing.
     *
     * @mangled SQ_Play__6CSoundFii
     * @address 0x145220
     * @size 0x1D0
     */
    void SQ_Play(int, int);

    /**
     * Starts a sequence playing at a given volume.
     *
     * @mangled SQ_Play__6CSoundFiii
     * @address 0x1453F0
     * @size 0x1A8
     */
    void SQ_Play(int, int, int);

    /**
     * Starts a sequence again from its beginning.
     *
     * @mangled SQ_RePlay__6CSoundFi
     * @address 0x1455A0
     * @size 0x44
     */
    void SQ_RePlay(int);

    /**
     * Plays one sound effect with every parameter given.
     *
     * @mangled SE_Play__6CSoundFiiiiiii
     * @address 0x1455F0
     * @size 0x1C8
     */
    void SE_Play(int, int, int, int, int, int, int);

    /**
     * Plays one sound effect, taking its parameters from the description table.
     *
     * @mangled SE_Play__6CSoundFiii
     * @address 0x1457C0
     * @size 0x60
     */
    void SE_Play(int, int, int);

    /**
     * Plays a sound effect with the default pan and priority settings.
     *
     * @mangled SE_Play__6CSoundFiiiii
     * @address 0x145820
     * @size 0x30
     */
    void SE_Play(int, int, int, int, int);

    /**
     * Plays one sound effect at the middle pan and full volume.
     *
     * @mangled SE_Play__6CSoundFiiii
     * @address 0x145850
     * @size 0x30
     */
    void SE_Play(int, int, int, int);

    /**
     * Sets the volume of a sounding effect.
     *
     * @mangled SE_SetVol__6CSoundFiiiii
     * @address 0x145880
     * @size 0x108
     */
    void SE_SetVol(int, int, int, int, int);

    /**
     * Sets the stereo position of a sounding effect.
     *
     * @mangled SE_SetPan__6CSoundFiiiii
     * @address 0x145990
     * @size 0x10C
     */
    void SE_SetPan(int, int, int, int, int);

    /**
     * Sets the stereo position of a sounding effect, naming it through the description
     * table.
     *
     * @mangled SE_SetPan__6CSoundFiiii
     * @address 0x145AA0
     * @size 0x50
     */
    void SE_SetPan(int, int, int, int);

    /**
     * Stops a sounding effect.
     *
     * @mangled SE_Stop__6CSoundFiiii
     * @address 0x145AF0
     * @size 0x100
     */
    void SE_Stop(int, int, int, int);

    /**
     * Fades a channel towards a volume over a number of steps.
     *
     * @mangled Fade__6CSoundFifi
     * @address 0x145BF0
     * @size 0x324
     */
    void Fade(int, float, int);

    /**
     * Advances the fades and the sequencer by one frame.
     *
     * @mangled Step__6CSoundFv
     * @address 0x145F20
     * @size 0x9F0
     */
    void Step(void);

    /**
     * Stops a sequence.
     *
     * @mangled Stop__6CSoundFi
     * @address 0x146910
     * @size 0x48
     */
    void Stop(int);

    /**
     * Sets a sequence's volume.
     *
     * @mangled SetVol__6CSoundFii
     * @address 0x146960
     * @size 0x28
     */
    void SetVol(int, int);

    /**
     * Chooses between stereo and monaural output.
     *
     * @mangled SetStereoMode__6CSoundFi
     * @address 0x146990
     * @size 0x24
     */
    void SetStereoMode(int);

    /**
     * Loads the ambient bank into the sound processor.
     *
     * @mangled LoadHdBd_A__6CSoundFiiii
     * @address 0x1469C0
     * @size 0x17C
     */
    int LoadHdBd_A(int, int, int, int);

    /**
     * Loads the common bank into the sound processor.
     *
     * @mangled LoadHdBd_C__6CSoundFiiii
     * @address 0x146B40
     * @size 0x228
     */
    int LoadHdBd_C(int, int, int, int);

    /**
     * Loads the effect bank into the sound processor.
     *
     * @mangled LoadHdBd_E__6CSoundFiiii
     * @address 0x146D70
     * @size 0x17C
     */
    int LoadHdBd_E(int, int, int, int);

    /**
     * Loads the georama bank into the sound processor.
     *
     * @mangled LoadHdBd_G__6CSoundFiiii
     * @address 0x146EF0
     * @size 0x17C
     */
    int LoadHdBd_G(int, int, int, int);

    /**
     * Loads the interior bank into the sound processor.
     *
     * @mangled LoadHdBd_I__6CSoundFiiii
     * @address 0x147070
     * @size 0x26C
     */
    int LoadHdBd_I(int, int, int, int);

    /**
     * Loads the music bank into the sound processor.
     *
     * @mangled LoadHdBd_M__6CSoundFiiii
     * @address 0x1472E0
     * @size 0x164
     */
    int LoadHdBd_M(int, int, int, int);

    /**
     * Loads the quest bank into the sound processor.
     *
     * @mangled LoadHdBd_Q__6CSoundFiiii
     * @address 0x147450
     * @size 0x164
     */
    int LoadHdBd_Q(int, int, int, int);

    /**
     * Loads the system bank into the sound processor.
     *
     * @mangled LoadHdBd_S__6CSoundFiiii
     * @address 0x1475C0
     * @size 0x164
     */
    int LoadHdBd_S(int, int, int, int);

    /**
     * Loads the ambient sequence set through the sound processor's heap.
     *
     * @mangled LoadSeq_A__6CSoundFii
     * @address 0x147730
     * @size 0xBC
     */
    int LoadSeq_A(int, int);

    /**
     * Loads the effect sequence set through the sound processor's heap.
     *
     * @mangled LoadSeq_E__6CSoundFii
     * @address 0x1477F0
     * @size 0xBC
     */
    int LoadSeq_E(int, int);

    /**
     * Loads the interior sequence set through the sound processor's heap.
     *
     * @mangled LoadSeq_I__6CSoundFii
     * @address 0x1478B0
     * @size 0xBC
     */
    int LoadSeq_I(int, int);
};

STATIC_ASSERT(sizeof(CSound) == 1);

/**
 * The sound driver the whole game plays through. It holds nothing of its own:
 * every call reaches the IOP module behind it.
 *
 * @address 0x2A252C
 * @size 0x1
 */
extern CSound CSnd;
