#include "sound.hpp"

#include <eekernel.h>
#include <libsdr.h>
#include <modmsin.h>
#include <sifrpc.h>

#include <cstdio>

#include "gameutil.hpp"

/** The MIDI player's state, one record per bank slot. */
extern MIDI_STATE midi_state;

/** The bank a load is handing to the MIDI player. */
extern MIDI_BANK gBank;

/** The sound-effect description table. */
extern SE_INF_TABLE se_inf_tbl;

/** The context of the MIDI stream input module. */
extern sceCslCtx msinCtx;

/** The stream input module's message buffers, one per effect port. */
extern MSIN_BUFFER msinBf[6];

/** IOP address the message buffers are copied to, or zero before the first start. */
extern int iopMSINBuffAddr;

MIDI_STATE *CSound::GetMidiState(void) {
    return &midi_state;
}

short *CSound::GetSeInfTbl(void) {
    return (short *) &se_inf_tbl;
}

int CSound::GetSeNo(int bank, int program) {
    int i;

    for (i = 0; i < se_inf_tbl.count; i++) {
        if (bank == se_inf_tbl.entry[i].bank && program == se_inf_tbl.entry[i].program) {
            break;
        }
    }
    if (i < se_inf_tbl.count) {
        return i;
    }
    return -1;
}

void CSound::StopVoice(int core) {
    sceSdRemote(1, rSdSetSwitch, core | SD_S_KOFF, 0xFFFFFF);
    printf("voice completed Core=%d\n", core);
}

void CSound::SetReverb(int core, int mode, int depth) {
    sceSdEffectAttr attr;

    sceSdRemote(1, rSdSetCoreAttr, SD_C_SPDIF_MODE, SD_SPDIF_COPY_PROHIBIT);
    sceSdRemote(1, rSdSetAddr, core | SD_A_EEA, 0x1FFFFF - (core << 17));
    attr.depth_L = 0;
    attr.depth_R = 0;
    attr.mode = mode | SD_REV_MODE_CLEAR_WA;
    sceSdRemote(1, rSdSetEffectAttr, core, &attr);
    sceSdRemote(1, rSdSetCoreAttr, core | SD_C_EFFECT_ENABLE, 1);
    sceSdRemote(1, rSdSetParam, core | SD_P_EVOLL, (depth << 8) & 0xFFFF);
    sceSdRemote(1, rSdSetParam, core | SD_P_EVOLR, (depth << 8) & 0xFFFF);
    sceSdRemote(1, rSdSetParam, core | SD_P_MVOLL, 0x3FFF);
    sceSdRemote(1, rSdSetParam, core | SD_P_MVOLR, 0x3FFF);
}

/**
 * Starts the sound library and sets the reverberation of both cores.
 *
 * @mangled set_spu__Fiiii
 * @address 0x143D70
 * @size 0x168
 */
void set_spu(int mode0, int mode1, int depth0, int depth1) {
    int mode[2];
    int depth[2];
    sceSdEffectAttr attr;
    int core;

    mode[0] = mode0;
    mode[1] = mode1;
    depth[0] = depth0;
    depth[1] = depth1;
    sceSdRemoteInit();
    sceSdRemote(1, rSdInit, 0);
    sceSdRemote(1, rSdSetCoreAttr, SD_C_SPDIF_MODE, SD_SPDIF_COPY_PROHIBIT);
    for (core = 0; core < 2; core++) {
        sceSdRemote(1, rSdSetAddr, core | SD_A_EEA, 0x1FFFFF - (core << 17));
        attr.depth_L = 0;
        attr.depth_R = 0;
        attr.mode = mode[core] | SD_REV_MODE_CLEAR_WA;
        sceSdRemote(1, rSdSetEffectAttr, core, &attr);
        sceSdRemote(1, rSdSetCoreAttr, core | SD_C_EFFECT_ENABLE, 1);
        sceSdRemote(1, rSdSetParam, core | SD_P_EVOLL, (depth[core] << 8) & 0xFFFF);
        sceSdRemote(1, rSdSetParam, core | SD_P_EVOLR, (depth[core] << 8) & 0xFFFF);
        sceSdRemote(1, rSdSetParam, core | SD_P_MVOLL, 0x3FFF);
        sceSdRemote(1, rSdSetParam, core | SD_P_MVOLR, 0x3FFF);
    }
}

