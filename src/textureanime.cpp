#include "textureanime.hpp"

#include <cstring>

#include "mglib.hpp"
#include "scriptinterpreter.hpp"
#include "texture.hpp"

extern CTextureAnime *pTexAnime;
extern int now_group;
extern TAG_PARAM Command__4[];
static void CommandTEX_ANIME(void **arguments);
static void CommandTEX_ANIME_DATA(void **arguments);
static void CommandTEX_ANIME_DATA2(void **arguments);
static void CommandTEX_SCROLL_DATA(void **arguments);
static void CommandTEX_ANIME_END(void **arguments);

/** The handler LoadCFGFile calls for each of Command__4's tags. */
static void (*CommandExe__4[5])(void **arguments) = {
    CommandTEX_ANIME,
    CommandTEX_ANIME_DATA,
    CommandTEX_ANIME_DATA2,
    CommandTEX_SCROLL_DATA,
    CommandTEX_ANIME_END,
};

extern int stop_anime__13CTextureAnime;

void CTextureTexAnime::Copy(CTexture *texture) {
    if (texture != NULL) {
        block = texture->block;
        width = texture->width;
        height = texture->height;
        bpp = texture->bpp;
        tex0 = texture->tex0;
        tex1 = texture->tex1;
    }
}
CTexAnimeData::CTexAnimeData(void) {
    Initialize();
}

void CTexAnimeData::Initialize() {
    unk_00 = -1;
    unk_02 = 0;
    unk_04 = 0;
    memset(&first_texture, 0, sizeof(first_texture));
    first_texture.block = -1;
    memset(&second_texture, 0, sizeof(second_texture));
    second_texture.block = -1;
    unk_3E = 0;
    unk_3C = 0;
    unk_3A = 0;
    unk_38 = 0;
    unk_42 = 0;
    unk_40 = 0;
    scroll_y = 0.0f;
    scroll_x = 0.0f;
    scroll_y_step = 0.0f;
    scroll_x_step = 0.0f;
    next = NULL;
    unk_06 = -1;
}
#ifdef NON_MATCHING
void CTextureAnime::TexAnime(int texture_block) {
    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, 0x3F, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    for (int group = 0; group < 24; group++) {
        CTexAnimeData *record = current[group];
        if (enabled[group] != 0 && record != NULL && record->unk_06 >= 0) {
            Enable(record->unk_06);
        }
    }

    for (int group = 0; group < 24; group++) {
        CTexAnimeData *record = current[group];
        if (enabled[group] == 0 || record == NULL || record->first_texture.block != texture_block ||
            record->second_texture.block != texture_block) {
            continue;
        }

        for (;;) {
            sceGsTex0 *source = (sceGsTex0 *) &record->first_texture.tex0;
            sceGsTex0 *destination = (sceGsTex0 *) &record->second_texture.tex0;
            if (record->unk_00 == 0) {
                CRect_i_ source_rect(record->unk_38, record->unk_3A, record->unk_3C,
                                     record->unk_3E);
                MGMoveImage(source, source_rect, destination, record->unk_40, record->unk_42, 0);
            } else if (record->unk_00 == 1) {
                int scroll_x = (int) record->scroll_x;
                int scroll_y = (int) record->scroll_y;
                int remaining_width = record->unk_3C - scroll_x;
                int remaining_height = record->unk_3E - scroll_y;

                if (remaining_width > 0 && remaining_height > 0) {
                    CRect_i_ rect(record->unk_38 + scroll_x, record->unk_3A + scroll_y,
                                  remaining_width, remaining_height);
                    MGMoveImage(source, rect, destination, record->unk_40, record->unk_42, 0);
                }
                if (remaining_width > 0 && scroll_y > 0) {
                    CRect_i_ rect(record->unk_38 + scroll_x, record->unk_3A, remaining_width,
                                  scroll_y);
                    MGMoveImage(source, rect, destination, record->unk_40,
                                record->unk_42 + record->unk_3E - scroll_y, 0);
                }
                if (scroll_x > 0 && remaining_height > 0) {
                    CRect_i_ rect(record->unk_38, record->unk_3A + scroll_y, scroll_x,
                                  remaining_height);
                    MGMoveImage(source, rect, destination,
                                record->unk_40 + record->unk_3C - scroll_x, record->unk_42, 0);
                }
                if (scroll_x > 0 && scroll_y > 0) {
                    CRect_i_ rect(record->unk_38, record->unk_3A, scroll_x, scroll_y);
                    MGMoveImage(source, rect, destination,
                                record->unk_40 + record->unk_3C - scroll_x,
                                record->unk_42 + record->unk_3E - scroll_y, 0);
                }
            }

            if (record->unk_00 == 1 && stop_anime__13CTextureAnime == 0) {
                if (record->scroll_x_step != 0.0f) {
                    record->scroll_x += record->scroll_x_step;
                    if (record->scroll_x >= record->unk_3C) {
                        record->scroll_x -= record->unk_3C;
                    }
                    if (record->scroll_x < 0.0f) {
                        record->scroll_x += record->unk_3C;
                    }
                }
                if (record->scroll_y_step != 0.0f) {
                    record->scroll_y += record->scroll_y_step;
                    if (record->scroll_y >= record->unk_3E) {
                        record->scroll_y -= record->unk_3E;
                    }
                    if (record->scroll_y < 0.0f) {
                        record->scroll_y += record->unk_3E;
                    }
                }
            }

            if (record->unk_04 != 0 || record->next == NULL) {
                break;
            }
            record = record->next;
        }

        if (stop_anime__13CTextureAnime == 0) {
            frame[group]++;
        }
        if (record->unk_04 < 0) {
            frame[group] = 0;
        } else if (record->unk_04 < frame[group]) {
            frame[group] = 0;
            current[group] = current[group]->next;
            if (current[group] == NULL) {
                current[group] = first[group];
            }
        }
    }

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, 0x3F, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);
}
#else
INCLUDE_ASM("asm/nonmatchings/textureanime", TexAnime__13CTextureAnimeFi);
#endif

