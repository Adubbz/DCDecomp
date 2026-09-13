#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 348

#include "common.h"

#include <libpkt.h>
#include <libvu0.h>

#include <cmath>

#include "editatra.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "scriptinterpreter.hpp"
#include "snd.hpp"
#include "sound.hpp"

/* The sound manager: BGM loading, playback and fading, and the SE table.
 * CSound itself is in src/sound.cpp. */

/**
 * One row of a sound-effect table: what the sound driver is asked to play,
 * which port it plays on, and where its level comes from. A row the game does
 * not use holds -1 in every signed field.
 */
struct SND_SE_INFO {
    s8 bank; /**< Bank the sound driver loads the effect from. */
    s8 prog; /**< Program within that bank. */
    s8 unk_2;
    s8 port;    /**< Port to play on; negative asks for the default port. */
    s16 vol_no; /**< Row of the sound object's effect table to take the level
                     from, or negative to play at full volume. */
};

STATIC_ASSERT(sizeof(SND_SE_INFO) == 6);

/**
 * One sound-effect sequence slot: a sound the game starts once and stops again
 * a fixed number of steps later. A slot whose sound number is negative is free.
 */
struct SND_SE_SEQ {
    s16 se_no;  /**< Sound effect the slot plays, or -1 while the slot is free. */
    s16 length; /**< Steps the sound is left playing for. */
    s16 step;   /**< Steps taken so far; the sound starts on step zero. */
    s16 voice;  /**< Voice the sound plays on. */
};

STATIC_ASSERT(sizeof(SND_SE_SEQ) == 8);

/** The fixed sound-effect table, addressed by sound number. */
extern SND_SE_INFO se_info[2801];

/** The two basic sound-effect sets, one of which is loaded at a time. */
extern SND_SE_INFO *basic_se_info[2];

/** The chapter sound-effect sets; entries the game never loads are zero. */
extern SND_SE_INFO *cap_se_info[101];

/** The character voice sets; entries the game never loads are zero. */
extern SND_SE_INFO *voice_info[11];

/** The menu sound-effect table, addressed by menu sound number. */
extern SND_SE_INFO special_se_info[65];

/** The sound-effect sequence slots. */
extern SND_SE_SEQ se_seq[32];

/** The basic sound-effect set that is loaded, or -1 for none. */
extern int basic_se_table_no;

/** The chapter sound-effect set that is loaded, or -1 for none. */
extern int se_table_no;

/** The voice set that is loaded, or -1 for none. */
extern int now_voice_set;

/**
 * Returns the table row for a sound effect, or zero when the number names no
 * row. The number selects between the fixed table, the current basic set, the
 * current chapter set and the current voice set.
 *
 * @mangled GetSeInfo__Fi
 * @address 0x15A0B0
 * @size 0x148
 */
static SND_SE_INFO *GetSeInfo(int se_no);

/**
 * Returns the port a sound effect plays on, or the default port when its row
 * does not name one.
 *
 * @mangled GetPortNo__Fi
 * @address 0x15A200
 * @size 0x38
 */
static int GetPortNo(int se_no);

/**
 * Returns the table row for a menu sound effect, or zero when the number names
 * no row.
 *
 * @mangled GetSPInfo__Fi
 * @address 0x15B5B0
 * @size 0x40
 */
static SND_SE_INFO *GetSPInfo(int se_no);

/**
 * Finds the sequence slot already playing a sound on a voice, and reports
 * through found that it did. Returns the first free slot instead when there is
 * no such slot, or zero when every slot is taken.
 *
 * @mangled GetSeSeq__FPiii
 * @address 0x15AE10
 * @size 0xC0
 */
static SND_SE_SEQ *GetSeSeq(int *found, int se_no, int voice);

/**
 * Plays a sound effect at an explicit volume and pan.
 *
 * @mangled SndSePlay__Fiffi
 * @address 0x15A760
 * @size 0xBC
 */