/**
 * Copies a bank's body into the sound processor and its header into IOP memory.
 *
 * @mangled TransHdBd__Fiiii
 * @address 0x143EE0
 * @size 0x1EC
 */
int TransHdBd(int hd, int hd_size, int bd, int bd_size) {
    void *bd_address;
    void *hd_address;

    if (bd_size == 0) {
        printf("BD LOAD Err!!!!!!!!!!!!!!!!!!!!!\n");
        gBank.bd_size = 0;
        gBank.hd_address = 0;
        return -1;
    }
    if (hd_size == 0) {
        printf("HD LOAD Err!!!!!!!!!!!!!!!!!!!!!\n");
        gBank.bd_size = 0;
        gBank.hd_address = 0;
        return -1;
    }
    sceSifInitIopHeap();
    bd_address = sceSifAllocIopHeap(bd_size + 0x10);
    if (bd_address == 0) {
        printf("AllocIopHeap Err\n");
        return -1;
    }
    if (ezTransToIOP(bd_address, (void *) bd, bd_size) != 0) {
        printf("ezTransToIOP Err\n");
    }
    gBank.bd_address = bd_address;
    gBank.bd_size = bd_size;
    FlushCache(0);
    ezMidi(0x9070, (int) &gBank);
    sceSifInitIopHeap();
    sceSifFreeIopHeap(bd_address);
    sceSifInitIopHeap();
    hd_address = sceSifAllocIopHeap(hd_size + 0x10);
    if (hd_address == 0) {
        printf("AllocIopHeap Err\n");
        return -1;
    }
    printf("AllocIopHeap %d \n", hd_address);
    if (ezTransToIOP(hd_address, (void *) hd, hd_size) != 0) {
        printf("ezTransToIOP Err\n");
    }
    gBank.hd_address = hd_address;
    return 0;
}

INCLUDE_ASM("asm/nonmatchings/sound", LoadSoundFileFromPack__6CSoundFPcPUi);
INCLUDE_RODATA("asm/nonmatchings/sound", @460);
INCLUDE_RODATA("asm/nonmatchings/sound", @461);
INCLUDE_RODATA("asm/nonmatchings/sound", @462);
INCLUDE_RODATA("asm/nonmatchings/sound", @463);
INCLUDE_RODATA("asm/nonmatchings/sound", @464__2);
INCLUDE_RODATA("asm/nonmatchings/sound", @465);
INCLUDE_RODATA("asm/nonmatchings/sound", @466);
INCLUDE_RODATA("asm/nonmatchings/sound", @467__2);
INCLUDE_RODATA("asm/nonmatchings/sound", @468__2);
INCLUDE_RODATA("asm/nonmatchings/sound", @469__2);
INCLUDE_RODATA("asm/nonmatchings/sound", @470__2);
INCLUDE_RODATA("asm/nonmatchings/sound", @471);
INCLUDE_RODATA("asm/nonmatchings/sound", @472);
INCLUDE_RODATA("asm/nonmatchings/sound", @473);
INCLUDE_ASM("asm/nonmatchings/sound", LoadSqInf__6CSoundFPcPUi);
INCLUDE_RODATA("asm/nonmatchings/sound", @546);
INCLUDE_ASM("asm/nonmatchings/sound", LoadSeInf__6CSoundFPcPUi);
INCLUDE_ASM("asm/nonmatchings/sound", Init__6CSoundFiiii);
INCLUDE_RODATA("asm/nonmatchings/sound", @626__2);
INCLUDE_RODATA("asm/nonmatchings/sound", @627__2);
INCLUDE_RODATA("asm/nonmatchings/sound", @628__2);

