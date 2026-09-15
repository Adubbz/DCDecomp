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
 *          What the MIDI player is doing. Only what the title movie reads is
 *          named; the extents are the gaps between those fields.
 */
struct MIDI_STATE {
    u8 unk_00[48];
    MIDI_SEQUENCE *sequence; /**< Sequence that plays now. */
    u8 unk_34[40];
    s32 unk_5C;
    u8 unk_60[140];
    s32 unk_EC;
    u8 unk_F0[108];
    s32 unk_15C;
    u8 unk_160[268];
    s32 unk_26C;
    u8 unk_270[124];
    s32 unk_2EC;
    u8 unk_2F0[124];
    s32 unk_36C;
};

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
    void LoadSqInf(char *, unsigned int *);

    /**
     * Reads the sound-effect description table.
     *
     * @mangled LoadSeInf__6CSoundFPcPUi
     * @address 0x144BC0
     * @size 0x198
     */
    void LoadSeInf(char *, unsigned int *);

    /**
     * Starts the sound system and its sequencer.
     *
     * @mangled Init__6CSoundFiiii
     * @address 0x144D60
     * @size 0x4C0
     */
    void Init(int, int, int, int);

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
    void LoadHdBd_A(int, int, int, int);

    /**
     * Loads the common bank into the sound processor.
     *
     * @mangled LoadHdBd_C__6CSoundFiiii
     * @address 0x146B40
     * @size 0x228
     */
    void LoadHdBd_C(int, int, int, int);

    /**
     * Loads the effect bank into the sound processor.
     *
     * @mangled LoadHdBd_E__6CSoundFiiii
     * @address 0x146D70
     * @size 0x17C
     */
    void LoadHdBd_E(int, int, int, int);

    /**
     * Loads the georama bank into the sound processor.
     *
     * @mangled LoadHdBd_G__6CSoundFiiii
     * @address 0x146EF0
     * @size 0x17C
     */
    void LoadHdBd_G(int, int, int, int);

    /**
     * Loads the interior bank into the sound processor.
     *
     * @mangled LoadHdBd_I__6CSoundFiiii
     * @address 0x147070
     * @size 0x26C
     */
    void LoadHdBd_I(int, int, int, int);

    /**
     * Loads the music bank into the sound processor.
     *
     * @mangled LoadHdBd_M__6CSoundFiiii
     * @address 0x1472E0
     * @size 0x164
     */
    void LoadHdBd_M(int, int, int, int);

    /**
     * Loads the quest bank into the sound processor.
     *
     * @mangled LoadHdBd_Q__6CSoundFiiii
     * @address 0x147450
     * @size 0x164
     */
    void LoadHdBd_Q(int, int, int, int);

    /**
     * Loads the system bank into the sound processor.
     *
     * @mangled LoadHdBd_S__6CSoundFiiii
     * @address 0x1475C0
     * @size 0x164
     */
    void LoadHdBd_S(int, int, int, int);

    /**
     * Loads the ambient sequence set through the sound processor's heap.
     *
     * @mangled LoadSeq_A__6CSoundFii
     * @address 0x147730
     * @size 0xBC
     */
    void LoadSeq_A(int, int);

    /**
     * Loads the effect sequence set through the sound processor's heap.
     *
     * @mangled LoadSeq_E__6CSoundFii
     * @address 0x1477F0
     * @size 0xBC
     */
    void LoadSeq_E(int, int);

    /**
     * Loads the interior sequence set through the sound processor's heap.
     *
     * @mangled LoadSeq_I__6CSoundFii
     * @address 0x1478B0
     * @size 0xBC
     */
    void LoadSeq_I(int, int);
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