void SndSePlay(int se_no, float volume, float pan, int voice);

/**
 * Advances every sound-effect sequence that is running.
 *
 * @mangled SndSeSeqStep__Fv
 * @address 0x15AFA0
 * @size 0xB8
 */
static void SndSeSeqStep(void);

/**
 * Frees one sound-effect sequence slot.
 *
 * @mangled InitSeSeq__FP10SND_SE_SEQ
 * @address 0x15AE00
 * @size 0x10
 */
static void InitSeSeq(SND_SE_SEQ *seq);

EDIT_ELEMENT_ATRA *GetEditAtraData(int ground, int number) {
    if (ground < 0 || ground >= 6)
        return 0;
    if (number < 0 || number >= 100)
        return 0;
    return &EditElementData[ground][number];
}

EDIT_PARTS_ATRA *GetEditAtraPartsData(int ground, int number) {
    if (ground < 0 || ground >= 6)
        return 0;
    if (number < 0 || number >= 24)
        return 0;
    return &EditPartsData[ground].parts[number];
}

EDIT_ELEMENT_ATRA *GetEditAtraChipData(int ground, int number) {
    return GetEditAtraData(ground, number + 40);
}

INCLUDE_RODATA("asm/nonmatchings/snd", @348);
INCLUDE_RODATA("asm/nonmatchings/snd", @349);
INCLUDE_RODATA("asm/nonmatchings/snd", @350);
INCLUDE_RODATA("asm/nonmatchings/snd", @362);
INCLUDE_RODATA("asm/nonmatchings/snd", @363__2);
INCLUDE_RODATA("asm/nonmatchings/snd", @384__2);
INCLUDE_RODATA("asm/nonmatchings/snd", @514);
INCLUDE_RODATA("asm/nonmatchings/snd", @515);
INCLUDE_RODATA("asm/nonmatchings/snd", @725__2);
INCLUDE_RODATA("asm/nonmatchings/snd", @726__2);
INCLUDE_RODATA("asm/nonmatchings/snd", @751);
INCLUDE_RODATA("asm/nonmatchings/snd", @752);
INCLUDE_RODATA("asm/nonmatchings/snd", @799);
INCLUDE_RODATA("asm/nonmatchings/snd", @800);