void CSound::SQ_Play(int port, int no) {
    int address;
    int volume;

    switch (port) {
        case 0:
            if (no < midi_state.port[0].sequence_count) {
                address = (int) midi_state.port[0].sequence_address[no];
                volume = midi_state.port[0].sequence[no]->volume;
                break;
            }
            printf("###############NOT FOUND SEQ_NO=%d #####################\n", no);
            return;
        case 1:
            if (no < midi_state.port[2].sequence_count) {
                address = (int) midi_state.port[2].sequence_address[no];
                volume = midi_state.port[2].sequence[no]->volume;
                break;
            }
            printf("###############NOT FOUND SEQ_NO=%d #####################\n", no);
            return;
        case 2:
            if (no < midi_state.port[4].sequence_count) {
                address = (int) midi_state.port[4].sequence_address[no];
                volume = midi_state.port[4].sequence[no]->volume;
                break;
            }
            printf("###############NOT FOUND SEQ_NO=%d #####################\n", no);
            return;
    }
    printf("MIDI start! port=%d \n", port);
    ezMidi(port + 0x40, address);
    ezMidi(port + 0xB0, volume);
    ezMidi(port + 0x30, 0);
    ezMidi(port, 0);
}

void CSound::SQ_Play(int port, int no, int volume) {
    int address;

    switch (port) {
        case 0:
            if (no < midi_state.port[0].sequence_count) {
                address = (int) midi_state.port[0].sequence_address[no];
                break;
            }
            printf("###############NOT FOUND SEQ_NO=%d #####################\n", no);
            return;
        case 1:
            if (no < midi_state.port[2].sequence_count) {
                address = (int) midi_state.port[2].sequence_address[no];
                break;
            }
            printf("###############NOT FOUND SEQ_NO=%d #####################\n", no);
            return;
        case 2:
            if (no < midi_state.port[4].sequence_count) {
                address = (int) midi_state.port[4].sequence_address[no];
                break;
            }
            printf("###############NOT FOUND SEQ_NO=%d #####################\n", no);
            return;
    }
    ezMidi(port + 0x20, 0);
    printf("MIDI start! port=%d \n", port);
    ezMidi(port + 0x40, address);
    ezMidi(port + 0xB0, volume);
    ezMidi(port + 0x30, 0);
    ezMidi(port, 0);
}

void CSound::SQ_RePlay(int port) {
    printf("MIDI restart! port=%d \n", port);
    ezMidi(port, 0);
}

void CSound::SE_Play(int port, int bank, int program, int pan, int velocity, int volume, int voice) {
    unsigned char message[8];
    int channel;

    switch (port) {
        case 15:
            channel = 5;
            break;
        case 14:
            channel = 4;
            break;
        case 13:
            channel = 3;
            break;
        case 12:
            channel = 2;
            break;
        case 11:
            channel = 1;
            break;
        case 10:
            channel = 0;
            break;
    }
    sceMSIn_PutMsg(&msinCtx, channel, ((bank & 0x7F) << 8) | 0xC0);
    message[0] = 0xF9;
    message[1] = 0;
    message[2] = 0;
    message[3] = volume;
    message[4] = 0;
    sceMSIn_PutHsMsg(&msinCtx, channel, message);
    message[1] = 2;
    message[2] = 0;
    message[3] = 0;
    message[4] = 0x40;
    message[0] = 0xF9;
    message[1] = 1;
    message[2] = 0;
    message[3] = pan;
    message[4] = 0;
    sceMSIn_PutHsMsg(&msinCtx, channel, message);
    message[0] = 0xFD;
    message[1] = 0x10;
    message[2] = 0;
    message[3] = program;
    message[4] = voice;
    message[5] = velocity;
    message[6] = 0;
    sceMSIn_PutHsMsg(&msinCtx, channel, message);
}

void CSound::SE_Play(int port, int no, int voice) {
    SE_Play(port, se_inf_tbl.entry[no].bank, se_inf_tbl.entry[no].program, 0x40, 0x7F,
            se_inf_tbl.entry[no].volume, voice);
}

void CSound::SE_Play(int group, int bank, int program, int volume, int voice) {
    SE_Play(group, bank, program, 0x40, 0x7F, volume, voice);
}

void CSound::SE_Play(int port, int bank, int program, int voice) {
    SE_Play(port, bank, program, 0x40, 0x7F, 0x7F, voice);
}

void CSound::SE_SetVol(int port, int bank, int program, int volume, int voice) {
    unsigned char message[8];
    int channel;

    switch (port) {
        case 15:
            channel = 5;
            break;
        case 14:
            channel = 4;
            break;
        case 13:
            channel = 3;
            break;
        case 12:
            channel = 2;
            break;
        case 11:
            channel = 1;
            break;
        case 10:
            channel = 0;
            break;
    }
    sceMSIn_PutMsg(&msinCtx, channel, ((bank & 0x7F) << 8) | 0xC0);
    message[0] = 0xFD;
    message[1] = 0;
    message[2] = 0;
    message[3] = program;
    message[4] = voice;
    message[5] = volume;
    message[6] = 0;
    sceMSIn_PutHsMsg(&msinCtx, channel, message);
}

