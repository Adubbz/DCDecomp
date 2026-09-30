#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#include "textureanime.hpp"

#include <cstring>

#include "mglib.hpp"
#include "rect.hpp"
#include "scriptinterpreter.hpp"
#include "texture.hpp"

s32            CTextureAnime::stop_anime;
CTextureAnime *pTexAnime;
int            now_group;

static void CommandTEX_ANIME(void **arguments);
static void CommandTEX_ANIME_DATA(void **arguments);
static void CommandTEX_ANIME_DATA2(void **arguments);
static void CommandTEX_SCROLL_DATA(void **arguments);
static void CommandTEX_ANIME_END(void **arguments);

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

CTexAnimeData::CTexAnimeData() {
    Initialize();
}

void CTexAnimeData::Initialize() {
    kind = -1;
    group = 0;
    duration = 0;
    memset(&first_texture, 0, sizeof(first_texture));
    first_texture.block = -1;
    memset(&second_texture, 0, sizeof(second_texture));
    second_texture.block = -1;
    source_height = 0;
    source_width = 0;
    source_y = 0;
    source_x = 0;
    dest_y = 0;
    dest_x = 0;
    scroll_y = 0.0f;
    scroll_x = 0.0f;
    scroll_y_step = 0.0f;
    scroll_x_step = 0.0f;
    next = NULL;
    linked_group = -1;
}

