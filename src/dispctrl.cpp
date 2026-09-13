#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 230

#include "dispctrl.hpp"

#include <cstring>

#include "bound.hpp"
#include "mglib.hpp"
#include "rect.hpp"

/** Stores the fixed header at the front of a PTS archive. */
struct PTS_HEADER {
    int unk_00;
    int count; /**< Number of file records in the archive. */
    int unk_08[2];
};

/** Stores one named file record in a PTS archive. */
struct PTS_ENTRY {
    char name[16]; /**< Null-terminated file name. */
    int offset;    /**< Byte offset of the file from the archive start. */
    int unk_14[7];
};

INCLUDE_RODATA("asm/nonmatchings/dispctrl", @230);

int CBound::Sizeof() {
    return sizeof(CBound);
}

void openGiftag(sceVif1Packet *packet) {
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *reinterpret_cast<u_long128 *>(&GiftagAD));
}

/**
 * Closes the GIF tag and the direct code that openGiftag began.
 *
 * @mangled closeGiftag__FP13sceVif1Packet
 * @address 0x13DF00
 * @size 0x38
 */
void closeGiftag(sceVif1Packet *packet) {
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}
INCLUDE_ASM("asm/nonmatchings/dispctrl", Draw__10CDebugFontFv);

u_int *SearchPTS(u_int *archive, char *name) {
    int i;
    PTS_HEADER *header;
    PTS_ENTRY *entry;
    char *base;
    char c;

    header = reinterpret_cast<PTS_HEADER *>(archive);
    if (header == 0) {
        return 0;
    }
    entry = reinterpret_cast<PTS_ENTRY *>(header + 1);
    base = name;
    while ((c = *name) != 0) {
        if (c == '/') {
            base = name + 1;
        }
        name++;
    }
    for (i = 0; i < header->count; i++, entry++) {
        if (strcmp(base, entry->name) == 0) {
            return reinterpret_cast<u_int *>(reinterpret_cast<char *>(header) + entry->offset);
        }
    }
    return 0;
}

u_int *SearchPTS(u_int *archive, int index) {
    PTS_HEADER *header = reinterpret_cast<PTS_HEADER *>(archive);
    if (header == 0) {
        return 0;
    }
    if (index >= header->count) {
        return 0;
    }
    int offset = *reinterpret_cast<int *>(reinterpret_cast<char *>(archive) + index * 0x30 + 0x20);
    return reinterpret_cast<u_int *>(reinterpret_cast<char *>(archive) + offset);
}

void CDispCtrl::FadeOutStart(float speed) {
    this->speed = speed;
    rate = 0.0f;
    mode = 1;
}

void CDispCtrl::FadeInStart(float speed) {
    this->speed = speed;
    rate = 128.0f;
    mode = 2;
}

void CDispCtrl::FadeInit(float rate) {
    this->rate = rate;
    mode = -1;
}

float CDispCtrl::GetRate(void) {
    return rate;
}

float CDispCtrl::FadeOut(sceVif1Packet *packet) {
    if (mode != 1) {
        return rate;
    }
    if (rate == 0.0f && speed == 0.0f) {
        return rate;
    }

    rate += speed;
    if (rate > 128.0f) {
        rate = 128.0f;
    }

    for (s32 x = 0; x < 640; x += 64) {
        for (s32 y = 0; y < 224; y += 32) {
            CRect_i_ rect;
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, 0, 0, 0, static_cast<u8>(rate));
        }
    }

    if (rate >= 128.0f) {
        rate = 128.0f;
        speed = 0.0f;
    }
    return rate;
}

float CDispCtrl::FadeIn(sceVif1Packet *packet) {
    if (mode != 2) {
        return rate;
    }
    if (rate == 0.0f && speed == 0.0f) {
        return rate;
    }

    rate -= speed;
    if (rate < 0.0f) {
        rate = 0.0f;
    }

    for (s32 x = 0; x < 640; x += 64) {
        for (s32 y = 0; y < 224; y += 32) {
            CRect_i_ rect;
            rect.x = x * 16;
            rect.y = y * 16;
            rect.width = 1024;
            rect.height = 512;
            MGFillBox(rect, 0, 0, 0, static_cast<u8>(rate));
        }
    }

    if (rate <= 0.0f) {
        rate = 0.0f;
        speed = 0.0f;
    }
    return rate;
}