void CSound::SE_SetPan(int port, int bank, int program, int pan, int voice) {
    unsigned char message[8];
    int channel;

    switch (port) {
        case 15:
            channel = 5;
            break;
        case 14:
            channel = 4;
            break;
        case 13:
            channel = 3;
            break;
        case 12:
            channel = 2;
            break;
        case 11:
            channel = 1;
            break;
        case 10:
            channel = 0;
            break;
    }
    sceMSIn_PutMsg(&msinCtx, channel, ((bank & 0x7F) << 8) | 0xC0);
    message[0] = 0xFD;
    message[1] = 1;
    message[2] = 0;
    message[3] = program;
    message[4] = voice;
    message[5] = pan;
    message[6] = 0;
    sceMSIn_PutHsMsg(&msinCtx, channel, message);
}

void CSound::SE_SetPan(int port, int no, int pan, int voice) {
    SE_SetPan(port, se_inf_tbl.entry[no].bank, se_inf_tbl.entry[no].program, pan, voice);
}

void CSound::SE_Stop(int port, int bank, int program, int voice) {
    unsigned char message[8];
    int channel;

    switch (port) {
        case 15:
            channel = 5;
            break;
        case 14:
            channel = 4;
            break;
        case 13:
            channel = 3;
            break;
        case 12:
            channel = 2;
            break;
        case 11:
            channel = 1;
            break;
        case 10:
            channel = 0;
            break;
    }
    sceMSIn_PutMsg(&msinCtx, channel, ((bank & 0x7F) << 8) | 0xC0);
    message[0] = 0xFD;
    message[1] = 0x10;
    message[2] = 0;
    message[3] = program;
    message[4] = voice;
    message[5] = 0;
    message[6] = 0;
    sceMSIn_PutHsMsg(&msinCtx, channel, message);
}

void CSound::Fade(int port, float step, int volume) {
    switch (port) {
        case 0:
            midi_state.port[0].fade[0].active = 1;
            midi_state.port[0].fade[0].target_volume = volume;
            midi_state.port[0].fade[0].step = step;
            midi_state.port[0].fade[0].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 1:
            midi_state.port[2].fade[0].active = 1;
            midi_state.port[2].fade[0].target_volume = volume;
            midi_state.port[2].fade[0].step = step;
            midi_state.port[2].fade[0].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 2:
            midi_state.port[4].fade[0].active = 1;
            midi_state.port[4].fade[0].target_volume = volume;
            midi_state.port[4].fade[0].step = step;
            midi_state.port[4].fade[0].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 15:
            midi_state.port[1].fade[1].active = 1;
            midi_state.port[1].fade[1].target_volume = volume;
            midi_state.port[1].fade[1].step = step;
            midi_state.port[1].fade[1].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 14:
            midi_state.port[4].fade[1].active = 1;
            midi_state.port[4].fade[1].target_volume = volume;
            midi_state.port[4].fade[1].step = step;
            midi_state.port[4].fade[1].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 10:
            midi_state.port[3].fade[1].active = 1;
            midi_state.port[3].fade[1].target_volume = volume;
            midi_state.port[3].fade[1].step = step;
            midi_state.port[3].fade[1].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 13:
            midi_state.port[5].fade[1].active = 1;
            midi_state.port[5].fade[1].target_volume = volume;
            midi_state.port[5].fade[1].step = step;
            midi_state.port[5].fade[1].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 12:
            midi_state.port[6].fade[1].active = 1;
            midi_state.port[6].fade[1].target_volume = volume;
            midi_state.port[6].fade[1].step = step;
            midi_state.port[6].fade[1].volume = ezMidi(port + 0x80E0, 0);
            break;
        case 11:
            midi_state.port[7].fade[1].active = 1;
            midi_state.port[7].fade[1].target_volume = volume;
            midi_state.port[7].fade[1].step = step;
            midi_state.port[7].fade[1].volume = ezMidi(port + 0x80E0, 0);
            break;
    }
}