void CTextureAnime::Initialize(CTexAnimeData *records, int count) {
    data = records;
    data_count = count;
    for (int group = 0; group < 24; group++) {
        first[group] = 0;
        current[group] = 0;
        last[group] = 0;
        frame[group] = 0;
        enabled[group] = 0;
    }
}

CTextureAnime::CTextureAnime(CTexAnimeData *records, int count) {
    Initialize(records, count);
}
CTexAnimeData *CTextureAnime::NewTexAnimeData(void) {
    if (data == NULL) {
        return NULL;
    }

    CTexAnimeData *record = data;
    for (int i = 0; i < data_count; i++, record++) {
        if (record->unk_00 == -1) {
            return record;
        }
    }
    return NULL;
}
CTexAnimeData *CTextureAnime::NewTexAnimeGroupData(int group) {
    if (group < 0 || group >= 24) {
        return NULL;
    }

    CTexAnimeData *record = NewTexAnimeData();
    if (record == NULL) {
        return NULL;
    }

    record->Initialize();
    if (last[group] != NULL) {
        last[group]->next = record;
    }
    last[group] = record;
    record->next = NULL;
    if (current[group] == NULL) {
        current[group] = record;
    }
    if (first[group] == NULL) {
        first[group] = record;
    }
    return record;
}
int CTextureAnime::EnterTexAnime(CTexAnimeData *source) {
    CTexAnimeData *record = NewTexAnimeGroupData(source->unk_02);
    if (record == NULL) {
        return 0;
    }

    record->unk_00 = source->unk_00;
    record->unk_02 = source->unk_02;
    record->unk_04 = source->unk_04;
    record->unk_06 = source->unk_06;
    record->first_texture = source->first_texture;
    record->second_texture = source->second_texture;
    record->unk_38 = source->unk_38;
    record->unk_3A = record->first_texture.height - source->unk_3A - source->unk_3E;
    record->unk_3C = source->unk_3C;
    record->unk_3E = source->unk_3E;
    record->unk_40 = source->unk_40;
    record->unk_42 = record->second_texture.height - source->unk_42 - source->unk_3E;
    record->scroll_x_step = source->scroll_x_step;
    record->scroll_y_step = source->scroll_y_step;
    return 1;
}
void CTextureAnime::DisableAll() {
    for (int group = 0; group < 24; group++) {
        Disable(group);
    }
}
void CTextureAnime::Enable(int group) {
    if (group < 0 || group >= 24) {
        return;
    }
    enabled[group] = 1;
}
void CTextureAnime::Disable(int group) {
    if (group < 0 || group >= 24) {
        return;
    }
    enabled[group] = 0;
    current[group] = first[group];
    frame[group] = 0;
}
#ifdef NON_MATCHING
void CTextureAnime::LoadCFGFile(char *script, int script_size) {
    pTexAnime = this;
    now_group = 0;
    DisableAll();

    CScriptInterpreter interpreter;
    interpreter.SetScript(script, script_size);
    interpreter.SetTAG(Command__4, 5);
    int command;
    while ((command = interpreter.GetNextTAG()) >= 0) {
        CommandExe__4[command](interpreter.arguments);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/textureanime", LoadCFGFile__13CTextureAnimeFPci);
#endif

INCLUDE_RODATA("asm/nonmatchings/textureanime", @447__2);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @448);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @449);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @450);
INCLUDE_RODATA("asm/nonmatchings/textureanime", @451);

/**
 * Enables or disables the texture-animation group selected by configuration parsing.
 *
 * @mangled CommandTEX_ANIME__FPPv
 * @address 0x167C80
 * @size 0x5C
 */