INCLUDE_ASM("asm/nonmatchings/snd", LensFlare__FP8CTexturePfUcUcUc);
INCLUDE_ASM("asm/nonmatchings/snd", SndInit__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndInitialize__Fiiii);
INCLUDE_ASM("asm/nonmatchings/snd", SndExit__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndStep__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndInitSeTable__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndSetReadBuffer__FPUi);
INCLUDE_ASM("asm/nonmatchings/snd", SndSyncBG__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndSetCamera__FP7CCamera);
INCLUDE_ASM("asm/nonmatchings/snd", SndSetCamera__FPfPf);
INCLUDE_ASM("asm/nonmatchings/snd", GetBGMFile__FiPcPc);
INCLUDE_ASM("asm/nonmatchings/snd", SetBGMFile__FiPUiPc);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmInit__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmLoad__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmLoadBG__FiPUiPi);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmSyncBG__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmPlay__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmStop__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmRePlay__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmFadeOutStop__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetBgmNo__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndSetBgmVol__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndSetBgmVolf__Ff);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetBgmVol__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetDefaultBgmVol__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmFadeIn__Fiii);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmFadeOut__Fii);
INCLUDE_ASM("asm/nonmatchings/snd", SndBgmFadeInOut__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndCheckFade__Fv);
#ifdef NON_MATCHING
static SND_SE_INFO *GetSeInfo(int se_no) {
    SND_SE_INFO *table;

    if (se_no < 0 || se_no >= 2800) {
        return 0;
    }

    if (basic_se_table_no >= 0 && se_no >= 100 && se_no < 300) {
        return basic_se_info[basic_se_table_no] + (se_no - 100);
    }

    if (se_no >= 300 && se_no < 400 && se_table_no >= 0) {
        table = cap_se_info[se_table_no];
        if (table != 0) {
            return table + (se_no - 300);
        }
    }

    if (se_no >= 400 && se_no < 500 && now_voice_set >= 0) {
        table = voice_info[now_voice_set];
        if (table != 0) {
            return table + (se_no - 400);
        }
    }

    return &se_info[se_no];
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", GetSeInfo__Fi);
#endif
static int GetPortNo(int se_no) {
    SND_SE_INFO *info = GetSeInfo(se_no);

    if (info->port >= 0) {
        return info->port;
    }
    return 14;
}
INCLUDE_ASM("asm/nonmatchings/snd", GetSoundFile__FiPcPc);
INCLUDE_ASM("asm/nonmatchings/snd", SetSoundFile__FiPUiPc);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetNowSetNo__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndStopAllSe__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndSoundLoad__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndSoundLoadBG__FiPUiPi);
INCLUDE_ASM("asm/nonmatchings/snd", SndSoundSyncBG__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndSePlay__Fiii);
#ifdef NON_MATCHING
void SndSePlay(int se_no, float volume, float pan, int voice) {
    SND_SE_INFO *info = GetSeInfo(se_no);

    if (info != 0) {
        int vol = SndGetVolf(se_no, volume);
        int hw_pan = SndGetPanf(pan);

        if (info->vol_no < 0) {
            vol = 127;
        }
        CSnd.SE_Play(GetPortNo(se_no), info->bank, info->prog, hw_pan, 127, vol, voice);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSePlay__Fiffi);
#endif
INCLUDE_ASM("asm/nonmatchings/snd", SndSePlay__FiPfff);
#ifdef NON_MATCHING
void SndSeStop(int se_no, int voice) {
    SND_SE_INFO *info = GetSeInfo(se_no);

    if (info != 0) {
        CSnd.SE_Stop(GetPortNo(se_no), info->bank, info->prog, voice);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSeStop__Fii);
#endif
INCLUDE_ASM("asm/nonmatchings/snd", SndSetSeVol__Fiii);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetVolf__Fif);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetPanf__Ff);
#ifdef NON_MATCHING
void SndSetSeVolf(int se_no, float vol, int voice) {
    if (GetSeInfo(se_no) != 0) {
        SndSetSeVol(se_no, SndGetVolf(se_no, vol), voice);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSetSeVolf__Fifi);
#endif
#ifdef NON_MATCHING
void SndSetSePanf(int se_no, float pan, int voice) {
    SND_SE_INFO *info = GetSeInfo(se_no);

    if (info != 0) {
        int hw_pan = SndGetPanf(pan);

        CSnd.SE_SetPan(GetPortNo(se_no), info->bank, info->prog, hw_pan, voice);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSetSePanf__Fifi);
#endif
INCLUDE_ASM("asm/nonmatchings/snd", SndPlayFootSound__FiiPf);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetVolPan__FPfPfPfff);
static void InitSeSeq(SND_SE_SEQ *seq) {
    seq->se_no = -1;
}
#ifdef NON_MATCHING
static SND_SE_SEQ *GetSeSeq(int *found, int se_no, int voice) {
    int i;
    SND_SE_SEQ *slot = 0;

    *found = 0;
    for (i = 0; i < 32; i++) {
        if (se_seq[i].se_no < 0) {
            slot = &se_seq[i];
            break;
        }
    }

    if (se_no >= 0) {
        for (i = 0; i < 32; i++) {
            if (se_seq[i].se_no == se_no && se_seq[i].voice == voice) {
                *found = 1;
                return &se_seq[i];
            }
        }
    }
    return slot;
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", GetSeSeq__FPiii);
#endif
INCLUDE_ASM("asm/nonmatchings/snd", SndSeSeqInit__Fv);
#ifdef NON_MATCHING
int SndSeSeqPlayStop(int se_no, int length, int voice) {
    int found;
    SND_SE_SEQ *slot = GetSeSeq(&found, se_no, voice);

    if (slot == 0) {
        return 0;
    }

    slot->se_no = se_no;
    slot->length = length;
    if (found) {
        slot->step = 1;
    } else {
        slot->step = 0;
    }
    slot->voice = voice;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSeSeqPlayStop__Fiii);
#endif
INCLUDE_ASM("asm/nonmatchings/snd", SndSeSeqStep__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndSeSeqAllStop__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndAmbientInit__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndAmbientPlay__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndAmbientStop__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", SndAmbientSetVol__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndAmbientSetVolf__Ff);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetAmbientDefaultVol__Fv);
INCLUDE_ASM("asm/nonmatchings/snd", GetVoiceFile__FiPcPc);
INCLUDE_ASM("asm/nonmatchings/snd", SetVoiceFile__FiPUiPc);
INCLUDE_ASM("asm/nonmatchings/snd", SndVoiceLoad__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndVoiceLoadBG__FiPUiPi);
INCLUDE_ASM("asm/nonmatchings/snd", SndVoiceSyncBG__Fv);
static SND_SE_INFO *GetSPInfo(int se_no) {
    if (se_no < 0 || se_no >= 64) {
        return 0;
    }
    return &special_se_info[se_no];
}
INCLUDE_ASM("asm/nonmatchings/snd", GetSPSeFile__FiPcPc);
INCLUDE_ASM("asm/nonmatchings/snd", SetSPSeFile__FiPUiPc);
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSeLoad__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSeLoadBG__FiPUiPi);
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSeSyncBG__Fv);
#ifdef NON_MATCHING
void SndSPSePlay(int se_no, int vol) {
    SND_SE_INFO *info = GetSPInfo(se_no);

    if (info != 0) {
        if (info->vol_no < 0) {
            vol = 64;
        }
        if (vol < 0) {
            CSnd.SE_Play(12, info->vol_no, 0);
        } else {
            CSnd.SE_Play(12, info->bank, info->prog, vol, 0);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSePlay__Fii);
#endif
#ifdef NON_MATCHING
void SndSPSeStop(int se_no) {
    SND_SE_INFO *info = GetSPInfo(se_no);

    if (info != 0) {
        CSnd.SE_Stop(12, info->bank, info->prog, 0);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSeStop__Fi);
#endif
INCLUDE_ASM("asm/nonmatchings/snd", SndSetSPSeVolf__Fif);
#ifdef NON_MATCHING
void SndSetSPSePanf(int se_no, float pan) {
    if (pan < -1.0f) {
        pan = -1.0f;
    }
    if (pan > 1.0f) {
        pan = 1.0f;
    }

    SND_SE_INFO *info = GetSPInfo(se_no);
    if (info != 0) {
        CSnd.SE_SetPan(12, info->vol_no, (int)(63.0f * pan) + 64, 0);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", SndSetSPSePanf__Fif);
#endif
INCLUDE_ASM("asm/nonmatchings/snd", LoadSoundInfo__FP8SND_INFOPci);
INCLUDE_ASM("asm/nonmatchings/snd", CommandREVERBE__FPPv);
INCLUDE_ASM("asm/nonmatchings/snd", CommandTABLE__FPPv);
INCLUDE_ASM("asm/nonmatchings/snd", setbilinear__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_ii);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi);
INCLUDE_ASM("asm/nonmatchings/snd", set3DColSprite__FP13sceVif1PacketPiPiPiPiP6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc);
INCLUDE_ASM("asm/nonmatchings/snd", set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc);
INCLUDE_ASM("asm/nonmatchings/snd", set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", setColSprite__FP13sceVif1PacketPiPiPiPiUcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iif);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureP4RECTP4RECTUc);