void CSound::Step(void) {
    int i;

    if (midi_state.port[0].fade[0].active) {
        midi_state.port[0].fade[0].volume += midi_state.port[0].fade[0].step;
        if (midi_state.port[0].fade[0].step > 0.0f && midi_state.port[0].fade[0].volume > midi_state.port[0].fade[0].target_volume) {
            midi_state.port[0].fade[0].volume = midi_state.port[0].fade[0].target_volume;
            midi_state.port[0].fade[0].active = 0;
        }
        if (midi_state.port[0].fade[0].step < 0.0f && midi_state.port[0].fade[0].volume < midi_state.port[0].fade[0].target_volume) {
            midi_state.port[0].fade[0].volume = midi_state.port[0].fade[0].target_volume;
            midi_state.port[0].fade[0].active = 0;
        }
        SetVol(0, (int) midi_state.port[0].fade[0].volume);
    }
    if (midi_state.port[2].fade[0].active) {
        midi_state.port[2].fade[0].volume += midi_state.port[2].fade[0].step;
        if (midi_state.port[2].fade[0].step > 0.0f && midi_state.port[2].fade[0].volume > midi_state.port[2].fade[0].target_volume) {
            midi_state.port[2].fade[0].volume = midi_state.port[2].fade[0].target_volume;
            midi_state.port[2].fade[0].active = 0;
        }
        if (midi_state.port[2].fade[0].step < 0.0f && midi_state.port[2].fade[0].volume < midi_state.port[2].fade[0].target_volume) {
            midi_state.port[2].fade[0].volume = midi_state.port[2].fade[0].target_volume;
            midi_state.port[2].fade[0].active = 0;
        }
        SetVol(1, (int) midi_state.port[2].fade[0].volume);
    }
    if (midi_state.port[4].fade[0].active) {
        midi_state.port[4].fade[0].volume += midi_state.port[4].fade[0].step;
        if (midi_state.port[4].fade[0].step > 0.0f && midi_state.port[4].fade[0].volume > midi_state.port[4].fade[0].target_volume) {
            midi_state.port[4].fade[0].volume = midi_state.port[4].fade[0].target_volume;
            midi_state.port[4].fade[0].active = 0;
        }
        if (midi_state.port[4].fade[0].step < 0.0f && midi_state.port[4].fade[0].volume < midi_state.port[4].fade[0].target_volume) {
            midi_state.port[4].fade[0].volume = midi_state.port[4].fade[0].target_volume;
            midi_state.port[4].fade[0].active = 0;
        }
        SetVol(2, (int) midi_state.port[4].fade[0].volume);
    }
    if (midi_state.port[1].fade[1].active) {
        midi_state.port[1].fade[1].volume += midi_state.port[1].fade[1].step;
        if (midi_state.port[1].fade[1].step > 0.0f && midi_state.port[1].fade[1].volume > midi_state.port[1].fade[1].target_volume) {
            midi_state.port[1].fade[1].volume = midi_state.port[1].fade[1].target_volume;
            midi_state.port[1].fade[1].active = 0;
        }
        if (midi_state.port[1].fade[1].step < 0.0f && midi_state.port[1].fade[1].volume < midi_state.port[1].fade[1].target_volume) {
            midi_state.port[1].fade[1].volume = midi_state.port[1].fade[1].target_volume;
            midi_state.port[1].fade[1].active = 0;
        }
        SetVol(15, (int) midi_state.port[1].fade[1].volume);
    }
    if (midi_state.port[4].fade[1].active) {
        midi_state.port[4].fade[1].volume += midi_state.port[4].fade[1].step;
        if (midi_state.port[4].fade[1].step > 0.0f && midi_state.port[4].fade[1].volume > midi_state.port[4].fade[1].target_volume) {
            midi_state.port[4].fade[1].volume = midi_state.port[4].fade[1].target_volume;
            midi_state.port[4].fade[1].active = 0;
        }
        if (midi_state.port[4].fade[1].step < 0.0f && midi_state.port[4].fade[1].volume < midi_state.port[4].fade[1].target_volume) {
            midi_state.port[4].fade[1].volume = midi_state.port[4].fade[1].target_volume;
            midi_state.port[4].fade[1].active = 0;
        }
        SetVol(14, (int) midi_state.port[4].fade[1].volume);
    }
    if (midi_state.port[3].fade[1].active) {
        midi_state.port[3].fade[1].volume += midi_state.port[3].fade[1].step;
        if (midi_state.port[3].fade[1].step > 0.0f && midi_state.port[3].fade[1].volume > midi_state.port[3].fade[1].target_volume) {
            midi_state.port[3].fade[1].volume = midi_state.port[3].fade[1].target_volume;
            midi_state.port[3].fade[1].active = 0;
        }
        if (midi_state.port[3].fade[1].step < 0.0f && midi_state.port[3].fade[1].volume < midi_state.port[3].fade[1].target_volume) {
            midi_state.port[3].fade[1].volume = midi_state.port[3].fade[1].target_volume;
            midi_state.port[3].fade[1].active = 0;
        }
        SetVol(10, (int) midi_state.port[3].fade[1].volume);
    }
    if (midi_state.port[5].fade[1].active) {
        midi_state.port[5].fade[1].volume += midi_state.port[5].fade[1].step;
        if (midi_state.port[5].fade[1].step > 0.0f && midi_state.port[5].fade[1].volume > midi_state.port[5].fade[1].target_volume) {
            midi_state.port[5].fade[1].volume = midi_state.port[5].fade[1].target_volume;
            midi_state.port[5].fade[1].active = 0;
        }
        if (midi_state.port[5].fade[1].step < 0.0f && midi_state.port[5].fade[1].volume < midi_state.port[5].fade[1].target_volume) {
            midi_state.port[5].fade[1].volume = midi_state.port[5].fade[1].target_volume;
            midi_state.port[5].fade[1].active = 0;
        }
        SetVol(13, (int) midi_state.port[5].fade[1].volume);
    }
    if (midi_state.port[6].fade[1].active) {
        midi_state.port[6].fade[1].volume += midi_state.port[6].fade[1].step;
        if (midi_state.port[6].fade[1].step > 0.0f && midi_state.port[6].fade[1].volume > midi_state.port[6].fade[1].target_volume) {
            midi_state.port[6].fade[1].volume = midi_state.port[6].fade[1].target_volume;
            midi_state.port[6].fade[1].active = 0;
        }
        if (midi_state.port[6].fade[1].step < 0.0f && midi_state.port[6].fade[1].volume < midi_state.port[6].fade[1].target_volume) {
            midi_state.port[6].fade[1].volume = midi_state.port[6].fade[1].target_volume;
            midi_state.port[6].fade[1].active = 0;
        }
        SetVol(12, (int) midi_state.port[6].fade[1].volume);
    }
    if (midi_state.port[7].fade[1].active) {
        midi_state.port[7].fade[1].volume += midi_state.port[7].fade[1].step;
        if (midi_state.port[7].fade[1].step > 0.0f && midi_state.port[7].fade[1].volume > midi_state.port[7].fade[1].target_volume) {
            midi_state.port[7].fade[1].volume = midi_state.port[7].fade[1].target_volume;
            midi_state.port[7].fade[1].active = 0;
        }
        if (midi_state.port[7].fade[1].step < 0.0f && midi_state.port[7].fade[1].volume < midi_state.port[7].fade[1].target_volume) {
            midi_state.port[7].fade[1].volume = midi_state.port[7].fade[1].target_volume;
            midi_state.port[7].fade[1].active = 0;
        }
        SetVol(11, (int) midi_state.port[7].fade[1].volume);
    }

    // Send each effect port's queued messages across to the stream input module.
    for (i = 0; i < 6; i++) {
        MSIN_BUFFER *buffer = &msinBf[i];
        s32 *length = &buffer->length;

        if (buffer->length != 0) {
            if (ezTransToIOP((void *) (iopMSINBuffAddr + i * sizeof(MSIN_BUFFER)), buffer,
                             sizeof(MSIN_BUFFER)) != 0) {
                printf("EX MIDI SEND ERR!! SIZE= %d\n", *length);
            }
            *length = 0;
        } else {
            *length = 0;
        }
    }
}