void CTextureAnime::TexAnime(int texture_block) {
    int x;
    int height;
    int width;
    int y;
    int to_x;
    int to_y;
    int scroll_x;
    int scroll_y;
    int group;

    sceVif1PkCnt(Vif1Packet, 0);
    sceVif1PkOpenDirectCode(Vif1Packet, 0);
    sceVif1PkOpenGifTag(Vif1Packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(Vif1Packet, 0x3F, 0);
    sceVif1PkCloseGifTag(Vif1Packet);
    sceVif1PkCloseDirectCode(Vif1Packet);

    for (int i = 0; i < 24; i++) {
        if (enabled[i] != 0 && current[i] != NULL && current[i]->linked_group >= 0) {
            Enable(current[i]->linked_group);
        }
    }

    for (group = 0; group < 24; group++) {
        if (enabled[group] == 0 || current[group] == NULL || current[group]->first_texture.block != texture_block || current[group]->second_texture.block != texture_block) {
            continue;
        }

        CTexAnimeData *record = current[group];

        for (;;) {
            if (record->kind == 0) {
                MGMoveImage((sceGsTex0 *) &record->first_texture.tex0, CRect_i_(record->source_x, record->source_y, record->source_width, record->source_height), (sceGsTex0 *) &record->second_texture.tex0, record->dest_x, record->dest_y, 0);
                if (record->source_width == record->first_texture.width && record->source_height == record->first_texture.height && record->first_texture.bpp == 1) {
                    sceGsTex0 clut_source;
                    sceGsTex0 clut_destination;

                    clut_source.bits.tbp0 = ((sceGsTex0 *) &record->first_texture.tex0)->bits.cbp;
                    clut_source.bits.tbw = 1;
                    clut_source.bits.psm = ((sceGsTex0 *) &record->first_texture.tex0)->bits.cpsm;
                    clut_destination.bits.tbp0 = ((sceGsTex0 *) &record->second_texture.tex0)->bits.cbp;
                    clut_destination.bits.tbw = 1;
                    clut_destination.bits.psm = ((sceGsTex0 *) &record->second_texture.tex0)->bits.cpsm;
                    MGMoveImage(&clut_source, CRect_i_(0, 0, 16, 16), &clut_destination, 0, 0, 0);
                }
            }

            if (record->kind == 1) {
                scroll_x = (int) record->scroll_x;
                scroll_y = (int) record->scroll_y;

                x = record->source_x + scroll_x;
                y = record->source_y + scroll_y;
                width = record->source_width - scroll_x;
                height = record->source_height - scroll_y;
                to_x = record->dest_x;
                to_y = record->dest_y;
                if (width > 0 && height > 0) {
                    MGMoveImage((sceGsTex0 *) &record->first_texture.tex0, CRect_i_(x, y, width, height), (sceGsTex0 *) &record->second_texture.tex0, to_x, to_y, 0);
                }

                x = record->source_x + scroll_x;
                y = record->source_y;
                width = record->source_width - scroll_x;
                height = scroll_y;
                to_x = record->dest_x;
                to_y = record->dest_y + record->source_height - scroll_y;
                if (width > 0 && height > 0) {
                    MGMoveImage((sceGsTex0 *) &record->first_texture.tex0, CRect_i_(x, y, width, height), (sceGsTex0 *) &record->second_texture.tex0, to_x, to_y, 0);
                }

                x = record->source_x;
                y = record->source_y + scroll_y;
                width = scroll_x;
                height = record->source_height - scroll_y;
                to_x = record->dest_x + record->source_width - scroll_x;
                to_y = record->dest_y;
                if (width > 0 && height > 0) {
                    MGMoveImage((sceGsTex0 *) &record->first_texture.tex0, CRect_i_(x, y, width, height), (sceGsTex0 *) &record->second_texture.tex0, to_x, to_y, 0);
                }

                x = record->source_x;
                y = record->source_y;
                width = scroll_x;
                height = scroll_y;
                // Unlike the other pieces of the wrapped scroll, retail places this one from source_x rather than dest_x.
                to_x = record->source_x + record->source_width - scroll_x;
                to_y = record->dest_y + record->source_height - scroll_y;
                if (width > 0 && height > 0) {
                    MGMoveImage((sceGsTex0 *) &record->first_texture.tex0, CRect_i_(x, y, width, height), (sceGsTex0 *) &record->second_texture.tex0, to_x, to_y, 0);
                }
            }

            if (record->kind == 1 && CTextureAnime::stop_anime == 0) {
                if (record->scroll_x_step != 0.0f) {
                    float scroll = record->scroll_x + record->scroll_x_step;
                    record->scroll_x = scroll;
                    if (scroll >= record->source_width) {
                        record->scroll_x = scroll - record->source_width;
                    }
                    if (record->scroll_x < 0.0f) {
                        record->scroll_x = record->source_width + record->scroll_x;
                    }
                }
                if (record->scroll_y_step != 0.0f) {
                    float scroll = record->scroll_y + record->scroll_y_step;
                    record->scroll_y = scroll;
                    if (scroll >= record->source_height) {
                        record->scroll_y = scroll - record->source_height;
                    }
                    if (record->scroll_y < 0.0f) {
                        record->scroll_y = record->source_height + record->scroll_y;
                    }
                }
            }

            if (record->duration != 0 || record->next == NULL) {
                break;
            }
            record = record->next;
        }

        if (CTextureAnime::stop_anime == 0) {
            frame[group]++;
        }
        if (record->duration < 0) {
            frame[group] = 0;
        } else if (frame[group] > record->duration) {
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

CTexAnimeData *CTextureAnime::NewTexAnimeData() {
    if (data == NULL) {
        return NULL;
    }

    CTexAnimeData *record = data;
    for (int i = 0; i < data_count; i++, record++) {
        if (record->kind == -1) {
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
    CTexAnimeData *record = NewTexAnimeGroupData(source->group);
    if (record == NULL) {
        return 0;
    }

    record->kind = source->kind;
    record->group = source->group;
    record->duration = source->duration;
    record->linked_group = source->linked_group;
    record->first_texture = source->first_texture;
    record->second_texture = source->second_texture;
    record->source_x = source->source_x;
    record->source_y = record->first_texture.height - source->source_y - source->source_height;
    record->source_width = source->source_width;
    record->source_height = source->source_height;
    record->dest_x = source->dest_x;
    record->dest_y = record->second_texture.height - source->dest_y - source->source_height;
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

/** The tags LoadCFGFile recognises, each with its argument kinds. */
static TAG_PARAM Command[5] = {
    {"TEX_ANIME",       {1, 1, -1}                                    },
    {"TEX_ANIME_DATA",  {0, 1, 1, 1, 1, 0, 1, 1, 1, 1, -1}            },
    {"TEX_ANIME_DATA2", {0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, -1}},
    {"TEX_SCROLL_DATA", {0, 1, 1, 1, 1, 0, 1, 1, 2, 2, 1, 1, -1}      },
    {"TEX_ANIME_END",   {-1}                                          },
};

/** The handler LoadCFGFile calls for each of Command's tags. */
static void (*CommandExe[5])(void **arguments) = {
    CommandTEX_ANIME,
    CommandTEX_ANIME_DATA,
    CommandTEX_ANIME_DATA2,
    CommandTEX_SCROLL_DATA,
    CommandTEX_ANIME_END,
};

void CTextureAnime::LoadCFGFile(char *script, int script_size) {
    pTexAnime = this;
    now_group = 0;
    DisableAll();

    CScriptInterpreter interpreter;
    interpreter.SetScript(script, script_size);
    interpreter.SetTAG((TAG_PARAM *) Command, 5);
    int command;
    for (;;) {
        command = interpreter.GetNextTAG();
        if (command < 0) {
            break;
        }
        CommandExe[command](interpreter.arguments);
    }
}

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
    record.group = (s16) now_group;
    record.kind = 0;
    char *first_name = (char *) arguments[0];
    record.source_x = *(s16 *) arguments[1];
    record.source_y = *(s16 *) arguments[2];
    record.source_width = *(s16 *) arguments[3];
    record.source_height = *(s16 *) arguments[4];
    char *second_name = (char *) arguments[5];
    record.dest_x = *(s16 *) arguments[6];
    record.dest_y = *(s16 *) arguments[7];
    record.duration = *(s16 *) arguments[8];
    if (*(int *) arguments[9] != 0) {
        record.duration = -1;
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
    record.group = (s16) now_group;
    record.kind = 0;
    char *first_name = (char *) arguments[0];
    record.source_x = *(s16 *) arguments[1];
    record.source_y = *(s16 *) arguments[2];
    record.source_width = *(s16 *) arguments[3];
    record.source_height = *(s16 *) arguments[4];
    char *second_name = (char *) arguments[5];
    record.dest_x = *(s16 *) arguments[6];
    record.dest_y = *(s16 *) arguments[7];
    record.duration = *(s16 *) arguments[8];
    int hold = *(int *) arguments[9];
    record.linked_group = *(s16 *) arguments[10];
    if (hold != 0) {
        record.duration = -1;
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
    record.group = (s16) now_group;
    record.kind = 1;
    char *first_name = (char *) arguments[0];
    record.source_x = *(s16 *) arguments[1];
    record.source_y = *(s16 *) arguments[2];
    record.source_width = *(s16 *) arguments[3];
    record.source_height = *(s16 *) arguments[4];
    char *second_name = (char *) arguments[5];
    record.dest_x = *(s16 *) arguments[6];
    record.dest_y = *(s16 *) arguments[7];
    record.scroll_x_step = *(float *) arguments[8];
    record.scroll_y_step = *(float *) arguments[9];
    record.duration = *(s16 *) arguments[10];
    if (*(int *) arguments[11] != 0) {
        record.duration = -1;
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
