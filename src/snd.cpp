#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 348

#include "common.h"

#include <libpkt.h>
#include <libvu0.h>

#include <cmath>
#include <cstdio>
#include <cstring>

#include "camera.hpp"
#include "dataread.hpp"
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

/** One sound configuration read out of a sound script file. */
struct SND_INFO {
    s32 reverb_mode;   /**< Reverberation mode the REVERBE tag sets. */
    s32 reverb_depth;  /**< Reverberation depth the REVERBE tag sets. */
    s32 se_table;      /**< Sound-effect table number the TABLE tag names. */
    s32 se_table_type; /**< Sound-effect table kind the TABLE tag names. */
};

STATIC_ASSERT(sizeof(SND_INFO) == 0x10);

/**
 * Reads one sound configuration file through the script interpreter.
 *
 * @mangled LoadSoundInfo__FP8SND_INFOPci
 * @address 0x15BAB0
 * @size 0xF4
 */
static void LoadSoundInfo(SND_INFO *info, char *script, int script_size);

/** The two script tags LoadSoundInfo recognises. */
extern TAG_PARAM Command__3[2];

/** The handler LoadSoundInfo calls for each of Command__3's tags. */
extern void (*CommandExe__3[2])(void **arguments);

/** The sound configuration the command handlers fill in. */
extern SND_INFO *SoundInfo;

/** Count of entries the TABLE command has read this file. */
extern int se_list;

/**
 * Sets the reverberation the sound configuration asks for.
 *
 * @mangled CommandREVERBE__FPPv
 * @address 0x15BBB0
 * @size 0x28
 */
static void CommandREVERBE(void **arguments);

/**
 * Names the sound-effect table the configuration draws from.
 *
 * @mangled CommandTABLE__FPPv
 * @address 0x15BBE0
 * @size 0x28
 */
static void CommandTABLE(void **arguments);

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

/** Nonzero keeps the background music from starting. */
extern int bgm_off;

/** The sound-effect set that is loaded, or -1 for none. */
extern int now_sound_set;

/** The voice set that is loaded, or -1 for none. */
extern int now_voice_set;

/** The background-music set that is loaded, or -1 for none. */
extern int now_bgm_no;

/** The background music's play state: 0 while it is stopped, 1 while it plays. */
extern int now_bgm_play;

/** The background-music volume that is set now. */
extern int now_bgm_vol;

/** The background-music fade that runs: 1 while it fades in, -1 while it fades out, 0 for none. */
extern int bgm_fade;

/** The background-music fade's current volume. */
extern float now_bgm_fade_vol;

/** How far the background-music fade moves each frame. */
extern float bgm_fade_step;

/** The volume the background-music fade ends at. */
extern int bgm_fade_vol;

/** The ambient loop that is playing, or -1 for none. */
extern int now_amb_no;

/** The ambient loop's volume that is set now. */
extern int now_amb_vol;

/** Whether the ambient loop plays: zero while it is stopped, one while it plays. */
extern int now_amb_play;

/** Whether the sprites that follow draw with the bilinear filter. */
extern int linear__2;

/** Whether the sound manager has been started once already. */
extern int init_snd;

/** The buffer background sound loads read into. */
extern unsigned int *read_buffer;

/** The buffer the sound loader is pointed at. */
extern unsigned int *snd_read_buf;

/** The reverberation core's revision, read back after SetReverb. */
extern int snd_id;

/** The menu sound effect that is playing, or -1 for none. */
extern int now_sp_no;

/** The background-music set that is loading in the background, or -1 for none. */
extern int load_bgm_no;

/** The buffer the loading background-music set reads into. */
extern unsigned int *load_bgm_adr;

/** The sound-effect set that is loading in the background, or -1 for none. */
extern int load_snd_set;

/** The buffer the loading sound-effect set reads into. */
extern unsigned int *load_snd_adr;

/** The voice set that is loading in the background, or -1 for none. */
extern int load_voice_set;

/** The buffer the loading voice set reads into. */
extern unsigned int *load_voice_adr;

/** The background-music set's configuration file name. */
extern char bgm_cfg_file[32];

/** The sound-effect set's configuration file name. */
extern char snd_cfg_file[32];

/** The voice set's configuration file name. */
extern char voice_cfg_file[32];

/** Where the camera the sound pans against stands. */
extern sceVu0FVECTOR camera_pos;

/** Which way the camera the sound pans against looks. */
extern sceVu0FVECTOR camera_dir;

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