void CSound::Stop(int port) {
    ezMidi(port + 0x20, 0);
    printf("MIDI stop! %d\n", port);
}

void CSound::SetVol(int port, int volume) {
    ezMidi(port + 0xB0, volume);
}

void CSound::SetStereoMode(int mode) {
    ezMidi(0xC0, mode);
}

int CSound::LoadHdBd_A(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[0].bank != 0) {
        if (ezMidi(0x8090 + 0, 0) != 0) {
            ezMidi(0x20 + 0, 0);
        }
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[0].bank);
        midi_state.port[0].bank = 0;
        for (i = 0; i < midi_state.port[0].sequence_count; i++) {
            if (midi_state.port[0].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[0].sequence_address[i]);
            }
        }
        midi_state.port[0].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[0].spu_address;
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[0].bank = gBank.hd_address;
    ezMidi(0x9050 + 0, (int) &gBank);
    ezMidi(0xA0 + 0, 0x3020);
    ezMidi(0xB0 + 0, 0);
    return 0;
}

int CSound::LoadHdBd_C(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[1].bank != 0) {
        ezMidi(0x20 + 15, 0);
        ezMidi(0x20 + 1, 0);
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[1].bank);
        midi_state.port[1].bank = 0;
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[2].bank);
        midi_state.port[2].bank = 0;
        midi_state.port[2].spu_address = midi_state.port[1].spu_address = 0x7D010;
        for (i = 0; i < midi_state.port[1].sequence_count; i++) {
            if (midi_state.port[1].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[1].sequence_address[i]);
            }
        }
        midi_state.port[1].sequence_count = 0;
        for (i = 0; i < midi_state.port[2].sequence_count; i++) {
            if (midi_state.port[2].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[2].sequence_address[i]);
            }
        }
        midi_state.port[2].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[1].spu_address;
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[1].bank = gBank.hd_address;
    midi_state.port[2].spu_address = midi_state.port[1].spu_address + gBank.bd_size + 0x10;
    ezMidi(0x9050 + 15, (int) &gBank);
    ezMidi(0xA0 + 15, 0x3070);
    ezMidi(0xB0 + 15, 0);
    return 0;
}