static void CommandTEX_ANIME(void **arguments) {
    now_group = *(int *) arguments[0];
    if (*(int *) arguments[1] != 0) {
        pTexAnime->Enable(now_group);
        return;
    }
    pTexAnime->Disable(now_group);
}

/**
 * Builds and appends a two-texture animation record from configuration arguments.
 *
 * @mangled CommandTEX_ANIME_DATA__FPPv
 * @address 0x167CE0
 * @size 0x180
 */
static void CommandTEX_ANIME_DATA(void **arguments) {
    CTexAnimeData record;
    record.unk_02 = (s16) now_group;
    record.unk_00 = 0;
    char *first_name = (char *) arguments[0];
    record.unk_38 = *(s16 *) arguments[1];
    record.unk_3A = *(s16 *) arguments[2];
    record.unk_3C = *(s16 *) arguments[3];
    record.unk_3E = *(s16 *) arguments[4];
    char *second_name = (char *) arguments[5];
    record.unk_40 = *(s16 *) arguments[6];
    record.unk_42 = *(s16 *) arguments[7];
    record.unk_04 = *(s16 *) arguments[8];
    if (*(int *) arguments[9] != 0) {
        record.unk_04 = -1;
    }

    CTexture *first_texture = TexManager.GetTexture(first_name, -1);
    CTexture *second_texture = TexManager.GetTexture(second_name, -1);
    memset(&record.first_texture, 0, sizeof(record.first_texture));
    record.first_texture.block = -1;
    memset(&record.second_texture, 0, sizeof(record.second_texture));
    record.second_texture.block = -1;
    if (first_texture != NULL && second_texture != NULL) {
        record.first_texture.Copy(first_texture);
        record.second_texture.Copy(second_texture);
        pTexAnime->EnterTexAnime(&record);
    }
}

/**
 * Builds and appends a two-texture animation record with an explicit auxiliary index.
 *
 * @mangled CommandTEX_ANIME_DATA2__FPPv
 * @address 0x167E60
 * @size 0x13C
 */
static void CommandTEX_ANIME_DATA2(void **arguments) {
    CTexAnimeData record;
    record.unk_02 = (s16) now_group;
    record.unk_00 = 0;
    char *first_name = (char *) arguments[0];
    record.unk_38 = *(s16 *) arguments[1];
    record.unk_3A = *(s16 *) arguments[2];
    record.unk_3C = *(s16 *) arguments[3];
    record.unk_3E = *(s16 *) arguments[4];
    char *second_name = (char *) arguments[5];
    record.unk_40 = *(s16 *) arguments[6];
    record.unk_42 = *(s16 *) arguments[7];
    record.unk_04 = *(s16 *) arguments[8];
    int hold = *(int *) arguments[9];
    record.unk_06 = *(s16 *) arguments[10];
    if (hold != 0) {
        record.unk_04 = -1;
    }

    CTexture *first_texture = TexManager.GetTexture(first_name, -1);
    CTexture *second_texture = TexManager.GetTexture(second_name, -1);
    if (first_texture != NULL && second_texture != NULL) {
        record.first_texture.Copy(first_texture);
        record.second_texture.Copy(second_texture);
        pTexAnime->EnterTexAnime(&record);
    }
}

/**
 * Builds and appends a scrolling texture-animation record from configuration arguments.
 *
 * @mangled CommandTEX_SCROLL_DATA__FPPv
 * @address 0x167FA0
 * @size 0x14C
 */
static void CommandTEX_SCROLL_DATA(void **arguments) {
    CTexAnimeData record;
    record.unk_02 = (s16) now_group;
    record.unk_00 = 1;
    char *first_name = (char *) arguments[0];
    record.unk_38 = *(s16 *) arguments[1];
    record.unk_3A = *(s16 *) arguments[2];
    record.unk_3C = *(s16 *) arguments[3];
    record.unk_3E = *(s16 *) arguments[4];
    char *second_name = (char *) arguments[5];
    record.unk_40 = *(s16 *) arguments[6];
    record.unk_42 = *(s16 *) arguments[7];
    record.scroll_x_step = *(float *) arguments[8];
    record.scroll_y_step = *(float *) arguments[9];
    record.unk_04 = *(s16 *) arguments[10];
    if (*(int *) arguments[11] != 0) {
        record.unk_04 = -1;
    }

    CTexture *first_texture = TexManager.GetTexture(first_name, -1);
    CTexture *second_texture = TexManager.GetTexture(second_name, -1);
    if (first_texture != NULL && second_texture != NULL) {
        record.first_texture.Copy(first_texture);
        record.second_texture.Copy(second_texture);
        pTexAnime->EnterTexAnime(&record);
    }
}

/**
 * Ends a texture animation command; nothing remains to be done.
 *
 * @mangled CommandTEX_ANIME_END__FPPv
 * @address 0x1680F0
 * @size 0x8
 */
static void CommandTEX_ANIME_END(void **arguments) {
}