#ifdef NON_MATCHING
void LensFlare(CTexture *texture, float *position, unsigned char red, unsigned char green,
               unsigned char blue) {
    static const float flare_offset[8] = { 0.1f, 0.2f, 0.4f, 0.5f, 0.8f, 0.9f, 1.0f, 1.3f };
    static const float flare_size[8] = { 0.1f, 0.2f, 1.0f, 0.3f, 2.0f, 0.5f, 3.8f, 0.5f };
    int screen[3];
    int visible;
    int i;
    int center_x;
    int center_y;
    unsigned char alpha;

    if (texture == 0) {
        return;
    }

    visible = MGRotTransPers2D(screen, position, 0);

    for (i = 0; i < 8; i++) {
        int size = (int) (64.0f * flare_size[i]);
        int x = (int) ((float) (320 - screen[0]) * flare_offset[i]) + screen[0] - (size >> 1);
        int y = (int) ((float) (224 - screen[1]) * flare_offset[i]) + screen[1] - (size >> 1);

        if (visible && screen[0] >= 0 && screen[0] < 640 && screen[1] >= 0 && screen[1] < 448) {
            setbilinear(1);
            set2DSprite(Vif1Packet, texture, CRect_i_(x, y, size, size),
                        CRect_i_(0, 0, 0x40, 0x40));
        }
    }

    if (visible && screen[0] >= 0 && screen[0] < 640 && screen[1] >= 0 && screen[1] < 448) {
        if (screen[0] >= 320) {
            center_x = 320 - (screen[0] - 320);
        } else {
            center_x = screen[0];
        }
        if (screen[1] >= 224) {
            center_y = 224 - (screen[1] - 224);
        } else {
            center_y = screen[1];
        }

        alpha = (unsigned char) (int) ((float) ((center_x + center_y) >> 1) / 2.7f);
        MGFillBox(CRect_i_(0, 0, 0x2800, 0xE00), red, green, blue, alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", LensFlare__FP8CTexturePfUcUcUc);
#endif
/**
 * Starts the sound manager once, and loads its effect table.
 *
 * @mangled SndInit__Fv
 * @address 0x1591A0
 * @size 0x60
 */
void SndInit(void) {
    if (init_snd == 0) {
        CSnd.Init(0, 0, 0, 0);
        init_snd = 1;
        SndInitialize(4, 0x1E, 4, 5);
    }
}
void SndInitialize(int, int, int, int) {
    snd_read_buf = read_buffer;
    SndBgmInit();
    SndAmbientInit();
    SndSeSeqInit();
    now_sound_set = -1;
    now_voice_set = -1;
    snd_id = 0;
    now_amb_no = -1;
    now_amb_vol = -1;
    now_sp_no = -1;
    se_table_no = -1;
    basic_se_table_no = -1;
    load_bgm_no = -1;
    load_bgm_adr = 0;
    bgm_cfg_file[0] = 0;
    load_snd_set = -1;
    load_snd_adr = 0;
    snd_cfg_file[0] = 0;
    load_voice_set = -1;
    load_voice_adr = 0;
    voice_cfg_file[0] = 0;
}

void SndExit() {
    CSnd.Stop(0);
    CSnd.Stop(15);
    CSnd.Stop(1);
    CSnd.Stop(14);
    CSnd.Stop(10);
    CSnd.Stop(13);
    CSnd.Stop(12);
    CSnd.StopVoice(0);
    CSnd.StopVoice(1);
    SndSeSeqInit();
    SndBgmInit();
    SndAmbientInit();
}

void SndStep() {
    SndBgmFadeInOut();
    SndSeSeqStep();
    CSnd.Step();
}

void SndInitSeTable() {
    int i;
    int j;

    for (i = 0; i < 2800; i++) {
        SND_SE_INFO *info = &se_info[i];

        if (info->bank >= 0) {
            info->vol_no = CSnd.GetSeNo(info->bank, info->prog);
        }
    }

    for (j = 0; j < 100; j++) {
        SND_SE_INFO *table = cap_se_info[j];

        if (table == 0) {
            continue;
        }
        for (i = 0; i < 100; i++) {
            SND_SE_INFO *info = &table[i];

            if (info->bank == -128) {
                break;
            }
            if (info->bank >= 0) {
                info->vol_no = CSnd.GetSeNo(info->bank, info->prog);
            }
        }
    }

    for (j = 0; j < 2; j++) {
        SND_SE_INFO *table = basic_se_info[j];

        if (table == 0) {
            continue;
        }
        for (i = 0; i < 200; i++) {
            SND_SE_INFO *info = &table[i];

            if (info->bank == -128) {
                break;
            }
            if (info->bank >= 0) {
                info->vol_no = CSnd.GetSeNo(info->bank, info->prog);
            }
        }
    }

    for (j = 0; j < 10; j++) {
        SND_SE_INFO *table = voice_info[j];

        if (table == 0) {
            continue;
        }
        for (i = 0; i < 100; i++) {
            SND_SE_INFO *info = &table[i];

            if (info->bank == -128) {
                break;
            }
            if (info->bank >= 0) {
                info->vol_no = CSnd.GetSeNo(info->bank, info->prog);
            }
        }
    }

    for (i = 0; i < 64; i++) {
        SND_SE_INFO *info = &special_se_info[i];

        if (info->bank == -128) {
            break;
        }
        if (info->bank >= 0) {
            info->vol_no = CSnd.GetSeNo(info->bank, info->prog);
        }
    }
}

void SndSetReadBuffer(unsigned int *buffer) {
    int misalign = (int) buffer % 64;

    if (misalign != 0) {
        buffer = (unsigned int *) ((int) buffer + (64 - misalign));
    }
    snd_read_buf = buffer;
}
/**
 * Reports whether any of the background sound loads is still running.
 *
 * @mangled SndSyncBG__Fv
 * @address 0x159670
 * @size 0x80
 */
int SndSyncBG() {
    if (SndBgmSyncBG()) {
        return 1;
    }
    if (SndSoundSyncBG()) {
        return 1;
    }
    if (SndSPSeSyncBG()) {
        return 1;
    }
    return SndVoiceSyncBG() ? 1 : 0;
}

void SndSetCamera(CCamera *camera) {
    camera->GetPos(camera_pos);
    camera->GetDir(camera_dir);
}
/**
 * Tells the sound where the camera stands and which way it looks.
 *
 * @mangled SndSetCamera__FPfPf
 * @address 0x159740
 * @size 0x50
 */
void SndSetCamera(float *position, float *rotation) {
    sceVu0CopyVector(camera_pos, position);
    sceVu0CopyVector(camera_dir, rotation);
}
/**
 * Builds the archive and configuration file names of one music set.
 *
 * @mangled GetBGMFile__FiPcPc
 * @address 0x159790
 * @size 0x7C
 */
static void GetBGMFile(int set_no, char *archive_name, char *config_name) {
    char name[16];

    sprintf(name, "bgm%d", set_no);
    sprintf(archive_name, "sound/bgm/%s.snd", name);
    sprintf(config_name, "%s.txt", name);
}
/**
 * Hands a loaded music set to the driver and reads its configuration.
 *
 * @mangled SetBGMFile__FiPUiPc
 * @address 0x159810
 * @size 0x114
 */
static void SetBGMFile(int set_no, unsigned int *buffer, char *filename) {
    char base_name[64];
    char *dst;
    char c;
    unsigned int *packed;
    int size;
    SND_INFO info;

    SndBgmStop();
    CSnd.LoadSoundFileFromPack(filename, buffer);
    now_bgm_no = set_no;
    now_bgm_play = 0;

    dst = base_name;
    while ((c = *filename) != 0) {
        if (c == '.') {
            break;
        }
        *dst = c;
        filename++;
        dst++;
    }
    *dst = 0;

    strcat(base_name, ".cfg");
    packed = GetPackFile(buffer, base_name, &size);
    if (packed != 0) {
        LoadSoundInfo(&info, (char *) packed, size);
        CSnd.SetReverb(0, info.reverb_mode, info.reverb_depth);
        printf("core 0 rev = %d %d\n", info.reverb_mode, info.reverb_depth);
    }
}

int SndBgmInit() {
    now_bgm_no = -1;
    now_bgm_play = 0;
    now_bgm_vol = 0;
    bgm_fade = 0;
    bgm_fade_vol = 0;
    bgm_fade_step = 0.0f;
    now_bgm_fade_vol = 0.0f;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/snd", SndBgmLoad__Fi);
/**
 * Starts loading one music set in the background.
 *
 * @mangled SndBgmLoadBG__FiPUiPi
 * @address 0x1599F0
 * @size 0xC0
 */
int SndBgmLoadBG(int set_no, u_int *buffer, int *size) {
    char archive_name[128];

    if (size != 0) {
        *size = 0;
    }
    if (now_bgm_no == set_no) {
        return 0;
    }
    GetBGMFile(set_no, archive_name, bgm_cfg_file);
    printf("%d\n", set_no);
    if (LoadFileBG(archive_name, (u_long128 *) buffer, size)) {
        load_bgm_no = set_no;
        load_bgm_adr = buffer;
        return 1;
    }
    return 0;
}

int SndBgmSyncBG() {
    if (load_bgm_no < 0 || load_bgm_adr == 0) {
        return 0;
    }
    if (ReadBGSync()) {
        return 1;
    }
    SetBGMFile(load_bgm_no, load_bgm_adr, bgm_cfg_file);
    load_bgm_no = -1;
    load_bgm_adr = 0;
    return 0;
}

void SndBgmPlay(int track_no) {
    if (bgm_off == 0 && now_bgm_no >= 0 && now_bgm_play != 1) {
        CSnd.SQ_Play(0, track_no);
        now_bgm_vol = SndGetDefaultBgmVol();
        now_bgm_play = 1;
    }
}

void SndBgmStop() {
    if (now_bgm_no >= 0 && now_bgm_play != 0) {
        CSnd.Stop(0);
        CSnd.StopVoice(0);
        now_bgm_vol = 0;
        now_bgm_play = 0;
    }
}

void SndBgmRePlay() {
    if (now_bgm_no >= 0 && now_bgm_play == 2) {
        CSnd.SQ_RePlay(0);
        now_bgm_play = 1;
    }
}

void SndBgmFadeOutStop() {
    float volume = SndGetBgmVol();
    float step = volume / 10.0f;
    int i;

    for (i = 0; i < 10; i++) {
        sceGsSyncV(0);
        volume -= step;
        SndSetBgmVol((int) volume);
        SndStep();
    }
    SndBgmStop();
}

int SndBgmCheck() {
    return now_bgm_play;
}

int SndGetBgmNo() {
    return now_bgm_no;
}

/**
 * Sets the background music's volume.
 *
 * @mangled SndSetBgmVol__Fi
 * @address 0x159D20
 * @size 0x70
 */
void SndSetBgmVol(int volume) {
    if (now_bgm_no >= 0 && now_bgm_vol != volume) {
        if (volume < 0 || volume > 127) {
            return;
        }
        if (now_bgm_play != 0) {
            now_bgm_vol = volume;
            CSnd.SetVol(0, volume);
        }
    }
}
/**
 * Sets the background music's volume as a share of its default.
 *
 * @mangled SndSetBgmVolf__Ff
 * @address 0x159D90
 * @size 0x50
 */
void SndSetBgmVolf(float volume) {
    SndSetBgmVol((int) (volume * (float) SndGetDefaultBgmVol()));
}

int SndGetBgmVol() {
    return now_bgm_vol;
}

int SndGetDefaultBgmVol() {
    if (now_bgm_no < 0) {
        return 0;
    }
    return CSnd.GetMidiState()->sequence->volume;
}

/**
 * Fades the background music up to a volume over a number of steps.
 *
 * @mangled SndBgmFadeIn__Fiii
 * @address 0x159E40
 * @size 0xC8
 */
void SndBgmFadeIn(int frames, int volume, int start_volume) {
    if (frames > 0) {
        if (volume < 0) {
            volume = SndGetDefaultBgmVol();
        }
        bgm_fade_vol = volume;
        if (start_volume < 0) {
            start_volume = SndGetBgmVol();
        }
        if (start_volume != SndGetDefaultBgmVol()) {
            now_bgm_fade_vol = (float) start_volume / (float) SndGetDefaultBgmVol();
            bgm_fade = 1;
            bgm_fade_step = ((float) bgm_fade_vol - now_bgm_fade_vol) / (float) frames;
        }
    }
}
/**
 * Fades the background music down to a volume over a number of steps.
 *
 * @mangled SndBgmFadeOut__Fii
 * @address 0x159F10
 * @size 0x74
 */
void SndBgmFadeOut(int frames, int volume) {
    if (frames > 0) {
        bgm_fade_vol = volume;
        now_bgm_fade_vol = (float) SndGetBgmVol();
        bgm_fade = -1;
        bgm_fade_step = ((float) bgm_fade_vol - now_bgm_fade_vol) / (float) frames;
    }
}

void SndBgmFadeInOut() {
    float step;

    if (bgm_fade != 0) {
        now_bgm_fade_vol += bgm_fade_step;
        step = bgm_fade_step;
        if ((step < 0.0f ? -step : step) < 0.0001f) {
            bgm_fade = 0;
        }
        if (bgm_fade > 0) {
            if (now_bgm_fade_vol >= (float) bgm_fade_vol) {
                now_bgm_fade_vol = (float) bgm_fade_vol;
                bgm_fade = 0;
            }
        } else if (now_bgm_fade_vol <= (float) bgm_fade_vol) {
            now_bgm_fade_vol = (float) bgm_fade_vol;
            bgm_fade = 0;
        }
        SndSetBgmVol((int) now_bgm_fade_vol);
    }
}

int SndCheckFade() {
    return bgm_fade == 0;
}

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
static int GetPortNo(int se_no) {
    SND_SE_INFO *info = GetSeInfo(se_no);

    if (info->port >= 0) {
        return info->port;
    }
    return 14;
}
/**
 * Builds the archive and configuration file names of one sound-effect set.
 *
 * @mangled GetSoundFile__FiPcPc
 * @address 0x15A240
 * @size 0x7C
 */
static void GetSoundFile(int set_no, char *archive_name, char *config_name) {
    char name[16];

    sprintf(name, "snd%d", set_no);
    sprintf(archive_name, "sound/set/%s.snd", name);
    sprintf(config_name, "%s.txt", name);
}
/**
 * Hands a loaded sound-effect set to the driver and sets its channel volumes.
 *
 * @mangled SetSoundFile__FiPUiPc
 * @address 0x15A2C0
 * @size 0x174
 */
static void SetSoundFile(int set_no, unsigned int *buffer, char *filename) {
    char base_name[64];
    char *dst;
    char c;
    SND_INFO info;
    unsigned int *packed;
    int size;

    CSnd.LoadSoundFileFromPack(filename, buffer);
    CSnd.SetVol(15, 0x100);
    CSnd.SetVol(14, 0x100);
    CSnd.SetVol(10, 0x100);
    CSnd.SetVol(13, 0x100);
    CSnd.SetVol(12, 0x100);
    now_sound_set = set_no;
    snd_id = 0;
    now_amb_no = -1;
    SndStopAllSe();

    dst = base_name;
    while ((c = *filename) != 0) {
        if (c == '.') {
            break;
        }
        *dst = c;
        filename++;
        dst++;
    }
    *dst = 0;

    strcat(base_name, ".cfg");
    packed = GetPackFile(buffer, base_name, &size);
    if (packed != 0) {
        LoadSoundInfo(&info, (char *) packed, size);
        CSnd.SetReverb(1, info.reverb_mode, info.reverb_depth);
        basic_se_table_no = info.se_table;
        se_table_no = info.se_table_type;
    }
}

int SndGetNowSetNo() {
    return now_sound_set;
}

void SndStopAllSe() {
    CSnd.Stop(15);
    CSnd.Stop(1);
    CSnd.Stop(14);
    CSnd.Stop(10);
    CSnd.Stop(13);
    CSnd.Stop(12);
    CSnd.Stop(11);
    SndAmbientInit();
    CSnd.StopVoice(1);
}

INCLUDE_ASM("asm/nonmatchings/snd", SndSoundLoad__Fi);
/**
 * Starts loading one sound-effect set in the background.
 *
 * @mangled SndSoundLoadBG__FiPUiPi
 * @address 0x15A580
 * @size 0xAC
 */
int SndSoundLoadBG(int set_no, u_int *buffer, int *size) {
    char archive_name[128];

    if (size != 0) {
        *size = 0;
    }
    if (now_sound_set == set_no) {
        return 0;
    }
    GetSoundFile(set_no, archive_name, snd_cfg_file);
    if (LoadFileBG(archive_name, (u_long128 *) buffer, size)) {
        load_snd_set = set_no;
        load_snd_adr = buffer;
        return 1;
    }
    return 0;
}

int SndSoundSyncBG() {
    if (load_snd_set < 0 || load_snd_adr == 0) {
        return 0;
    }
    if (ReadBGSync()) {
        return 1;
    }
    SetSoundFile(load_snd_set, load_snd_adr, snd_cfg_file);
    load_snd_set = -1;
    load_snd_adr = 0;
    return 0;
}
INCLUDE_ASM("asm/nonmatchings/snd", SndSePlay__Fiii);
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

void SndSePlay(int se_no, float *position, float near, float far) {
    float volume;
    float pan;

    if (near < 0.0f) {
        near = 20.0f;
    }
    if (far < 0.0f) {
        far = 500.0f;
    }
    SndGetVolPan(&volume, &pan, position, near, far);
    SndSePlay(se_no, volume, pan, 0);
}
/**
 * Stops a sounding effect.
 *
 * @mangled SndSeStop__Fii
 * @address 0x15A8B0
 * @size 0x50
 */
void SndSeStop(int se_no, int voice) {
    SND_SE_INFO *info = GetSeInfo(se_no);

    if (info != 0) {
        CSnd.SE_Stop(GetPortNo(se_no), info->bank, info->prog, voice);
    }
}

void SndSetSeVol(int se_no, int vol, int voice) {
    SND_SE_INFO *info;

    if (vol < 0 || vol > 127) {
        return;
    }
    info = GetSeInfo(se_no);
    if (info != 0) {
        CSnd.SE_SetVol(GetPortNo(se_no), info->bank, info->prog, vol, voice);
    }
}

int SndGetVolf(int se_no, float vol) {
    SND_SE_INFO *info = GetSeInfo(se_no);
    short *table;
    int level;

    if (info == 0) {
        return 0;
    }
    table = CSnd.GetSeInfTbl();
    level = 64;
    if (info->vol_no >= 0) {
        level = table[info->vol_no * 2 + 1];
    }
    level = (int) ((float) level * vol);
    if (level < 0) {
        level = 0;
    }
    if (level > 127) {
        level = 127;
    }
    return level;
}

int SndGetPanf(float pan) {
    if (pan < -1.0f) {
        pan = -1.0f;
    }
    if (pan > 1.0f) {
        pan = 1.0f;
    }
    return (int) (63.0f * pan) + 64;
}

void SndSetSeVolf(int se_no, float vol, int voice) {
    if (GetSeInfo(se_no) != 0) {
        SndSetSeVol(se_no, SndGetVolf(se_no, vol), voice);
    }
}
void SndSetSePanf(int se_no, float pan, int voice) {
    SND_SE_INFO *info = GetSeInfo(se_no);

    if (info != 0) {
        int hw_pan = SndGetPanf(pan);

        CSnd.SE_SetPan(GetPortNo(se_no), info->bank, info->prog, hw_pan, voice);
    }
}
INCLUDE_ASM("asm/nonmatchings/snd", SndPlayFootSound__FiiPf);
INCLUDE_ASM("asm/nonmatchings/snd", SndGetVolPan__FPfPfPfff);
static void InitSeSeq(SND_SE_SEQ *seq) {
    seq->se_no = -1;
}
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

void SndSeSeqInit() {
    int i;

    for (i = 0; i < 32; i++) {
        InitSeSeq(&se_seq[i]);
    }
}
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

static void SndSeSeqStep() {
    int i;

    for (i = 0; i < 32; i++) {
        SND_SE_SEQ *seq = &se_seq[i];

        if (seq->se_no >= 0) {
            if (seq->step == 0) {
                SndSePlay(seq->se_no, -1, seq->voice);
            }
            if (seq->step >= seq->length) {
                SndSeStop(seq->se_no, seq->voice);
                InitSeSeq(seq);
            }
            seq->step++;
        }
    }
}
/**
 * Stops every sound-effect sequence.
 *
 * @mangled SndSeSeqAllStop__Fv
 * @address 0x15B060
 * @size 0x84
 */
void SndSeSeqAllStop() {
    SND_SE_SEQ *seq;
    int i;

    for (i = 0; i < 32; i++) {
        seq = &se_seq[i];

        if (seq->se_no >= 0) {
            SndSeStop(seq->se_no, seq->voice);
            InitSeSeq(seq);
            seq->step++;
        }
    }
}

int SndAmbientInit() {
    now_amb_no = -1;
    now_amb_play = 0;
    now_amb_vol = 0;
    return 1;
}

void SndAmbientPlay(int ambient_no) {
    if (now_amb_no != ambient_no || now_amb_play != 1) {
        SndAmbientStop();
        CSnd.SQ_Play(1, ambient_no);
        now_amb_no = ambient_no;
        now_amb_vol = SndGetAmbientDefaultVol();
        now_amb_play = 1;
    }
}

void SndAmbientStop() {
    if (now_amb_no >= 0 && now_amb_play != 0) {
        CSnd.Stop(1);
        now_amb_play = 0;
    }
}
/**
 * Sets the ambient loop's volume.
 *
 * @mangled SndAmbientSetVol__Fi
 * @address 0x15B1E0
 * @size 0x60
 */
void SndAmbientSetVol(int volume) {
    if (now_amb_no >= 0 && now_amb_vol != volume && volume >= 0) {
        if (volume > 127) {
            volume = 127;
        }
        now_amb_vol = volume;
        CSnd.SetVol(1, volume);
    }
}
/**
 * Sets the ambient loop's volume as a share of its default.
 *
 * @mangled SndAmbientSetVolf__Ff
 * @address 0x15B240
 * @size 0x5C
 */
void SndAmbientSetVolf(float volume) {
    if (now_amb_no >= 0) {
        int level = SndGetAmbientDefaultVol();

        SndAmbientSetVol((int) ((float) level * volume));
    }
}
INCLUDE_ASM("asm/nonmatchings/snd", SndGetAmbientDefaultVol__Fv);
/**
 * Builds the archive and configuration file names of one voice set.
 *
 * @mangled GetVoiceFile__FiPcPc
 * @address 0x15B310
 * @size 0x7C
 */
static void GetVoiceFile(int set_no, char *archive_name, char *config_name) {
    char name[16];

    sprintf(name, "voice%d", set_no);
    sprintf(archive_name, "sound/voice/%s.snd", name);
    sprintf(config_name, "%s.txt", name);
}
/**
 * Hands a loaded voice set to the driver and reads its configuration.
 *
 * @mangled SetVoiceFile__FiPUiPc
 * @address 0x15B390
 * @size 0x54
 */
static void SetVoiceFile(int voice_set, u_int *pack, char *file_name) {
    CSnd.LoadSoundFileFromPack(file_name, pack);
    CSnd.SetVol(11, 0x100);
    now_voice_set = voice_set;
}

int SndVoiceLoad(int set_no) {
    char archive_name[128];
    char config_name[32];

    if (now_voice_set == set_no) {
        return 0;
    }
    GetVoiceFile(set_no, archive_name, config_name);
    if (LoadFile2(archive_name, snd_read_buf, 0, 0)) {
        SetVoiceFile(set_no, snd_read_buf, config_name);
        return 1;
    }
    return 0;
}
/**
 * Starts loading one voice set in the background.
 *
 * @mangled SndVoiceLoadBG__FiPUiPi
 * @address 0x15B480
 * @size 0xAC
 */
int SndVoiceLoadBG(int set_no, u_int *buffer, int *size) {
    char archive_name[128];

    if (size != 0) {
        *size = 0;
    }
    if (now_voice_set == set_no) {
        return 0;
    }
    GetVoiceFile(set_no, archive_name, voice_cfg_file);
    if (LoadFileBG(archive_name, (u_long128 *) buffer, size)) {
        load_voice_set = set_no;
        load_voice_adr = buffer;
        return 1;
    }
    return 0;
}

int SndVoiceSyncBG() {
    if (load_voice_set < 0 || load_voice_adr == 0) {
        return 0;
    }
    if (ReadBGSync()) {
        return 1;
    }
    SetVoiceFile(load_voice_set, load_voice_adr, voice_cfg_file);
    load_voice_set = -1;
    load_voice_adr = 0;
    return 0;
}
static SND_SE_INFO *GetSPInfo(int se_no) {
    if (se_no < 0 || se_no >= 64) {
        return 0;
    }
    return &special_se_info[se_no];
}
/**
 * Builds the archive and configuration file names of one special-effect set.
 *
 * @mangled GetSPSeFile__FiPcPc
 * @address 0x15B5F0
 * @size 0x7C
 */
static void GetSPSeFile(int set_no, char *archive_name, char *config_name) {
    char name[16];

    sprintf(name, "sp%d", set_no);
    sprintf(archive_name, "sound/special/%s.snd", name);
    sprintf(config_name, "%s.txt", name);
}
/**
 * Hands a loaded special-effect set to the driver and reads its configuration.
 *
 * @mangled SetSPSeFile__FiPUiPc
 * @address 0x15B670
 * @size 0x54
 */
INCLUDE_ASM("asm/nonmatchings/snd", SetSPSeFile__FiPUiPc);
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSeLoad__Fi);
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSeLoadBG__FiPUiPi);
/**
 * Polls the special-effect set load and hands the file to the driver once it lands.
 *
 * @mangled SndSPSeSyncBG__Fv
 * @address 0x15B800
 * @size 0x80
 */
INCLUDE_ASM("asm/nonmatchings/snd", SndSPSeSyncBG__Fv);
/**
 * Plays one special sound effect.
 *
 * @mangled SndSPSePlay__Fii
 * @address 0x15B880
 * @size 0x7C
 */
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
void SndSPSeStop(int se_no) {
    SND_SE_INFO *info = GetSPInfo(se_no);

    if (info != 0) {
        CSnd.SE_Stop(12, info->bank, info->prog, 0);
    }
}
/**
 * Sets a special sound effect's volume as a share of its table value.
 *
 * @mangled SndSetSPSeVolf__Fif
 * @address 0x15B950
 * @size 0xB0
 */
INCLUDE_ASM("asm/nonmatchings/snd", SndSetSPSeVolf__Fif);
/**
 * Sets a special sound effect's pan as a share of the widest pan.
 *
 * @mangled SndSetSPSePanf__Fif
 * @address 0x15BA00
 * @size 0xA8
 */
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

INCLUDE_RODATA("asm/nonmatchings/snd", @799);
INCLUDE_RODATA("asm/nonmatchings/snd", @800);
/**
 * Reads one sound configuration file through the script interpreter.
 *
 * @mangled LoadSoundInfo__FP8SND_INFOPci
 * @address 0x15BAB0
 * @size 0xF4
 */
#ifdef NON_MATCHING
void LoadSoundInfo(SND_INFO *info, char *script, int script_size) {
    CScriptInterpreter interpreter;
    int i;
    int tag;

    memset(info, 0, sizeof(SND_INFO));
    for (i = 0; i < (int) sizeof(SND_INFO); i++) {
        ((s8 *) info)[i] = 0;
    }

    se_list = 0;
    SoundInfo = info;
    interpreter.SetScript(script, script_size);
    interpreter.SetTAG(Command__3, 2);
    while ((tag = interpreter.GetNextTAG()) >= 0) {
        CommandExe__3[tag](interpreter.arguments);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", LoadSoundInfo__FP8SND_INFOPci);
#endif
#ifdef NON_MATCHING
static void CommandREVERBE(void **arguments) {
    SoundInfo->reverb_mode = *(s32 *) arguments[0];
    SoundInfo->reverb_depth = *(s32 *) arguments[1];
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", CommandREVERBE__FPPv);
#endif
#ifdef NON_MATCHING
static void CommandTABLE(void **arguments) {
    SoundInfo->se_table = *(s32 *) arguments[0];
    SoundInfo->se_table_type = *(s32 *) arguments[1];
}
#else
INCLUDE_ASM("asm/nonmatchings/snd", CommandTABLE__FPPv);
#endif

void setbilinear(int on) {
    linear__2 = on;
}

INCLUDE_ASM("asm/nonmatchings/snd", setAlphaFlag__FP13sceVif1PacketP10sceGsAlpha);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_ii);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_Uc);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBAi);
INCLUDE_ASM("asm/nonmatchings/snd", set3DColSprite__FP13sceVif1PacketPiPiPiPiP6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc);
/**
 * Draws a textured sprite in world space, with four corner positions and colours.
 *
 * @mangled set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiP6spRGBA
 * @address 0x15D4B0
 * @size 0x2E0
 */
INCLUDE_ASM("asm/nonmatchings/snd", set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiP6spRGBA);
/**
 * Draws a textured sprite in world space between two projected corners.
 *
 * @mangled set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA
 * @address 0x15D790
 * @size 0x210
 */
INCLUDE_ASM("asm/nonmatchings/snd", set3DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA);
/**
 * Draws a fogged sprite in world space, with four corner positions.
 *
 * @mangled set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc
 * @address 0x15D9A0
 * @size 0x2FC
 */
INCLUDE_ASM("asm/nonmatchings/snd", set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiPiPiUc);
/**
 * Draws a fogged sprite in world space between two projected corners.
 *
 * @mangled set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA
 * @address 0x15DCA0
 * @size 0x228
 */
INCLUDE_ASM("asm/nonmatchings/snd", set3DSpriteFog__FP13sceVif1PacketP8CTextureRC8CRect_i_PiPiP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", setColSprite__FP13sceVif1PacketPiPiPiPiUcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSpriteC4__FP13sceVif1PacketRC8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iif);
INCLUDE_ASM("asm/nonmatchings/snd", set2DSpriteRot__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_iifUcUcUcUc);
/**
 * Draws a textured sprite in screen space.
 *
 * @mangled set2DSprite__FP13sceVif1PacketP8CTextureP4RECTP4RECTUc
 * @address 0x15F090
 * @size 0x68
 */
INCLUDE_ASM("asm/nonmatchings/snd", set2DSprite__FP13sceVif1PacketP8CTextureP4RECTP4RECTUc);