int CSound::LoadHdBd_E(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[2].bank != 0) {
        if (ezMidi(0x8090 + 1, 0) != 0) {
            ezMidi(0x20 + 1, 0);
        }
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[2].bank);
        midi_state.port[2].bank = 0;
        for (i = 0; i < midi_state.port[2].sequence_count; i++) {
            if (midi_state.port[2].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[2].sequence_address[i]);
            }
        }
        midi_state.port[2].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[2].spu_address;
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[2].bank = gBank.hd_address;
    ezMidi(0x9050 + 1, (int) &gBank);
    ezMidi(0xA0 + 1, 0x3060);
    ezMidi(0xB0 + 1, 0);
    return 0;
}

int CSound::LoadHdBd_G(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[3].bank != 0) {
        ezMidi(0x20 + 10, 0);
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[3].bank);
        midi_state.port[3].bank = 0;
        for (i = 0; i < midi_state.port[3].sequence_count; i++) {
            if (midi_state.port[3].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[3].sequence_address[i]);
            }
        }
        midi_state.port[3].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[4].spu_address - (bd_size + 0x10);
    midi_state.port[3].spu_address = gBank.spu_address;
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[3].bank = gBank.hd_address;
    ezMidi(0x9050 + 10, (int) &gBank);
    ezMidi(0xA0 + 10, 0x3040);
    ezMidi(0xB0 + 10, 0);
    return 0;
}

int CSound::LoadHdBd_I(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[4].bank != 0) {
        if (ezMidi(0x8090 + 2, 0) != 0) {
            ezMidi(0x20 + 2, 0);
        }
        ezMidi(0x20 + 14, 0);
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[4].bank);
        midi_state.port[4].bank = 0;
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[3].bank);
        midi_state.port[3].bank = 0;
        midi_state.port[3].spu_address = midi_state.port[4].spu_address = 0x16E900;
        for (i = 0; i < midi_state.port[4].sequence_count; i++) {
            if (midi_state.port[4].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[4].sequence_address[i]);
            }
        }
        midi_state.port[4].sequence_count = 0;
        for (i = 0; i < midi_state.port[3].sequence_count; i++) {
            if (midi_state.port[3].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[3].sequence_address[i]);
            }
        }
        midi_state.port[3].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[4].spu_address - (bd_size + 0x10);
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[4].spu_address = gBank.spu_address;
    midi_state.port[4].bank = gBank.hd_address;
    ezMidi(0x9050 + 2, (int) &gBank);
    ezMidi(0xA0 + 2, 0x3050);
    ezMidi(0xB0 + 2, 0);
    ezMidi(0x9050 + 14, (int) &gBank);
    ezMidi(0xA0 + 14, 0x3040);
    ezMidi(0xB0 + 14, 0);
    return 0;
}

