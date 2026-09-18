#include "textureanime.hpp"

#include <cstring>

#include "scriptinterpreter.hpp"
#include "texture.hpp"

#ifdef NON_MATCHING
extern CTextureAnime *pTexAnime;
extern int now_group;
extern TAG_PARAM Command__4[];
extern void (*CommandExe__4[])(void **arguments);
#endif

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
INCLUDE_ASM("asm/nonmatchings/textureanime", TexAnime__13CTextureAnimeFi);

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
#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/textureanime", EnterTexAnime__13CTextureAnimeFP13CTexAnimeData);
#endif
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
#ifdef NON_MATCHING
void CommandTEX_ANIME(void **arguments) {
    now_group = *(int *) arguments[0];
    if (*(int *) arguments[1] != 0) {
        pTexAnime->Enable(now_group);
        return;
    }
    pTexAnime->Disable(now_group);
}
#else
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_ANIME__FPPv);
#endif
#ifdef NON_MATCHING
void CommandTEX_ANIME_DATA(void **arguments) {
    CTexAnimeData record;
    record.unk_02 = (s16) now_group;
    record.unk_00 = 0;
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

    CTexture *first_texture = TexManager.GetTexture((char *) arguments[0], -1);
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
#else
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_ANIME_DATA__FPPv);
#endif
#ifdef NON_MATCHING
void CommandTEX_ANIME_DATA2(void **arguments) {
    CTexAnimeData record;
    record.unk_02 = (s16) now_group;
    record.unk_00 = 0;
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
    record.unk_06 = *(s16 *) arguments[10];

    CTexture *first_texture = TexManager.GetTexture((char *) arguments[0], -1);
    CTexture *second_texture = TexManager.GetTexture(second_name, -1);
    if (first_texture != NULL && second_texture != NULL) {
        record.first_texture.Copy(first_texture);
        record.second_texture.Copy(second_texture);
        pTexAnime->EnterTexAnime(&record);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_ANIME_DATA2__FPPv);
#endif
#ifdef NON_MATCHING
void CommandTEX_SCROLL_DATA(void **arguments) {
    CTexAnimeData record;
    record.unk_02 = (s16) now_group;
    record.unk_00 = 1;
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

    CTexture *first_texture = TexManager.GetTexture((char *) arguments[0], -1);
    CTexture *second_texture = TexManager.GetTexture(second_name, -1);
    if (first_texture != NULL && second_texture != NULL) {
        record.first_texture.Copy(first_texture);
        record.second_texture.Copy(second_texture);
        pTexAnime->EnterTexAnime(&record);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/textureanime", CommandTEX_SCROLL_DATA__FPPv);
#endif

/**
 * Ends a texture animation command; nothing remains to be done.
 *
 * @mangled CommandTEX_ANIME_END__FPPv
 * @address 0x1680F0
 * @size 0x8
 */
void CommandTEX_ANIME_END(void **arguments) {
}