int CSound::LoadHdBd_M(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[5].bank != 0) {
        ezMidi(0x20 + 13, 0);
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[5].bank);
        midi_state.port[5].bank = 0;
        for (i = 0; i < midi_state.port[5].sequence_count; i++) {
            if (midi_state.port[5].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[5].sequence_address[i]);
            }
        }
        midi_state.port[5].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[5].spu_address;
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[5].bank = gBank.hd_address;
    ezMidi(0x9050 + 13, (int) &gBank);
    ezMidi(0xA0 + 13, 0x3080);
    ezMidi(0xB0 + 13, 0);
    return 0;
}

int CSound::LoadHdBd_Q(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[6].bank != 0) {
        ezMidi(0x20 + 12, 0);
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[6].bank);
        midi_state.port[6].bank = 0;
        for (i = 0; i < midi_state.port[6].sequence_count; i++) {
            if (midi_state.port[6].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[6].sequence_address[i]);
            }
        }
        midi_state.port[6].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[6].spu_address;
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[6].bank = gBank.hd_address;
    ezMidi(0x9050 + 12, (int) &gBank);
    ezMidi(0xA0 + 12, 0x3090);
    ezMidi(0xB0 + 12, 0);
    return 0;
}

int CSound::LoadHdBd_S(int hd, int hd_size, int bd, int bd_size) {
    int i;

    if (midi_state.port[7].bank != 0) {
        ezMidi(0x20 + 11, 0);
        sceSifInitIopHeap();
        sceSifFreeIopHeap(midi_state.port[7].bank);
        midi_state.port[7].bank = 0;
        for (i = 0; i < midi_state.port[7].sequence_count; i++) {
            if (midi_state.port[7].sequence_address[i] != 0) {
                sceSifInitIopHeap();
                sceSifFreeIopHeap(midi_state.port[7].sequence_address[i]);
            }
        }
        midi_state.port[7].sequence_count = 0;
    }
    gBank.spu_address = midi_state.port[7].spu_address;
    TransHdBd(hd, hd_size, bd, bd_size);
    midi_state.port[7].bank = gBank.hd_address;
    ezMidi(0x9050 + 11, (int) &gBank);
    ezMidi(0xA0 + 11, 0x3090);
    ezMidi(0xB0 + 11, 0);
    return 0;
}

int CSound::LoadSeq_A(int address, int size) {
    void *sequence;

    sceSifInitIopHeap();
    sequence = sceSifAllocIopHeap(0xFA00);
    if (sequence == 0) {
        printf("AllocIopHeap Err\n");
        return -1;
    }
    printf("AllocIopHeap %d \n", sequence);
    ezTransToIOP(sequence, (void *) address, size);
    midi_state.port[0].sequence_address[midi_state.port[0].sequence_count] = sequence;
    return 0;
}

int CSound::LoadSeq_E(int address, int size) {
    void *sequence;

    sceSifInitIopHeap();
    sequence = sceSifAllocIopHeap(0xFA00);
    if (sequence == 0) {
        printf("AllocIopHeap Err\n");
        return -1;
    }
    printf("AllocIopHeap %d \n", sequence);
    ezTransToIOP(sequence, (void *) address, size);
    midi_state.port[2].sequence_address[midi_state.port[2].sequence_count] = sequence;
    return 0;
}

int CSound::LoadSeq_I(int address, int size) {
    void *sequence;

    sceSifInitIopHeap();
    sequence = sceSifAllocIopHeap(0xFA00);
    if (sequence == 0) {
        printf("AllocIopHeap Err\n");
        return -1;
    }
    printf("AllocIopHeap %d \n", sequence);
    ezTransToIOP(sequence, (void *) address, size);
    midi_state.port[4].sequence_address[midi_state.port[4].sequence_count] = sequence;
    return 0;
}
