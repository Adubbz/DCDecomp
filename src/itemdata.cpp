#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 585

#include "itemdata.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dranmapfield.hpp"
#include "dun/gameloop.hpp"
#include "dungeonmap.hpp"
#include "dungeonparts.hpp"
#include "frame.hpp"
#include "mds.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "texture.hpp"
#include "textureanime.hpp"
#include "userstatus.hpp"

/** Bytes of the item definition file that were read. */
extern int teigiFileSize;

/** Parsed string argument for each item-definition command. */
extern char argStrBuff__2[640][36];

/** Command identifier and numeric arguments for each parsed definition. */
extern float argValBuff__2[640][36];

/** Number of item-definition commands parsed so far. */
extern int argLevel__2;

/** Item-definition command names, terminated by a null entry. */
extern char *TEIGI_TABLE[];

/** Argument format associated with each item-definition command. */
extern int *TEIGI_ARG_TABLE[];

/** Scratch arena used while loading the current map. */
extern "C" CDataAlloc2<1> MapModelBuffer;

/** Parser integrity marker changed by malformed definition data. */
extern int errFlag2;

/** Randomized dungeon key selected while parsing definitions. */
extern int BtRubyDoorKey;

/** Parser command formats used to identify resource-loading directives. */
extern int TEIGI_SET_PATH[];
extern int TEIGI_GRD_IMG__2[];
extern int TEIGI_FIRE_IMG__2[];
extern int TEIGI_MINIMAP_IMG[];
extern int TEIGI_DebugFlag__2[];
extern int TEIGI_RUN_SPEED__2[];
extern int TEIGI_LIGHT_C[];
extern int TEIGI_AMBIENT__2[];
extern int TEIGI_URA_LIGHT_C[];
extern int TEIGI_URA_AMBIENT[];
extern int TEIGI_FOG__2[];
extern int TEIGI_URA_FOG[];
extern int TEIGI_BG_COL__2[];
extern int TEIGI_URA_BG_COL[];
extern int TEIGI_VIEWLEVEL[];
extern int TEIGI_BG_MODEL[];
extern int TEIGI_DUMMY_MODEL[];
extern int TEIGI_DRANS_PARTS[];
extern int TEIGI_DRANS_COLS[];
extern int TEIGI_DEF_PATS__2[];
extern int TEIGI_DEF_ENDS__2[];
extern int TEIGI_PT_BASE__2[];
extern int TEIGI_PT_COLS__2[];
extern int TEIGI_PT_CAM[];
extern int TEIGI_DRAW_FLAG[];
extern int TEIGI_PT_DRAW_FLAG[];
extern int TEIGI_PT_LIGHT[];
extern int TEIGI_PT_FIRE__2[];
extern int TEIGI_PT_HEAL_ZONE[];
extern int TEIGI_PT_WATER__2[];
extern int TEIGI_PT_NPC[];

/** Texture animation state initialized after the ground texture archive loads. */
extern "C" CTextureAnime BtTexAnime;
extern "C" CTexAnimeData BtTexAnimeData[96];

/** Directory prefix applied to resource names in the item definition file. */
extern char pathName[256];

/** Persistent caches shared by repeated dungeon-part model directives. */
extern char filePathList[72][64];
extern CFrame *frameList[72];
extern char filePathColList[144][64];
extern CFrame *frameListCol[144];
extern int filePathNum;
extern int filePathColNum;
extern int nowPartsCnt__2;

/** Scene-wide values filled from model-definition directives. */
extern int debugModeFlag__2;
extern "C" float run_speed__2;
extern "C" sceVu0FMATRIX main_light;
extern "C" sceVu0FMATRIX main_lightcolor;
extern "C" sceVu0FMATRIX sub_light;
extern "C" sceVu0FMATRIX sub_lightcolor;
extern "C" sceVu0FVECTOR main_ambientlight;
extern "C" sceVu0FVECTOR sub_ambientlight;
extern "C" float main_fogRate[4];
extern "C" float sub_fogRate[4];
extern "C" u8 main_fogColor[3];
extern "C" u8 sub_fogColor[3];
extern u8 main_bgColor[3];
extern u8 sub_bgColor[3];
extern u_int *read_buffer;

/**
 * Steps the item definition file past whitespace and comments.
 *
 * @mangled skipSpace__FPci__2
 * @address 0x1CD910
 * @size 0x110
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
int skipSpace(char *text, int pos) {
    for (; pos < teigiFileSize; pos++) {
        int skipped = 0;
        // The file is Shift-JIS, so a space can be the full-width one.
        if (memcmp(&text[pos], "\x81\x40", 2) == 0) {
            pos++;
            skipped = 1;
        }
        char c = text[pos];
        if (c == ' ') {
            skipped = 1;
        }
        if (c == '\t') {
            skipped = 1;
        }
        if (c == '\0') {
            pos++;
            skipped = 1;
        }
        if (memcmp(&text[pos], "//", 2) == 0) {
            while (text[pos] != '\0') {
                pos++;
            }
            pos++;
            skipped = 1;
        }
        if (skipped == 0) {
            return pos;
        }
    }
    return teigiFileSize;
}

/**
 * Reads one argument out of the item definition file.
 *
 * @mangled checkArg__FPciPi__2
 * @address 0x1CDA20
 * @size 0x664
 * @note disambiguated by disassembler ("__2" suffix); real retail name has no suffix
 */
int checkArg(char *text, int pos, int *format) {
    enum ARGUMENT_KIND {
        ARGUMENT_STRING = 0,
        ARGUMENT_COMMA_NUMBER = 1,
        ARGUMENT_NUMBER = 2,
    };

    int argument;
    int cursor;
    int length;
    int numeric;

    cursor = pos;
    if (format[1] == 0) {
        return pos;
    }
    for (argument = 0; argument < format[1]; argument++) {
        argValBuff__2[argLevel__2][0] = (float) format[0];
        switch (format[argument + 2]) {
            case ARGUMENT_STRING:
                if (text[cursor] != '"') {
                    return -1;
                }
                cursor++;
                for (length = 0; length < 32; length++) {
                    if (text[cursor] == '"') {
                        argStrBuff__2[argLevel__2][length] = '\0';
                        cursor++;
                        break;
                    }
                    argStrBuff__2[argLevel__2][length] = text[cursor++];
                }
                if (length == 32) {
                    return -1;
                }
                cursor = skipSpace(text, cursor);
                break;
            case ARGUMENT_COMMA_NUMBER:
                if (text[cursor] != ',') {
                    return -1;
                }
                cursor = skipSpace(text, cursor + 1);
                if (memcmp(&text[cursor], "ON", 2) == 0) {
                    argValBuff__2[argLevel__2][argument + 1] = 1.0f;
                    if (argument >= 32) {
                        printf("************TAG OVER!!\n");
                    }
                    cursor += 2;
                } else if (memcmp(&text[cursor], "OFF", 3) == 0) {
                    argValBuff__2[argLevel__2][argument + 1] = 0.0f;
                    if (argument >= 32) {
                        printf("************TAG OVER!!\n");
                    }
                    cursor += 3;
                } else {
                    numeric = 0;
                    if (text[cursor] == '-') {
                        numeric = 1;
                    }
                    if (text[cursor] >= '0' && text[cursor] <= '9') {
                        numeric = 1;
                    }
                    if (numeric == 0) {
                        return -1;
                    }
                    argValBuff__2[argLevel__2][argument + 1] = (float) atof(&text[cursor]);
                    if (argument >= 32) {
                        printf("************TAG OVER!!\n");
                    }
                    for (length = 0; length < 32; length++) {
                        numeric = 0;
                        if (text[cursor] == '-') {
                            cursor++;
                            numeric = 1;
                        }
                        if (text[cursor] >= '0' && text[cursor] <= '9') {
                            cursor++;
                            numeric = 1;
                        }
                        if (text[cursor] == '.') {
                            cursor++;
                            numeric = 1;
                        }
                        if (numeric == 0) {
                            break;
                        }
                    }
                    if (length == 32) {
                        return -1;
                    }
                }
                cursor = skipSpace(text, cursor);
                break;
            case ARGUMENT_NUMBER:
                if (memcmp(&text[cursor], "ON", 2) == 0) {
                    argValBuff__2[argLevel__2][argument + 1] = 1.0f;
                    if (argument >= 32) {
                        printf("************TAG OVER!!\n");
                    }
                    cursor += 2;
                } else if (memcmp(&text[cursor], "OFF", 3) == 0) {
                    argValBuff__2[argLevel__2][argument + 1] = 0.0f;
                    if (argument >= 32) {
                        printf("************TAG OVER!!\n");
                    }
                    cursor += 3;
                } else {
                    numeric = 0;
                    if (text[cursor] == '-') {
                        numeric = 1;
                    }
                    if (text[cursor] >= '0' && text[cursor] <= '9') {
                        numeric = 1;
                    }
                    if (numeric == 0) {
                        return -1;
                    }
                    argValBuff__2[argLevel__2][argument + 1] = (float) atof(&text[cursor]);
                    if (argument >= 32) {
                        printf("************TAG OVER!!\n");
                    }
                    for (length = 0; length < 32; length++) {
                        numeric = 0;
                        if (text[cursor] == '-') {
                            cursor++;
                            numeric = 1;
                        }
                        if (text[cursor] >= '0' && text[cursor] <= '9') {
                            cursor++;
                            numeric = 1;
                        }
                        if (text[cursor] == '.') {
                            cursor++;
                            numeric = 1;
                        }
                        if (numeric == 0) {
                            break;
                        }
                    }
                    if (length == 32) {
                        return -1;
                    }
                }
                cursor = skipSpace(text, cursor);
                break;
        }
    }
    return cursor;
}

#ifdef NON_MATCHING
/**
 * Reads the item definition file and fills in the item tables.
 *
 * @mangled TEIGIAnalyz__FPc
 * @address 0x1CE090
 * @size 0x3B4
 */
void TEIGIAnalyz(char *path) {
    char *text;
    int pos;
    int command;

    argLevel__2 = 0;
    errFlag2 = 0x7E;
    BtRubyDoorKey = (int) ((float) rand() * 5.0f / 2.1474836e9f);
    if (BtRubyDoorKey < 0 || BtRubyDoorKey >= 5) {
        BtRubyDoorKey = 0;
    }
    if (selectMapNo == 2 && UserStatus->cur_floor == 8) {
        BtRubyDoorKey = 0;
    }

    MapModelBuffer.Align64();
    text = (char *) MapModelBuffer.base + MapModelBuffer.used * 16;
    if (LoadFile(path, text, &teigiFileSize) == 0) {
        return;
    }
    wait_now_loading_vsync();
    MapModelBuffer.Alloc((teigiFileSize >> 4) + 1);
    MapModelBuffer.Align64();

    // The parser treats each source line as a null-terminated record.
    for (pos = 0; pos < teigiFileSize; pos++) {
        if (text[pos] == '\r' && text[pos + 1] == '\n') {
            text[pos] = '\0';
            text[pos + 1] = '\0';
        }
    }

    for (pos = 0; pos < teigiFileSize; pos = skipSpace(text, pos)) {
        bool found = false;
        pos = skipSpace(text, pos);
        for (command = 0; TEIGI_TABLE[command] != NULL; command++) {
            int name_length = strlen(TEIGI_TABLE[command]);
            if (memcmp(&text[pos], TEIGI_TABLE[command], name_length) != 0) {
                continue;
            }

            pos = skipSpace(text, pos + name_length);
            if ((unsigned int) (command - 11) < 2) {
                argValBuff__2[argLevel__2][0] = (float) TEIGI_ARG_TABLE[command][0];
            } else {
                pos = checkArg(text, pos, TEIGI_ARG_TABLE[command]);
                if (pos == -1) {
                    printf("def Error:%s\n", TEIGI_TABLE[command]);
                    exit__2(-1);
                }
                pos = skipSpace(text, pos);
            }
            argLevel__2++;
            if (argLevel__2 >= 640) {
                printf("arg line level err!!\n");
                for (;;) {
                }
            }
            found = true;
            break;
        }
        if (!found) {
            printf("TAG SyntaxError!! >> %s\n", &text[pos]);
            exit__2(-1);
        }
    }

    if (errFlag2 != 0x7E) {
        printf("TAG MEM ERR2 !!\n");
        for (;;) {
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/itemdata", TEIGIAnalyz__FPc);
#endif

INCLUDE_RODATA("asm/nonmatchings/itemdata", @762);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @763);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @764);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @765);

#ifdef NON_MATCHING
/**
 * Reads the textures the item definitions name.
 *
 * @mangled TEIGIImgLoad__FPUiP14CDataAlloc2_1_
 * @address 0x1CE450
 * @size 0x594
 */
void TEIGIImgLoad(u_int *pack, CDataAlloc2<1> *arena) {
    LOADTEXTURE_INFO2 ground_images[5] = {};
    LOADTEXTURE_INFO2 fire_images[2] = {};
    LOADTEXTURE_INFO2 minimap_images[2] = {};
    char full_path[256];
    int ground_count = 0;
    int size;
    int command;
    int i;

    pathName[0] = '\0';
    for (i = 0; i < 4; i++) {
        TexManager.DeleteTextureBlock(i + 64);
    }
    TexManager.CleanUpTextureList();
    TexManager.CleanUpBuffer();

    for (command = 0; command < argLevel__2; command++) {
        int kind = (int) argValBuff__2[command][0];
        if (kind == TEIGI_SET_PATH[0]) {
            strcpy(pathName, argStrBuff__2[command]);
        }

        if (kind == TEIGI_GRD_IMG__2[0]) {
            u_char *destination;
            u_int *image;
            strcpy(full_path, pathName);
            strcat(full_path, argStrBuff__2[command]);
            strcpy(argStrBuff__2[command], full_path);

            destination = arena->base + arena->used * 16;
            image = GetPackFile(pack, argStrBuff__2[command], &size);
            arena->Alloc((((size >> 6) + 1) << 6) >> 4);
            memcpy(destination, image, size);
            ground_images[ground_count].name = (char *) destination;
            ground_images[ground_count].block_no = 3;
            ground_images[ground_count].unk_08 = (int) argValBuff__2[command][2];
            ground_count++;
            ground_images[ground_count].name = NULL;

            TexManager.DeleteTextureBlock(3);
            TexManager.CleanUpTextureList();
            TexManager.CleanUpBuffer();
            TexManager.LoadTextureBlockEX(-1, ground_images);

            BtTexAnime.Initialize(BtTexAnimeData, 96);
            char *config = (char *) GetPackFile(pack, "texanime.cfg", &size);
            if (config != NULL) {
                for (i = 0; i < 96; i++) {
                    BtTexAnimeData[i].Initialize();
                }
                BtTexAnime.LoadCFGFile(config, size);
            }
        }

        if (kind == TEIGI_FIRE_IMG__2[0]) {
            strcpy(full_path, pathName);
            strcat(full_path, argStrBuff__2[command]);
            printf("%s\n", argStrBuff__2[command]);
            fire_images[0].name = (char *) GetPackFile(pack, "fire.img", &size);
            fire_images[0].block_no = 14;
            if (fire_images[0].name == NULL) {
                exit__2(-1);
            }
            TexManager.DeleteTextureBlock(14);
            TexManager.CleanUpTextureList();
            TexManager.CleanUpBuffer();
            TexManager.LoadTextureBlock(-1, fire_images);
        }

        if (kind == TEIGI_MINIMAP_IMG[0]) {
            strcpy(full_path, pathName);
            strcat(full_path, argStrBuff__2[command]);
            minimap_images[0].name = (char *) GetPackFile(pack, full_path, &size);
            minimap_images[0].block_no = 31;
            if (minimap_images[0].name == NULL) {
                exit__2(-1);
            }
            TexManager.DeleteTextureBlock(31);
            TexManager.CleanUpTextureList();
            TexManager.CleanUpBuffer();
            TexManager.LoadTextureBlock(-1, minimap_images);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/itemdata", TEIGIImgLoad__FPUiP14CDataAlloc2_1_);
#endif

INCLUDE_RODATA("asm/nonmatchings/itemdata", @766__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @768);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @809__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @810);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @811);
#ifdef NON_MATCHING
void TEIGIMdsLoad(u_int *pack, int reuse_only) {
    CFrameAttr frame_attr;
    CFrame *current_model = NULL;
    CFrame *current_collision = NULL;
    int part_frame = 0;
    int command;

    nowPartsCnt__2 = 0;
    if (reuse_only == 0) {
        filePathNum = 0;
        filePathColNum = 0;
    }
    pathName[0] = '\0';

    for (command = 0; command < argLevel__2; command++) {
        float *value = argValBuff__2[command];
        int kind = (int) value[0];
        int size;

        if (kind == TEIGI_DebugFlag__2[0]) {
            debugModeFlag__2 = (int) value[1];
            printf("debugModeFlag = %d\n", debugModeFlag__2);
        } else if (kind == TEIGI_RUN_SPEED__2[0]) {
            run_speed__2 = value[1];
        } else if (kind == TEIGI_LIGHT_C[0] || kind == TEIGI_URA_LIGHT_C[0]) {
            int light_no = (int) value[7] - 1;
            float (*direction)[4] = kind == TEIGI_LIGHT_C[0] ? main_light : sub_light;
            float (*colour)[4] =
                kind == TEIGI_LIGHT_C[0] ? main_lightcolor : sub_lightcolor;
            direction[light_no][0] = value[1];
            direction[light_no][1] = value[2];
            direction[light_no][2] = value[3];
            direction[light_no][3] = 0.0f;
            sceVu0Normalize(direction[light_no], direction[light_no]);
            colour[light_no][0] = value[4];
            colour[light_no][1] = value[5];
            colour[light_no][2] = value[6];
            colour[light_no][3] = 1.0f;
        } else if (kind == TEIGI_AMBIENT__2[0] || kind == TEIGI_URA_AMBIENT[0]) {
            float *ambient =
                kind == TEIGI_AMBIENT__2[0] ? main_ambientlight : sub_ambientlight;
            ambient[0] = value[1];
            ambient[1] = value[2];
            ambient[2] = value[3];
        } else if (kind == TEIGI_FOG__2[0] || kind == TEIGI_URA_FOG[0]) {
            float *rate = kind == TEIGI_FOG__2[0] ? main_fogRate : sub_fogRate;
            u8 *colour = kind == TEIGI_FOG__2[0] ? main_fogColor : sub_fogColor;
            rate[0] = value[1];
            rate[1] = value[2];
            rate[2] = value[6];
            rate[3] = value[7];
            colour[0] = (u8) value[3];
            colour[1] = (u8) value[4];
            colour[2] = (u8) value[5];
        } else if (kind == TEIGI_BG_COL__2[0] || kind == TEIGI_URA_BG_COL[0]) {
            u8 *colour = kind == TEIGI_BG_COL__2[0] ? main_bgColor : sub_bgColor;
            colour[0] = (u8) value[1];
            colour[1] = (u8) value[2];
            colour[2] = (u8) value[3];
            if (kind == TEIGI_BG_COL__2[0]) {
                MGSetBGColor((float) colour[0], (float) colour[1], (float) colour[2], 128.0f);
            }
        } else if (kind == TEIGI_SET_PATH[0]) {
            strcpy(pathName, argStrBuff__2[command]);
        } else if (kind == TEIGI_VIEWLEVEL[0]) {
            NowDngMap->draw_dist_scale = value[1];
        } else if (kind == TEIGI_BG_MODEL[0] || kind == TEIGI_DUMMY_MODEL[0]) {
            u_int *data = GetPackFile(pack, argStrBuff__2[command], &size);
            if (data == NULL) {
                printf("MDS Load Error %s\n", argStrBuff__2[command]);
                continue;
            }
            CFrame *frame = LoadMDSFile(data, &MapModelBuffer, 0, NULL, NULL);
            if (kind == TEIGI_BG_MODEL[0]) {
                if (NowDngMap->unk_03B4 < 6) {
                    NowDngMap->bg_model[NowDngMap->unk_03B4++] = frame;
                }
            } else if (NowDngMap->unk_03B8 < 3) {
                frame->SetAttr(frame_attr, 1, 0x40);
                SetFrameAttr(frame, 1);
                NowDngMap->dummy_frame[NowDngMap->unk_03B8++] = frame;
            }
        } else if (kind == TEIGI_DRANS_PARTS[0] || kind == TEIGI_DRANS_COLS[0]) {
            u_int *data = GetPackFile(pack, argStrBuff__2[command], &size);
            if (data == NULL) {
                printf("MDS Load Error %s\n", argStrBuff__2[command]);
            } else if (kind == TEIGI_DRANS_PARTS[0]) {
                NowDranMapField->LoadModel(data, &MapModelBuffer);
            } else {
                NowDranMapField->LoadCollision(data, &MapModelBuffer);
            }
        } else if (kind == TEIGI_DEF_PATS__2[0]) {
            part_frame = 0;
        } else if (kind == TEIGI_DEF_ENDS__2[0]) {
            nowPartsCnt__2++;
        } else if (kind == TEIGI_PT_BASE__2[0]) {
            char full_path[128];
            int found = -1;
            int i;
            strcpy(full_path, pathName);
            strcat(full_path, argStrBuff__2[command]);
            for (i = 0; i < filePathNum; i++) {
                if (strcmp(filePathList[i], full_path) == 0) {
                    found = i;
                }
            }
            if (found < 0) {
                u_int *data;
                if (reuse_only != 0) {
                    printf("MDS Cash Error %s\n", full_path);
                    exit__2(-1);
                }
                if (pack == NULL) {
                    LoadFile(full_path, read_buffer, NULL);
                    wait_now_loading_vsync();
                    data = read_buffer;
                } else {
                    data = GetPackFile(pack, full_path, &size);
                }
                current_model = LoadMDSFile(data, &MapModelBuffer, 0, NULL, NULL);
                current_model->SetAttr(frame_attr, 1, 0x40);
                SetFrameAttr(current_model, 1);
                strcpy(filePathList[filePathNum], full_path);
                frameList[filePathNum++] = current_model;
            } else {
                current_model = frameList[found];
            }
            if (nowPartsCnt__2 < 72 && part_frame < 6) {
                CDungeonParts &part = NowDngMap->parts[nowPartsCnt__2];
                part.frame[part_frame] = current_model;
                part.pos[0] = value[3] * 10.0f;
                part.pos[1] = value[4] * 10.0f;
                part.pos[2] = value[5] * 10.0f;
                part.pos[3] = 1.0f;
                part.unk_170[part_frame] = value[6];
                part.direction_offset = (s16) value[2];
            }
            part_frame++;
        } else if (kind == TEIGI_PT_COLS__2[0] || kind == TEIGI_PT_CAM[0]) {
            char full_path[128];
            int found = -1;
            int i;
            strcpy(full_path, pathName);
            strcat(full_path, argStrBuff__2[command]);
            for (i = 0; i < filePathColNum; i++) {
                if (strcmp(filePathColList[i], full_path) == 0) {
                    found = i;
                }
            }
            if (found < 0) {
                u_int *data;
                if (reuse_only != 0) {
                    printf("Collision Cash Error %s\n", full_path);
                    exit__2(-1);
                }
                if (pack == NULL) {
                    LoadFile(full_path, read_buffer, NULL);
                    wait_now_loading_vsync();
                    data = read_buffer;
                } else {
                    data = GetPackFile(pack, full_path, &size);
                }
                current_collision = LoadCollisionFile(data, &MapModelBuffer);
                current_collision->attr.draw_on = 1;
                strcpy(filePathColList[filePathColNum], full_path);
                frameListCol[filePathColNum++] = current_collision;
            } else {
                current_collision = frameListCol[found];
            }
            CDungeonParts &part = NowDngMap->parts[nowPartsCnt__2];
            if (kind == TEIGI_PT_COLS__2[0]) {
                part.collision = current_collision;
                part.unk_010 = (s16) value[2];
            } else {
                part.unk_004 = current_collision;
                part.unk_008 = (s16) value[2];
            }
        } else if (kind == TEIGI_DRAW_FLAG[0]) {
            CFrame *frame = NowDngMap->GetFrameSearch(argStrBuff__2[command]);
            if (frame != NULL) {
                frame->attr.draw_on = (int) value[2] != 0 ? 1 : 2;
            }
        } else if (kind == TEIGI_PT_DRAW_FLAG[0] && current_model != NULL) {
            CFrame *frame = current_model->SearchFrame(argStrBuff__2[command]);
            if (frame != NULL) {
                frame->attr.draw_on = (int) value[2] != 0 ? 1 : 2;
            }
        } else if (kind == TEIGI_PT_LIGHT[0] || kind == TEIGI_PT_FIRE__2[0]) {
            CDungeonParts &part = NowDngMap->parts[nowPartsCnt__2];
            if (part.fire_num < 6) {
                int index = part.fire_num++;
                part.fire_pos[index][0] = value[1];
                part.fire_pos[index][1] = value[2];
                part.fire_pos[index][2] = value[3];
                part.fire_param[index] = kind == TEIGI_PT_LIGHT[0] ? 2 : 3;
            }
        } else if (kind == TEIGI_PT_HEAL_ZONE[0]) {
            float position[4] = {value[1] * 10.0f, value[2] * 10.0f, value[3] * 10.0f,
                                 1.0f};
            NowDngMap->parts[nowPartsCnt__2].SetHealZone(position, value[4] * 10.0f,
                                                         value[5] * 10.0f);
        } else if (kind == TEIGI_PT_WATER__2[0]) {
            CDungeonParts &part = NowDngMap->parts[nowPartsCnt__2];
            part.water.used = 1;
            float x0 = value[1] * 10.0f;
            float y = value[2] * 10.0f;
            float z0 = value[3] * 10.0f;
            float x1 = value[4] * 10.0f;
            float z1 = value[5] * 10.0f;
            float vertices[4][4] = {{x0, y, z0, 1.0f}, {x1, y, z0, 1.0f}, {x0, y, z1, 1.0f}, {x1, y, z1, 1.0f}};
            for (int i = 0; i < 4; i++) {
                sceVu0CopyVector(part.water.vertex[i], vertices[i]);
            }
            part.water.red = (u8) value[6];
            part.water.green = (u8) value[7];
            part.water.blue = (u8) value[8];
        } else if (kind == TEIGI_PT_NPC[0]) {
            sceVu0FVECTOR position = {value[2], value[3], value[4], 1.0f};
            sceVu0FVECTOR rotation = {value[5], value[6], value[7], 1.0f};
            u_int *data = GetPackFile(pack, argStrBuff__2[command], &size);
            NowDngMap->SetNPC((int) value[1], data, nowPartsCnt__2, position, rotation,
                              (int) value[8], (int) value[9], &MapModelBuffer);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/itemdata", TEIGIMdsLoad__FPUii);
#endif
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1149);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1150__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1151__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1152__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1153__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1154__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1155__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1156__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1157);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1158);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1159__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1160);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1161);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1162);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @1163);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @585);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @586);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @587);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @588);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @589__2);
INCLUDE_RODATA("asm/nonmatchings/itemdata", @590__2);

/*
 * The source-owned definition tables replace their bytes in main.data. The
 * linker script places this unit's data section at its retail address; the
 * four tables are contiguous and stay in this order.
 *
 * Byte-for-byte from retail. WeaponList and AttachList stay as bytes because
 * nothing is known about their fields yet -- inventing a struct for them
 * would assert a layout no evidence supports. ITEM_LIST is s16 fields, of
 * which only index 5 (vol) is understood, and ComItemInfo is the id-to-table
 * map this file's accessors read.
 */
WEAPON_DATA WeaponList[120] = {
    {48, 1, 0, 70, 0, CHARA_TOAN, {0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 32, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 25, 24, 0, 0},                          /* Dagger[broken1] */
    {48, 6, 30, 70, 2, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 4, 0}, {0, 0, 0, 0, 0, 4, 0, 0, 0, 0}, 32, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 25, 24, 1, 0},                         /* Dagger */
    {40, 8, 20, 60, 4, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {6, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 10, 0, 0, 0}, 40, 9, 0, 0, 0x0000, 0, 0x00002000, 0x00004000, 26, 25, 2, 0},                        /* Baselard */
    {45, 10, 32, 60, 6, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 5}, {0, 15, 0, 0, 0, 0, 0, 0, 0, 0}, 40, 10, 0, 0, 0x0000, 0, 0x00000000, 0x00000240, 37, 36, 3, 0},                      /* Gladius */
    {50, 30, 22, 70, 12, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 16, 0}, {0, 0, 0, 0, 12, 12, 0, 0, 0, 12}, 65, 10, 0, 0, 0x0000, 0, 0x00008000, 0x00000000, 55, 50, 4, 0},                  /* Wise Owl Sword */
    {55, 12, 25, 70, 8, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 8}, {0, 5, 0, 0, 0, 5, 5, 0, 0, 0}, 45, 8, 0, 0, 0x0000, 0, 0x00000000, 0x000000C0, 40, 38, 5, 0},                        /* Crysknife */
    {58, 37, 39, 50, 25, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {6, 0, 0, 0, 20}, {20, 8, 0, 10, 0, 0, 0, 0, 10, 0}, 50, 15, 0, 0, 0x0040, 0, 0x00020000, 0x00000000, 77, 47, 6, 0},                  /* Antique Sword */
    {57, 24, 40, 50, 0, CHARA_TOAN, {2, 1, 1, 1, 0, 0}, 4, {0, 0, 0, 0, 0}, {0, 10, 0, 0, 0, 10, 0, 10, 0, 10}, 60, 15, 0, 0, 0x0000, 0, 0x00000000, 0x00000800, 65, 35, 7, 0},                   /* Buster Sword */
    {30, 5, 22, 80, 0, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 8, 0, 0, 0}, {0, 0, 33, 0, 0, 0, 0, 0, 0, 0}, 50, 8, 0, 0, 0x0008, 0, 0x00000000, 0x00004200, 30, 15, 8, 0},                        /* Kitchen Knife */
    {40, 40, 20, 70, 34, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 10, 20, 10, 0}, {0, 0, 0, 0, 0, 8, 0, 20, 0, 8}, 68, 13, 0, 0, 0x0000, 0, 0x00004000, 0x00000000, 68, 70, 9, 0},                  /* Tsukikage */
    {50, 50, 40, 60, 30, CHARA_TOAN, {2, 1, 1, 1, 0, 0}, 4, {30, 0, 35, 0, 0}, {30, 30, 0, 30, 0, 0, 0, 15, 0, 10}, 90, 15, 0, 0, 0x0000, 0, 0x00040000, 0x00000000, 110, 58, 10, 0},             /* Sun Sword */
    {45, 22, 48, 60, 8, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 14, 12, 0}, {21, 0, 12, 0, 23, 24, 23, 0, 0, 0}, 50, 14, 0, 0, 0x0000, 0, 0x00000200, 0x00000020, 70, 55, 11, 0},               /* Serpent Sword */
    {53, 43, 52, 50, 20, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 0, 0, 8, 0, 12, 0, 0, 35, 0}, 70, 15, 0, 0, 0x0000, 0, 0x00000000, 0x00020010, 68, 54, 12, 0},                   /* Macho Sword */
    {32, 20, 30, 70, 6, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 8, 0, 0}, {0, 0, 0, 0, 0, 0, 10, 0, 0, 4}, 70, 14, 0, 0, 0x0000, 0, 0x00000000, 0x00010000, 60, 39, 13, 0},                     /* Shamshir */
    {60, 65, 50, 80, 40, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 30, 38, 38, 12}, {30, 0, 0, 0, 0, 30, 0, 35, 0, 0}, 90, 18, 0, 0, 0x0000, 0, 0x00010000, 0x00000000, 102, 85, 14, 0},             /* Heaven's Cloud */
    {65, 45, 44, 70, 20, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 20, 0, 20}, {0, 0, 0, 0, 30, 35, 35, 0, 0, 0}, 92, 20, 0, 0, 0x0000, 0, 0x00080000, 0x00000000, 80, 60, 15, 0},                /* Lamb's Sword */
    {60, 75, 55, 75, 45, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 50, 45, 0, 0}, {30, 0, 0, 0, 0, 0, 0, 30, 30, 0}, 93, 24, 0, 0, 0x0000, 0, 0x00000000, 0x00040000, 145, 99, 16, 0},               /* Dark Cloud */
    {70, 60, 75, 80, 20, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {30, 0, 0, 0, 40}, {0, 34, 0, 38, 0, 0, 30, 25, 0, 18}, 85, 18, 0, 0, 0x0000, 0, 0x00010000, 0x00000000, 95, 60, 17, 0},              /* Brave Ark */
    {70, 80, 77, 60, 58, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {50, 30, 55, 30, 30}, {35, 35, 0, 45, 0, 0, 0, 40, 0, 40}, 80, 24, 0, 0, 0x0000, 0, 0x00000000, 0x00080000, 170, 95, 18, 0},          /* Big Bang */
    {70, 70, 80, 80, 60, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {25, 40, 25, 40, 20}, {30, 20, 10, 20, 10, 10, 10, 30, 40, 20}, 70, 25, 0, 0, 0x0000, 0, 0x00000000, 0x00100000, 155, 101, 19, 0},    /* Atlamillia Sword */
    {55, 12, 25, 70, 8, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 8}, {0, 5, 0, 0, 0, 5, 5, 0, 0, 0}, 45, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 40, 45, 20, 0},                       /* weapon No.277 */
    {58, 50, 50, 50, 50, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {5, 5, 5, 5, 5}, {10, 8, 10, 10, 0, 0, 0, 0, 10, 0}, 60, 20, 0, 0, 0x0000, 0, 0x00000000, 0x00000004, 70, 65, 21, 0},                 /* Mardan Eins */
    {55, 50, 50, 50, 50, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {5, 5, 5, 5, 5}, {10, 8, 10, 10, 0, 0, 0, 0, 10, 0}, 45, 20, 0, 0, 0x0000, 0, 0x00000000, 0x00000008, 99, 99, 22, 0},                 /* Mardan Twei */
    {55, 50, 50, 50, 50, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {5, 5, 5, 5, 5}, {10, 8, 10, 10, 0, 0, 0, 0, 10, 0}, 45, 20, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 250, 120, 23, 0},               /* Arise Mardan */
    {58, 60, 60, 50, 30, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {6, 0, 0, 0, 8}, {20, 23, 20, 20, 23, 20, 20, 20, 10, 18}, 50, 13, 0, 0, 0x0000, 0, 0x00080000, 0x00000000, 95, 80, 24, 0},           /* Aga's Sword */
    {57, 43, 40, 50, 38, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 20, 10, 0, 0}, {0, 10, 0, 0, 0, 10, 0, 10, 0, 10}, 60, 12, 0, 0, 0x0000, 0, 0x00000000, 0x00000100, 80, 75, 25, 0},               /* Evilcise */
    {30, 20, 33, 80, 36, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 8, 10, 10, 0}, {0, 0, 33, 0, 0, 0, 0, 0, 0, 0}, 70, 10, 0, 0, 0x0000, 0, 0x00000200, 0x00000000, 60, 60, 26, 0},                  /* Small Sword */
    {40, 28, 20, 70, 14, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 10, 0, 10, 12}, {0, 0, 0, 0, 0, 8, 0, 10, 0, 8}, 68, 13, 0, 0, 0x0010, 0, 0x00000040, 0x00000000, 68, 45, 27, 0},                 /* Sand Breaker */
    {50, 50, 40, 60, 55, CHARA_TOAN, {2, 1, 1, 1, 0, 0}, 4, {30, 30, 35, 30, 0}, {0, 0, 0, 30, 0, 30, 25, 0, 0, 10}, 90, 20, 0, 0, 0x0400, 0, 0x00010000, 0x00000000, 99, 85, 28, 0},             /* Drain Seeker */
    {57, 30, 40, 50, 15, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 10, 0, 0}, {0, 10, 0, 0, 0, 10, 0, 10, 0, 10}, 60, 12, 0, 0, 0x0000, 0, 0x00000000, 0x00010400, 65, 43, 29, 0},                /* Chopper */
    {30, 39, 44, 80, 28, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 8, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 20}, 50, 13, 0, 0, 0x0000, 0, 0x00004000, 0x00001000, 74, 55, 30, 0},                    /* Choora */
    {40, 55, 50, 70, 20, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 10, 0, 10, 12}, {0, 0, 0, 15, 0, 8, 10, 10, 10, 8}, 68, 13, 0, 0, 0x0000, 0, 0x00000000, 0x00020000, 68, 45, 31, 0},              /* Claymore */
    {57, 55, 40, 50, 55, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 10, 0, 0}, {0, 10, 0, 0, 0, 10, 0, 10, 0, 55}, 60, 12, 0, 0, 0x0000, 0, 0x00080000, 0x00000000, 99, 63, 32, 0},                /* Maneater */
    {30, 15, 20, 80, 30, CHARA_TOAN, {2, 1, 0, 0, 0, 0}, 2, {0, 5, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 50, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000020, 55, 62, 33, 0},                      /* Bone Rapier */
    {57, 26, 40, 50, 15, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 10, 0, 0}, {0, 0, 0, 0, 10, 0, 0, 0, 10, 0}, 60, 12, 0, 0, 0x0000, 0, 0x00000000, 0x00010000, 65, 41, 34, 0},                  /* Sax */
    {30, 65, 40, 80, 35, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {20, 20, 20, 20, 20}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 50, 16, 0, 0, 0x0000, 0, 0x00080000, 0x00000000, 99, 65, 35, 0},                /* 7Branch Sword */
    {40, 38, 40, 70, 29, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {0, 20, 0, 20, 12}, {0, 0, 0, 0, 0, 8, 0, 10, 0, 8}, 68, 14, 0, 0, 0x0000, 0, 0x00020000, 0x00008000, 78, 45, 36, 0},                 /* Dusack */
    {50, 68, 40, 60, 21, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {10, 10, 10, 0, 30}, {30, 0, 0, 35, 0, 0, 0, 15, 20, 0}, 90, 15, 0, 0, 0x0000, 0, 0x00040000, 0x00000000, 110, 60, 37, 0},            /* Cross Hinder */
    {40, 100, 40, 70, 95, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {80, 10, 85, 10, 12}, {0, 88, 0, 0, 0, 8, 0, 10, 0, 8}, 68, 27, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 240, 110, 38, 0},           /* 7thHeaven */
    {50, 100, 77, 60, 95, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {70, 70, 70, 70, 70}, {30, 30, 33, 30, 29, 54, 22, 49, 22, 60}, 90, 24, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 199, 176, 39, 0},   /* Sword Of Zeus */
    {40, 120, 80, 80, 101, CHARA_TOAN, {2, 1, 1, 0, 0, 0}, 3, {55, 55, 90, 55, 90}, {60, 60, 60, 60, 60, 60, 60, 60, 60, 60}, 125, 32, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 260, 150, 40, 0}, /* Chronicle Sword */
    {99, 199, 99, 89, 110, CHARA_TOAN, {2, 1, 1, 1, 1, 0}, 5, {50, 50, 50, 50, 50}, {50, 50, 50, 50, 50, 50, 50, 50, 50, 50}, 125, 30, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 350, 200, 41, 0}, /* Chronicle2 */
    {48, 1, 0, 40, 0, CHARA_XIAO, {0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 40, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 28, 10, 0, 0},                          /* WoodenSlingshot[broken1] */
    {48, 4, 40, 40, 0, CHARA_XIAO, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 8, 0, 0, 0}, 40, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 28, 10, 1, 0},                         /* Wooden Slingshot */
    {48, 14, 40, 43, 0, CHARA_XIAO, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 0}, {0, 0, 0, 5, 0, 0, 5, 5, 0, 0}, 40, 10, 0, 0, 0x0000, 0, 0x00000040, 0x00000000, 35, 10, 2, 0},                       /* Steel Slingshot */
    {46, 30, 38, 48, 0, CHARA_XIAO, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 12, 0}, {0, 5, 0, 0, 0, 0, 12, 0, 0, 5}, 40, 10, 0, 0, 0x0080, 0, 0x000000C0, 0x00000000, 50, 10, 3, 0},                     /* Bandit Slingshot */
    {50, 16, 48, 50, 0, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {11, 0, 0, 0, 0}, {0, 0, 0, 30, 0, 0, 0, 0, 20, 0}, 58, 20, 0, 0, 0x0000, 0, 0x00002000, 0x00000000, 60, 30, 4, 0},                    /* Steve */
    {40, 8, 20, 58, 0, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 12, 0, 0, 0, 0, 5, 0, 0, 0}, 40, 12, 0, 0, 0x0000, 0, 0x00000800, 0x00000000, 35, 10, 5, 0},                       /* Bone Slingshot */
    {50, 35, 50, 70, 0, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {5, 0, 0, 20, 0, 5, 12, 20, 0, 0}, 65, 15, 0, 0, 0x0000, 0, 0x00001080, 0x00000000, 70, 18, 6, 0},                    /* Hardshooter */
    {45, 40, 50, 60, 0, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 0, 8, 0, 0, 0, 12, 0, 0, 12}, 65, 15, 0, 0, 0x0000, 0, 0x00000200, 0x00000000, 88, 30, 7, 0},                     /* Double Impact */
    {60, 55, 60, 65, 10, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {20, 0, 0, 0, 0}, {25, 0, 20, 0, 20, 0, 0, 0, 0, 0}, 65, 18, 0, 0, 0x0000, 0, 0x00000200, 0x00000000, 85, 55, 8, 0},                  /* Dragon's Y */
    {70, 60, 70, 80, 18, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {20, 0, 0, 20, 0}, {30, 0, 10, 0, 20, 50, 28, 0, 0, 0}, 80, 25, 0, 0, 0x0000, 0, 0x00000400, 0x00000000, 140, 70, 9, 0},              /* DivineBeastTitle */
    {70, 99, 60, 65, 50, CHARA_XIAO, {2, 1, 1, 1, 0, 0}, 4, {20, 40, 0, 40, 0}, {25, 40, 20, 20, 20, 0, 0, 0, 50, 0}, 80, 25, 0, 0, 0x0800, 0, 0x00004000, 0x00000000, 182, 99, 10, 0},           /* Angel Shooter */
    {45, 30, 50, 60, 0, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 20, 12, 0, 0, 20}, 65, 15, 0, 0, 0x0000, 0, 0x00000100, 0x00000000, 55, 18, 11, 0},                   /* Flamingo */
    {45, 42, 50, 60, 0, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {30, 0, 10, 0, 0}, {30, 0, 8, 0, 0, 0, 12, 0, 0, 30}, 65, 15, 0, 0, 0x0000, 0, 0x00000200, 0x00000000, 90, 30, 12, 0},                 /* Matador */
    {60, 50, 65, 77, 30, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 50, 0, 50}, {0, 35, 0, 30, 0, 0, 0, 30, 20, 35}, 90, 26, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 130, 80, 13, 0},             /* Super Steve */
    {45, 150, 50, 70, 99, CHARA_XIAO, {2, 1, 1, 0, 0, 0}, 3, {40, 50, 30, 50, 60}, {5, 78, 0, 0, 0, 5, 69, 12, 0, 0}, 92, 30, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 256, 103, 14, 0},          /* Ange Gear */
    {41, 1, 0, 30, 0, CHARA_GORO, {0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 40, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 35, 10, 0, 0},                          /* Mallet[broken1] */
    {41, 20, 30, 30, 0, CHARA_GORO, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 0}, {0, 0, 0, 5, 0, 0, 0, 0, 5, 0}, 40, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 35, 10, 1, 0},                        /* Mallet */
    {50, 25, 40, 20, 0, CHARA_GORO, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 0}, {0, 0, 0, 12, 0, 0, 0, 10, 10, 0}, 40, 8, 0, 0, 0x0000, 0, 0x00002000, 0x00000000, 65, 14, 2, 0},                     /* Steel Hammer */
    {55, 62, 34, 45, 25, CHARA_GORO, {2, 1, 0, 0, 0, 0}, 2, {30, 20, 15, 5, 30}, {0, 0, 0, 5, 0, 0, 0, 0, 18, 20}, 60, 9, 0, 0, 0x0000, 0, 0x00000300, 0x00000000, 120, 80, 3, 0},                /* Magical Hammer */
    {55, 65, 45, 45, 0, CHARA_GORO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 0, 0, 15, 0, 0, 0, 0, 30, 30}, 65, 12, 0, 0, 0x0000, 0, 0x00000800, 0x00000000, 125, 55, 4, 0},                   /* Battle Ax */
    {55, 36, 40, 45, 0, CHARA_GORO, {2, 1, 0, 0, 0, 0}, 2, {0, 30, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 18, 0}, 58, 12, 0, 0, 0x0000, 0, 0x00000018, 0x00000000, 78, 25, 5, 0},                     /* Turtle Shell */
    {55, 40, 35, 30, 14, CHARA_GORO, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 15, 0}, 58, 15, 0, 0, 0x0002, 0, 0x00000108, 0x00000000, 80, 30, 6, 0},                     /* Big Bucks Hammer */
    {80, 22, 20, 40, 10, CHARA_GORO, {2, 1, 0, 0, 0, 0}, 2, {0, 20, 0, 0, 0}, {0, 0, 18, 0, 0, 0, 0, 0, 0, 0}, 40, 15, 0, 0, 0x0000, 0, 0x00000020, 0x00000000, 56, 30, 7, 0},                    /* Frozen Tuna */
    {65, 77, 10, 48, 25, CHARA_GORO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 10, 0}, {0, 0, 0, 50, 0, 0, 0, 0, 20, 0}, 65, 20, 0, 0, 0x0000, 0, 0x00000400, 0x00000000, 165, 90, 8, 0},                  /* Gaia Hammer */
    {65, 99, 45, 48, 55, CHARA_GORO, {2, 1, 1, 1, 0, 0}, 4, {10, 10, 10, 10, 10}, {0, 45, 0, 0, 0, 0, 0, 20, 25, 20}, 65, 22, 0, 0, 0x0000, 0, 0x00000400, 0x00000000, 150, 85, 9, 0},            /* Last Judgement */
    {88, 128, 50, 55, 85, CHARA_GORO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 55, 0, 0}, {20, 0, 20, 0, 0, 0, 0, 0, 30, 20}, 78, 24, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 260, 200, 10, 0},             /* Tall Hammer */
    {88, 125, 60, 65, 30, CHARA_GORO, {2, 1, 1, 0, 0, 0}, 3, {55, 0, 0, 0, 0}, {0, 20, 0, 20, 20, 20, 0, 20, 55, 20}, 78, 24, 0, 0, 0x0000, 0, 0x00008000, 0x00000000, 199, 222, 11, 0},          /* Satan's Ax */
    {5, 5, 5, 5, 5, CHARA_GORO, {2, 1, 1, 1, 1, 0}, 5, {5, 5, 5, 5, 5}, {5, 5, 5, 5, 5, 5, 5, 5, 5, 5}, 5, 5, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 5, 5, 12, 0},                              /* 12 */
    {55, 42, 35, 30, 14, CHARA_GORO, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 15, 0}, 58, 15, 0, 0, 0x0000, 0, 0x00000008, 0x00000000, 89, 30, 13, 0},                    /* Plate Hammer */
    {65, 20, 10, 48, 25, CHARA_GORO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 0, 0, 20, 0, 0, 0, 0, 20, 0}, 65, 12, 0, 0, 0x2004, 0, 0x00000100, 0x00000000, 77, 40, 14, 0},                   /* Trial Hammer */
    {65, 199, 45, 48, 128, CHARA_GORO, {2, 1, 1, 1, 0, 0}, 4, {90, 0, 0, 0, 0}, {80, 0, 0, 60, 0, 0, 0, 58, 25, 20}, 99, 30, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 350, 300, 15, 0},           /* Inferno */
    {50, 40, 10, 48, 25, CHARA_GORO, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 0, 0, 20, 0, 0, 0, 0, 20, 0}, 50, 50, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 65, 40, 16, 0},                   /* no name */
    {45, 1, 40, 60, 1, CHARA_RUBY, {0, 0, 0, 0, 0, 0}, 0, {1, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 40, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 35, 43, 0, 0},                         /* Gold Ring[broken1] */
    {45, 10, 40, 65, 20, CHARA_RUBY, {2, 1, 0, 0, 0, 0}, 2, {15, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 40, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 35, 43, 1, 0},                      /* Gold Ring */
    {48, 12, 40, 67, 25, CHARA_RUBY, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 18, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 40, 10, 0, 0, 0x0080, 0, 0x00001008, 0x00000000, 38, 55, 2, 0},                     /* Bandit's Ring */
    {53, 38, 40, 64, 55, CHARA_RUBY, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 0, 20}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 56, 20, 0, 0, 0x0000, 0, 0x00000120, 0x00000000, 80, 88, 3, 0},                     /* Crystal Ring */
    {55, 17, 40, 66, 40, CHARA_RUBY, {2, 1, 0, 0, 0, 0}, 2, {0, 20, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 56, 12, 0, 0, 0x0000, 0, 0x00000048, 0x00000000, 50, 65, 4, 0},                     /* Platinum Ring */
    {62, 38, 40, 58, 60, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {10, 10, 26, 10, 55}, {0, 30, 0, 0, 0, 0, 0, 0, 0, 30}, 67, 22, 0, 0, 0x0000, 0, 0x00000200, 0x00000000, 95, 128, 5, 0},              /* Goddess Ring */
    {64, 35, 40, 69, 65, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 15, 20}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 67, 20, 0, 0, 0x0000, 0, 0x00000080, 0x00000000, 66, 90, 6, 0},                    /* Fairy's Ring */
    {67, 50, 40, 65, 65, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {30, 30, 30, 30, 10}, {0, 0, 0, 30, 0, 0, 0, 30, 0, 0}, 67, 22, 0, 0, 0x0000, 0, 0x00000400, 0x00000000, 99, 99, 7, 0},               /* Destruction Ring */
    {70, 40, 40, 44, 60, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {55, 25, 18, 18, 0}, {30, 0, 0, 0, 0, 0, 0, 0, 30, 0}, 67, 22, 0, 0, 0x0000, 0, 0x00000400, 0x00000000, 95, 128, 8, 0},               /* Satan's Ring */
    {81, 60, 60, 60, 99, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {15, 20, 40, 10, 20}, {0, 50, 0, 0, 0, 20, 0, 0, 0, 0}, 78, 24, 0, 0, 0x0000, 0, 0x00004000, 0x00000000, 128, 220, 9, 0},             /* Athena's Armlet */
    {89, 66, 70, 88, 99, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {0, 35, 45, 60, 50}, {50, 0, 0, 0, 0, 0, 0, 0, 50, 0}, 78, 24, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 99, 250, 10, 0},              /* Mobius Ring */
    {5, 5, 5, 5, 5, CHARA_RUBY, {2, 1, 1, 1, 1, 0}, 5, {5, 5, 5, 5, 5}, {5, 55, 5, 5, 5, 5, 5, 5, 5, 5}, 5, 5, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 5, 5, 11, 0},                             /* 11 */
    {50, 35, 40, 69, 55, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 10, 20}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 50, 15, 0, 0, 0x0000, 0, 0x00000040, 0x00000000, 66, 70, 12, 0},                   /* Pocklekul */
    {67, 50, 40, 65, 35, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {15, 10, 10, 10, 10}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 67, 11, 0, 0, 0x0000, 0, 0x00000010, 0x00000000, 60, 46, 13, 0},                /* Thorn Armlet */
    {67, 99, 40, 65, 210, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {77, 66, 50, 70, 80}, {25, 25, 25, 25, 25, 25, 25, 25, 25, 25}, 67, 30, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 155, 300, 14, 0},   /* Secret Armlet */
    {50, 50, 40, 65, 65, CHARA_RUBY, {2, 1, 1, 0, 0, 0}, 3, {15, 10, 10, 10, 10}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 50, 50, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 60, 85, 15, 0},                /* no name */
    {48, 1, 0, 60, 0, CHARA_UNGAGA, {0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 1, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 45, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 55, 20, 0, 0},                        /* Fighting Stick[broken1] */
    {48, 35, 20, 65, 0, CHARA_UNGAGA, {2, 1, 0, 0, 0, 0}, 2, {0, 0, 0, 5, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 45, 12, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 55, 20, 1, 0},                     /* Fighting Stick */
    {52, 38, 25, 70, 0, CHARA_UNGAGA, {2, 1, 0, 0, 0, 0}, 2, {8, 0, 0, 12, 0}, {0, 0, 0, 5, 8, 0, 0, 0, 0, 0}, 45, 16, 0, 0, 0x0000, 0, 0x00000050, 0x00000000, 85, 20, 2, 0},                    /* Javelin */
    {52, 44, 28, 75, 0, CHARA_UNGAGA, {2, 1, 0, 0, 0, 0}, 2, {0, 10, 0, 15, 0}, {0, 0, 0, 0, 0, 8, 5, 8, 0, 0}, 45, 16, 0, 0, 0x0000, 0, 0x00000020, 0x00000000, 80, 20, 3, 0},                   /* Halbert */
    {52, 46, 35, 74, 0, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 25, 17, 0}, {0, 0, 25, 0, 0, 0, 0, 0, 0, 8}, 45, 18, 0, 0, 0x0000, 0, 0x00002000, 0x00000000, 110, 20, 4, 0},                 /* De Sanga */
    {58, 50, 35, 78, 0, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {10, 0, 0, 21, 0}, {12, 8, 8, 0, 0, 8, 8, 12, 0, 0}, 56, 20, 0, 0, 0x0020, 0, 0x00002080, 0x00000000, 99, 30, 5, 0},                 /* Scorpion */
    {60, 55, 45, 90, 0, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 10, 18, 0}, {0, 0, 0, 8, 8, 0, 0, 0, 12, 8}, 56, 20, 0, 0, 0x0000, 0, 0x00002000, 0x00000000, 95, 30, 6, 0},                  /* Partisan */
    {72, 63, 45, 77, 10, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {45, 0, 0, 20, 0}, {16, 16, 16, 0, 0, 16, 16, 16, 0, 0}, 70, 24, 0, 0, 0x0000, 0, 0x00000300, 0x00000000, 150, 40, 7, 0},           /* Mirage */
    {74, 120, 50, 75, 22, CHARA_UNGAGA, {2, 1, 1, 1, 0, 0}, 4, {30, 20, 30, 30, 2}, {0, 0, 0, 16, 16, 0, 0, 0, 16, 16}, 70, 34, 0, 0, 0x0000, 0, 0x00000400, 0x00000000, 220, 66, 8, 0},          /* Terra Sword */
    {81, 110, 70, 99, 20, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 24, 28, 54}, {24, 24, 24, 0, 0, 45, 24, 24, 0, 0}, 80, 26, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 256, 50, 9, 0},         /* Hercules' Wrath */
    {87, 212, 70, 99, 50, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 88, 30, 32}, {55, 0, 0, 24, 24, 0, 0, 0, 24, 24}, 80, 30, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 321, 80, 10, 0},         /* Babel's Spear */
    {5, 5, 5, 5, 5, CHARA_UNGAGA, {2, 1, 1, 1, 1, 0}, 5, {5, 5, 5, 5, 5}, {5, 5, 5, 5, 5, 5, 5, 5, 5, 5}, 5, 5, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 5, 5, 11, 0},                            /* 11 */
    {60, 40, 45, 90, 0, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 10, 18, 0}, {0, 0, 0, 8, 5, 0, 0, 0, 8, 5}, 56, 20, 0, 0, 0x1000, 0, 0x00000060, 0x00000000, 79, 30, 12, 0},                  /* 5 Foot Nail */
    {60, 70, 45, 90, 0, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {0, 35, 0, 35, 0}, {0, 0, 0, 8, 8, 0, 0, 0, 8, 8}, 56, 20, 0, 0, 0x0000, 0, 0x00000100, 0x00000000, 155, 30, 13, 0},                 /* Cactus */
    {72, 63, 45, 77, 0, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {10, 0, 0, 20, 0}, {16, 16, 16, 0, 0, 16, 16, 16, 0, 0}, 70, 24, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 83, 40, 14, 0},            /* no name */
    {60, 55, 45, 90, 0, CHARA_UNGAGA, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 10, 18, 0}, {0, 0, 0, 8, 8, 0, 0, 0, 8, 8}, 56, 20, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 75, 30, 15, 0},                  /* no name */
    {50, 1, 0, 40, 0, CHARA_OSMOND, {0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 38, 8, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 32, 15, 0, 0},                        /* Machine Gun[broken1] */
    {50, 22, 30, 55, 0, CHARA_OSMOND, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 38, 14, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 32, 15, 1, 0},                     /* Machine Gun */
    {58, 30, 35, 65, 8, CHARA_OSMOND, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {3, 3, 3, 3, 3, 3, 3, 3, 3, 3}, 58, 16, 0, 0, 0x0000, 0, 0x00001020, 0x00000000, 55, 25, 2, 0},                     /* Jackal */
    {0, 20, 40, 65, 0, CHARA_OSMOND, {2, 0, 0, 0, 0, 0}, 1, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, 0, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 40, 20, 3, 0},                        /* Launcher */
    {0, 30, 47, 65, 0, CHARA_OSMOND, {2, 0, 0, 0, 0, 0}, 1, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, 0, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 60, 20, 4, 0},                        /* LauncherV2 */
    {45, 34, 50, 60, 10, CHARA_OSMOND, {2, 1, 1, 1, 0, 0}, 4, {15, 15, 15, 15, 15}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 38, 18, 0, 0, 0x0000, 0, 0x00000040, 0x00000000, 56, 30, 5, 0},               /* Blessing Gun */
    {55, 48, 55, 66, 20, CHARA_OSMOND, {2, 1, 1, 1, 0, 0}, 4, {25, 25, 25, 25, 25}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 58, 20, 0, 0, 0x0000, 0, 0x00000100, 0x00000000, 72, 55, 6, 0},               /* Skunk */
    {68, 50, 60, 60, 25, CHARA_OSMOND, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {8, 8, 8, 30, 8, 8, 8, 35, 20, 8}, 69, 21, 0, 0, 0x0000, 0, 0x00000200, 0x00000000, 99, 35, 7, 0},                 /* G CRUSHER */
    {68, 64, 40, 77, 55, CHARA_OSMOND, {2, 1, 1, 1, 0, 0}, 4, {39, 39, 39, 39, 39}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 69, 25, 0, 0, 0x0000, 0, 0x00000400, 0x00000000, 128, 90, 8, 0},              /* Hexa Blaster */
    {80, 70, 80, 70, 30, CHARA_OSMOND, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {20, 20, 20, 65, 20, 20, 20, 45, 30, 20}, 80, 28, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 120, 45, 9, 0},         /* Star Breaker */
    {84, 128, 98, 88, 30, CHARA_OSMOND, {2, 1, 1, 0, 0, 0}, 3, {60, 60, 60, 60, 60}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 90, 34, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 256, 128, 10, 0},           /* Supernova */
    {45, 34, 50, 60, 10, CHARA_OSMOND, {2, 1, 1, 1, 0, 0}, 4, {5, 5, 5, 5, 5}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 38, 18, 0, 0, 0x0000, 0, 0x00000120, 0x00000000, 65, 55, 11, 0},                   /* Snail */
    {55, 48, 55, 66, 20, CHARA_OSMOND, {2, 1, 1, 0, 0, 0}, 3, {0, 0, 0, 0, 0}, {6, 6, 6, 15, 6, 6, 6, 6, 12, 6}, 58, 18, 0, 0, 0x0000, 0, 0x00000080, 0x00000000, 72, 30, 12, 0},                 /* Swallow */
    {55, 48, 55, 66, 20, CHARA_OSMOND, {2, 1, 1, 1, 0, 0}, 4, {15, 15, 15, 15, 15}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 58, 18, 0, 0, 0x0000, 0, 0x00000000, 0x00000000, 72, 30, 13, 0},              /* no name */
};

ATTACH_DATA AttachList[50] = {
    {ITEM_ATTACH_FIRE, 0, 0, 0, 0, 0, 0, 0,
     3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_ICE, 0, 0, 0, 0, 0, 0, 0,
     0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_THUNDER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_WIND, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_HOLY, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {86, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 86, no name */
    {87, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 87, no name */
    {88, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 88, no name */
    {89, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 89, no name */
    {90, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 90, no name */
    {ITEM_ATTACH_ATTACK, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_ENDURANCE, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_SPEED, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_MAGICAL_POWER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_GARNET, 0, 0, 0, 5, 0, 0, 0,
     10, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_AMETHYST, 0, 0, 0, 0, 0, 0, 0,
     0, 10, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0},
    {ITEM_ATTACH_AQUAMARINE, 0, 0, 0, 0, 0, 0, 0,
     0, 10, 0, 0, 0, 0, 0, 10, 0, 0, 0, 10, 0, 0, 0, 0},
    {ITEM_ATTACH_DIAMOND, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 10, 5, 5, 0},
    {ITEM_ATTACH_EMERALD, 0, 0, 0, 0, 0, 0, 10,
     0, 0, 0, 0, 0, 10, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_PEARL, 0, 0, 0, 0, 10, 0, 0,
     0, 0, 10, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_RUBY, 0, 0, 0, 0, 0, 10, 0,
     10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0},
    {ITEM_ATTACH_PERIDOT, 0, 0, 0, 5, 0, 0, 0,
     0, 0, 0, 0, 10, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_SAPPHIRE, 0, 0, 0, 0, 0, 0, 10,
     0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0},
    {ITEM_ATTACH_OPAL, 0, 0, 0, 0, 10, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 0},
    {ITEM_ATTACH_TOPAZ, 0, 0, 0, 5, 0, 10, 0,
     0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 10, 0, 0, 0, 0},
    {ITEM_ATTACH_TURQUOISE, 0, 0, 0, 0, 0, 0, 0,
     0, 10, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 10, 0, 0},
    {ITEM_ATTACH_SUN, 0, 0, 0, 10, 0, 0, 0,
     10, 10, 10, 10, 10, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0},
    {108, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 108, no name */
    {109, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 109, no name */
    {110, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 110, no name */
    {ITEM_ATTACH_DINOSLAYER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_UNDEAD_BUSTER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_SEA_KILLER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_STONE_BREAKER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_PLANT_BUSTER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_BEAST_BUSTER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
    {ITEM_ATTACH_SKY_HUNTER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0},
    {ITEM_ATTACH_METALBREAKER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0},
    {ITEM_ATTACH_MIMIC_BREAKER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0},
    {ITEM_ATTACH_MAGE_SLAYER, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0},
    {121, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 121, no name */
    {122, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 122, no name */
    {123, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 123, no name */
    {124, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 124, no name */
    {125, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 125, no name */
    {126, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 126, no name */
    {127, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 127, no name */
    {128, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 128, no name */
    {129, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 129, no name */
    {130, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, /* id 130, no name */
};

ITEM_DATA ITEM_LIST[175] = {
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 0, 0},    /* attach slot */
    {6, 0, 0x00000000, 0x0001, 3, 5, 0, 1, 0},    /* Anti Freeze Amulet */
    {6, 0, 0x00000000, 0x0001, 3, 5, 0, 1, 0},    /* AntiCurseAmulet */
    {6, 0, 0x00000000, 0x0001, 3, 5, 0, 1, 0},    /* Antigoo Amulet */
    {6, 0, 0x00000000, 0x0001, 3, 5, 0, 1, 0},    /* Antidote Amulet */
    {1, 0, 0x00000020, 0x0030, 5, 3, 0, 2, 0},    /* Fluffy Doughnut */
    {1, 0, 0x00000020, 0x0030, 5, 3, 0, 2, 0},    /* Fish Candy */
    {1, 0, 0x00000020, 0x0030, 5, 3, 0, 2, 0},    /* Grass Cake */
    {1, 0, 0x00000020, 0x0030, 5, 3, 0, 2, 0},    /* Witch Parfait */
    {1, 0, 0x00000020, 0x0030, 5, 3, 0, 2, 0},    /* Scorpion Jerky */
    {1, 0, 0x00000020, 0x0030, 5, 3, 0, 2, 0},    /* Carrot Cookie */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* Dummy */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {1, 0, 0x00000080, 0x0004, 30, 0, 0, 0, 0},   /* Regular Water */
    {1, 0, 0x00000080, 0x0004, 50, 0, 0, 0, 0},   /* Tasty Water */
    {1, 0, 0x00000080, 0x0004, 100, 0, 0, 0, 0},  /* Premium Water */
    {1, 0, 0x00000040, 0x0004, 50, 0, 0, 0, 0},   /* Bread */
    {1, 0, 0x00000040, 0x0004, 200, 0, 0, 0, 0},  /* Premium Chicken */
    {1, 0, 0x00001000, 0x0001, 0, 0, 0, 0, 0},    /* Stamina Drink */
    {1, 0, 0x00008000, 0x0001, 0, 0, 0, 0, 0},    /* Antidote Drink */
    {1, 0, 0x00010010, 0x0003, 0, 0, 0, 0, 0},    /* Holy Water */
    {1, 0, 0x00020000, 0x0001, 0, 0, 0, 0, 0},    /* Soap */
    {1, 0, 0x0003C000, 0x0001, 0, 0, 0, 0, 0},    /* Mighty Healing */
    {1, 0, 0x00000040, 0x0004, 80, 0, 0, 0, 0},   /* Cheese */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {2, 0, 0x00000000, 0x0003, 0, 0, 0, 0, 0},    /* Bomb */
    {2, 0, 0x00000000, 0x0003, 0, 0, 0, 0, 0},    /* Stone */
    {2, 0, 0x00000001, 0x0003, 0, 0, 0, 0, 0},    /* Fire Gem */
    {2, 0, 0x00000002, 0x0003, 0, 0, 0, 0, 0},    /* Ice Gem */
    {2, 0, 0x00000004, 0x0003, 0, 0, 0, 0, 0},    /* Thunder Gem */
    {2, 0, 0x00000008, 0x0003, 0, 0, 0, 0, 0},    /* Wind Gem */
    {2, 0, 0x00000010, 0x0003, 0, 0, 0, 0, 0},    /* Holy Gem */
    {2, 0, 0x00000100, 0x0003, 0, 0, 0, 0, 0},    /* Throbbing Cherry */
    {2, 0, 0x00000800, 0x0003, 0, 0, 0, 0, 0},    /* Gooey Peach */
    {2, 0, 0x00000000, 0x0003, 0, 0, 0, 0, 0},    /* Bomb Nuts */
    {2, 0, 0x00000200, 0x0003, 0, 0, 0, 0, 0},    /* Poisonous Apple */
    {2, 0, 0x00000040, 0x0005, 200, 30, 0, 0, 0}, /* Mellow Banana */
    {3, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* Medusa Powder */
    {3, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* Hardening Powder */
    {3, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* Warp Powder */
    {3, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Stand-in Powder */
    {3, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Escape Powder */
    {3, 0, 0x00000000, 0x0001, 0, 0, 0, 1, 0},    /* Revival Powder */
    {3, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Repair Powder */
    {3, 0, 0x00000020, 0x0001, 0, 0, 0, 2, 0},    /* Powerup Powder */
    {1, 0, 0x00000020, 0x0011, 10, 0, 0, 2, 0},   /* Pocket */
    {1, 0, 0x00000060, 0x0011, 10, 0, 0, 2, 0},   /* Fruit of Eden */
    {4, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* Treasure Key */
    {1, 0, 0x000000A0, 0x0011, 10, 0, 0, 2, 0},   /* Gourd */
    {3, 0, 0x00000000, 0x0000, 0, 0, 0, 1, 0},    /* Auto Repair Powder */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {6, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Fishing Rod */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Carrot */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Potato cake */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Minon */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Battan */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Petite Fish */
    {6, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* Saving Book */
    {6, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* Gold Bullion */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Evy */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Dran's Crest */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Shiny Stone */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Mimi */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Red Berry */
    {6, 0, 0x00000000, 0x0001, 0, 0, 0, 2, 0},    /* Prickly */
    {6, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Candy */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Hook */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* King's Slate */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Gun Powder */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Clock Hands */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Pointy Chestnut */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Black Knight Crest */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Horned Key */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Moon Grass Seed */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Music Box Key */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Sun Signet */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Moon Signet */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Admission Ticket */
    {0, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Sun Sword */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Bone Key */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Moustache Key */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Shipcabin Key */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Stone Key */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Handle */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Pitchdark Key */
    {4, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Silver Key */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {4, 0, 0x00000000, 0x0008, 0, 0, 0, 2, 0},    /* Tram Oil */
    {4, 0, 0x00000000, 0x0008, 0, 0, 0, 2, 0},    /* Sun Dew */
    {7, 0, 0x00000000, 0x0009, 600, 0, 0, 2, 0},  /* Flapping Fish */
    {8, 0, 0x00000000, 0x0009, 0, 0, 0, 2, 0},    /* Rotten Fish */
    {4, 0, 0x00000000, 0x0008, 0, 0, 0, 2, 0},    /* Secret Path Key */
    {4, 0, 0x00000000, 0x0008, 0, 0, 0, 2, 0},    /* Bravery Launch */
    {4, 0, 0x00000000, 0x0008, 0, 0, 0, 2, 0},    /* Flapping Duster */
    {4, 0, 0x00000000, 0x0008, 0, 0, 0, 2, 0},    /* Crystal Eyeball */
    {0, 0, 0x00000000, 0x0000, 0, 0, 0, 2, 0},    /* no name */
    {0, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Map */
    {6, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Magical Crystal */
    {6, 0, 0x00000000, 0x0008, 0, 0, 0, 1, 0},    /* Dran's Feather */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Cave Key */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Changing Potion */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Worldmap */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Bone Pendant */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Odd Tone Flute */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Magical Lamp */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Moon Orb */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Shell Ring */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Search Warrant */
    {7, 0, 0x00000000, 0x0001, 200, 0, 0, 2, 0},  /* Ice Block */
    {7, 0, 0x00000000, 0x0001, 200, 0, 0, 2, 0},  /* Small Ice */
    {7, 0, 0x00000000, 0x0001, 200, 0, 0, 2, 0},  /* Tiny Ice */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Flame Key */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Hunter's Earring */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Ointment Leaf */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Foundation */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Clay Doll */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Manual */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Sun Sphere */
    {5, 0, 0x00000000, 0x0018, 0, 0, 0, 2, 0},    /* Almighty Pass */
};

COM_ITEM_INFO ComItemInfo[296] = {
    {ITEMKIND_ATTACH, 0, 0, 120, 81},    /* id  81  Supernova */
    {ITEMKIND_ATTACH, 0, 1, 121, 82},    /* id  82  Fire */
    {ITEMKIND_ATTACH, 0, 2, 122, 83},    /* id  83  Ice */
    {ITEMKIND_ATTACH, 0, 3, 123, 84},    /* id  84  Thunder */
    {ITEMKIND_ATTACH, 0, 4, 124, 85},    /* id  85  Wind */
    {ITEMKIND_ATTACH, 0, 5, 125, 86},    /* id  86  Holy */
    {ITEMKIND_ATTACH, 0, 6, 126, 87},    /* id  87 */
    {ITEMKIND_ATTACH, 0, 7, 127, 88},    /* id  88 */
    {ITEMKIND_ATTACH, 0, 8, 128, 89},    /* id  89 */
    {ITEMKIND_ATTACH, 0, 9, 129, 90},    /* id  90 */
    {ITEMKIND_ATTACH, 0, 10, 130, 91},   /* id  91 */
    {ITEMKIND_ATTACH, 0, 11, 131, 92},   /* id  92  Attack */
    {ITEMKIND_ATTACH, 0, 12, 132, 93},   /* id  93  Endurance */
    {ITEMKIND_ATTACH, 0, 13, 133, 94},   /* id  94  Speed */
    {ITEMKIND_ATTACH, 0, 14, 134, 95},   /* id  95  Magical power */
    {ITEMKIND_ATTACH, 0, 15, 135, 96},   /* id  96  Garnet */
    {ITEMKIND_ATTACH, 0, 16, 136, 97},   /* id  97  Amethyst */
    {ITEMKIND_ATTACH, 0, 17, 137, 98},   /* id  98  Aquamarine */
    {ITEMKIND_ATTACH, 0, 18, 138, 99},   /* id  99  Diamond */
    {ITEMKIND_ATTACH, 0, 19, 139, 100},  /* id 100  Emerald */
    {ITEMKIND_ATTACH, 0, 20, 140, 101},  /* id 101  Pearl */
    {ITEMKIND_ATTACH, 0, 21, 141, 102},  /* id 102  Ruby */
    {ITEMKIND_ATTACH, 0, 22, 142, 103},  /* id 103  Peridot */
    {ITEMKIND_ATTACH, 0, 23, 143, 104},  /* id 104  Sapphire */
    {ITEMKIND_ATTACH, 0, 24, 144, 105},  /* id 105  Opal */
    {ITEMKIND_ATTACH, 0, 25, 145, 106},  /* id 106  Topaz */
    {ITEMKIND_ATTACH, 0, 26, 146, 107},  /* id 107  Turquoise */
    {ITEMKIND_ATTACH, 0, 27, 147, 108},  /* id 108  Sun */
    {ITEMKIND_ATTACH, 0, 28, 148, 109},  /* id 109 */
    {ITEMKIND_ATTACH, 0, 29, 149, 110},  /* id 110 */
    {ITEMKIND_ATTACH, 0, 30, 150, 111},  /* id 111 */
    {ITEMKIND_ATTACH, 0, 31, 151, 112},  /* id 112  Dinoslayer */
    {ITEMKIND_ATTACH, 0, 32, 152, 113},  /* id 113  Undead Buster */
    {ITEMKIND_ATTACH, 0, 33, 153, 114},  /* id 114  Sea Killer */
    {ITEMKIND_ATTACH, 0, 34, 154, 115},  /* id 115  Stone Breaker */
    {ITEMKIND_ATTACH, 0, 35, 155, 116},  /* id 116  Plant Buster */
    {ITEMKIND_ATTACH, 0, 36, 156, 117},  /* id 117  Beast Buster */
    {ITEMKIND_ATTACH, 0, 37, 157, 118},  /* id 118  Sky Hunter */
    {ITEMKIND_ATTACH, 0, 38, 158, 119},  /* id 119  MetalBreaker */
    {ITEMKIND_ATTACH, 0, 39, 159, 120},  /* id 120  Mimic Breaker */
    {ITEMKIND_ATTACH, 0, 40, 160, 121},  /* id 121  Mage Slayer */
    {ITEMKIND_ATTACH, 0, 41, 161, 122},  /* id 122 */
    {ITEMKIND_ATTACH, 0, 42, 162, 123},  /* id 123 */
    {ITEMKIND_ATTACH, 0, 43, 163, 124},  /* id 124 */
    {ITEMKIND_ATTACH, 0, 44, 164, 125},  /* id 125 */
    {ITEMKIND_ATTACH, 0, 45, 165, 126},  /* id 126 */
    {ITEMKIND_ATTACH, 0, 46, 166, 127},  /* id 127 */
    {ITEMKIND_ATTACH, 0, 47, 167, 128},  /* id 128 */
    {ITEMKIND_ATTACH, 0, 48, 0, 129},    /* id 129 */
    {ITEMKIND_ATTACH, 0, 49, 1, 130},    /* id 130 */
    {ITEMKIND_ATTACH, 0, 50, 2, 131},    /* id 131 */
    {ITEMKIND_ITEM, 0, 51, 3, 132},      /* id 132 */
    {ITEMKIND_ITEM, 0, 52, 4, 133},      /* id 133  Anti Freeze Amulet */
    {ITEMKIND_ITEM, 0, 53, 5, 134},      /* id 134  AntiCurseAmulet */
    {ITEMKIND_ITEM, 0, 54, 6, 135},      /* id 135  Antigoo Amulet */
    {ITEMKIND_ITEM, 0, 55, 7, 136},      /* id 136  Antidote Amulet */
    {ITEMKIND_ITEM, 0, 56, 8, 137},      /* id 137  Fluffy Doughnut */
    {ITEMKIND_ITEM, 0, 57, 9, 138},      /* id 138  Fish Candy */
    {ITEMKIND_ITEM, 0, 58, 10, 139},     /* id 139  Grass Cake */
    {ITEMKIND_ITEM, 0, 59, 11, 140},     /* id 140  Witch Parfait */
    {ITEMKIND_ITEM, 0, 60, 12, 141},     /* id 141  Scorpion Jerky */
    {ITEMKIND_ITEM, 0, 61, 13, 142},     /* id 142  Carrot Cookie */
    {ITEMKIND_ITEM, 0, 62, 14, 143},     /* id 143  Dummy */
    {ITEMKIND_ITEM, 0, 63, 15, 144},     /* id 144 */
    {ITEMKIND_ITEM, 0, 64, 16, 145},     /* id 145 */
    {ITEMKIND_ITEM, 0, 65, 17, 146},     /* id 146  Regular Water */
    {ITEMKIND_ITEM, 0, 66, 18, 147},     /* id 147  Tasty Water */
    {ITEMKIND_ITEM, 0, 67, 19, 148},     /* id 148  Premium Water */
    {ITEMKIND_ITEM, 0, 68, 20, 149},     /* id 149  Bread */
    {ITEMKIND_ITEM, 0, 69, 21, 150},     /* id 150  Premium Chicken */
    {ITEMKIND_ITEM, 0, 70, 22, 151},     /* id 151  Stamina Drink */
    {ITEMKIND_ITEM, 0, 71, 23, 152},     /* id 152  Antidote Drink */
    {ITEMKIND_ITEM, 0, 72, 24, 153},     /* id 153  Holy Water */
    {ITEMKIND_ITEM, 0, 73, 25, 154},     /* id 154  Soap */
    {ITEMKIND_ITEM, 0, 74, 26, 155},     /* id 155  Mighty Healing */
    {ITEMKIND_ITEM, 0, 75, 27, 156},     /* id 156  Cheese */
    {ITEMKIND_ITEM, 0, 76, 28, 157},     /* id 157 */
    {ITEMKIND_ITEM, 0, 77, 29, 158},     /* id 158 */
    {ITEMKIND_ITEM, 0, 78, 30, 159},     /* id 159 */
    {ITEMKIND_ITEM, 0, 79, 31, 160},     /* id 160  Bomb */
    {ITEMKIND_ITEM, 0, 80, 32, 161},     /* id 161  Stone */
    {ITEMKIND_ITEM, 0, 81, 33, 162},     /* id 162  Fire Gem */
    {ITEMKIND_ITEM, 0, 82, 34, 163},     /* id 163  Ice Gem */
    {ITEMKIND_ITEM, 0, 83, 35, 164},     /* id 164  Thunder Gem */
    {ITEMKIND_ITEM, 0, 84, 36, 165},     /* id 165  Wind Gem */
    {ITEMKIND_ITEM, 0, 85, 37, 166},     /* id 166  Holy Gem */
    {ITEMKIND_ITEM, 0, 86, 38, 167},     /* id 167  Throbbing Cherry */
    {ITEMKIND_ITEM, 0, 87, 39, 168},     /* id 168  Gooey Peach */
    {ITEMKIND_ITEM, 0, 88, 40, 169},     /* id 169  Bomb Nuts */
    {ITEMKIND_ITEM, 0, 89, 41, 170},     /* id 170  Poisonous Apple */
    {ITEMKIND_ITEM, 0, 90, 42, 171},     /* id 171  Mellow Banana */
    {ITEMKIND_ITEM, 0, 91, 43, 172},     /* id 172  Medusa Powder */
    {ITEMKIND_ITEM, 0, 92, 44, 173},     /* id 173  Hardening Powder */
    {ITEMKIND_ITEM, 0, 93, 45, 174},     /* id 174  Warp Powder */
    {ITEMKIND_ITEM, 0, 94, 46, 175},     /* id 175  Stand-in Powder */
    {ITEMKIND_ITEM, 0, 95, 47, 176},     /* id 176  Escape Powder */
    {ITEMKIND_ITEM, 0, 96, 48, 177},     /* id 177  Revival Powder */
    {ITEMKIND_ITEM, 0, 97, 49, 178},     /* id 178  Repair Powder */
    {ITEMKIND_ITEM, 0, 98, 50, 179},     /* id 179  Powerup Powder */
    {ITEMKIND_ITEM, 0, 99, 51, 180},     /* id 180  Pocket */
    {ITEMKIND_ITEM, 0, 100, 52, 181},    /* id 181  Fruit of Eden */
    {ITEMKIND_ITEM, 0, 101, 53, 182},    /* id 182  Treasure Key */
    {ITEMKIND_ITEM, 0, 102, 54, 183},    /* id 183  Gourd */
    {ITEMKIND_ITEM, 0, 103, 55, 184},    /* id 184  Auto Repair Powder */
    {ITEMKIND_ITEM, 0, 104, 56, 185},    /* id 185 */
    {ITEMKIND_ITEM, 0, 105, 57, 186},    /* id 186  Fishing Rod */
    {ITEMKIND_ITEM, 0, 106, 58, 187},    /* id 187  Carrot */
    {ITEMKIND_ITEM, 0, 107, 59, 188},    /* id 188  Potato cake */
    {ITEMKIND_ITEM, 0, 108, 60, 189},    /* id 189  Minon */
    {ITEMKIND_ITEM, 0, 109, 61, 190},    /* id 190  Battan */
    {ITEMKIND_ITEM, 0, 110, 62, 191},    /* id 191  Petite Fish */
    {ITEMKIND_ITEM, 0, 111, 63, 192},    /* id 192  Saving Book */
    {ITEMKIND_ITEM, 0, 112, 64, 193},    /* id 193  Gold Bullion */
    {ITEMKIND_ITEM, 0, 113, 65, 194},    /* id 194  Evy */
    {ITEMKIND_ITEM, 0, 114, 66, 195},    /* id 195 */
    {ITEMKIND_ITEM, 0, 115, 67, 196},    /* id 196  Dran's Crest */
    {ITEMKIND_ITEM, 0, 116, 68, 197},    /* id 197  Shiny Stone */
    {ITEMKIND_ITEM, 0, 117, 69, 198},    /* id 198  Mimi */
    {ITEMKIND_ITEM, 0, 118, 70, 199},    /* id 199  Red Berry */
    {ITEMKIND_ITEM, 0, 119, 71, 200},    /* id 200  Prickly */
    {ITEMKIND_ITEM, 0, 120, 72, 201},    /* id 201  Candy */
    {ITEMKIND_ITEM, 0, 121, 73, 202},    /* id 202  Hook */
    {ITEMKIND_ITEM, 0, 122, 74, 203},    /* id 203  King's Slate */
    {ITEMKIND_ITEM, 0, 123, 75, 204},    /* id 204  Gun Powder */
    {ITEMKIND_ITEM, 0, 124, 76, 205},    /* id 205  Clock Hands */
    {ITEMKIND_ITEM, 0, 125, 77, 206},    /* id 206  Pointy Chestnut */
    {ITEMKIND_ITEM, 0, 126, 78, 207},    /* id 207  Black Knight Crest */
    {ITEMKIND_ITEM, 0, 127, 79, 208},    /* id 208  Horned Key */
    {ITEMKIND_ITEM, 0, 128, 80, 209},    /* id 209  Moon Grass Seed */
    {ITEMKIND_ITEM, 0, 129, 81, 210},    /* id 210  Music Box Key */
    {ITEMKIND_ITEM, 0, 130, 82, 211},    /* id 211  Sun Signet */
    {ITEMKIND_ITEM, 0, 131, 83, 212},    /* id 212  Moon Signet */
    {ITEMKIND_ITEM, 0, 132, 84, 213},    /* id 213  Admission Ticket */
    {ITEMKIND_ITEM, 0, 133, 85, 214},    /* id 214  Sun Sword */
    {ITEMKIND_ITEM, 0, 134, 86, 215},    /* id 215 */
    {ITEMKIND_ITEM, 0, 135, 87, 216},    /* id 216 */
    {ITEMKIND_ITEM, 0, 136, 88, 217},    /* id 217  Bone Key */
    {ITEMKIND_ITEM, 0, 137, 89, 218},    /* id 218  Moustache Key */
    {ITEMKIND_ITEM, 0, 138, 90, 219},    /* id 219  Shipcabin Key */
    {ITEMKIND_ITEM, 0, 139, 91, 220},    /* id 220  Stone Key */
    {ITEMKIND_ITEM, 0, 140, 92, 221},    /* id 221  Handle */
    {ITEMKIND_ITEM, 0, 141, 93, 222},    /* id 222  Pitchdark Key */
    {ITEMKIND_ITEM, 0, 142, 94, 223},    /* id 223  Silver Key */
    {ITEMKIND_ITEM, 0, 143, 95, 224},    /* id 224 */
    {ITEMKIND_ITEM, 0, 144, 96, 225},    /* id 225  Tram Oil */
    {ITEMKIND_ITEM, 0, 145, 97, 226},    /* id 226  Sun Dew */
    {ITEMKIND_ITEM, 0, 146, 98, 227},    /* id 227  Flapping Fish */
    {ITEMKIND_ITEM, 0, 147, 99, 228},    /* id 228  Rotten Fish */
    {ITEMKIND_ITEM, 0, 148, 100, 229},   /* id 229  Secret Path Key */
    {ITEMKIND_ITEM, 0, 149, 101, 230},   /* id 230  Bravery Launch */
    {ITEMKIND_ITEM, 0, 150, 102, 231},   /* id 231  Flapping Duster */
    {ITEMKIND_ITEM, 0, 151, 103, 232},   /* id 232  Crystal Eyeball */
    {ITEMKIND_ITEM, 0, 152, 104, 233},   /* id 233 */
    {ITEMKIND_ITEM, 0, 153, 105, 234},   /* id 234  Map */
    {ITEMKIND_ITEM, 0, 154, 106, 235},   /* id 235  Magical Crystal */
    {ITEMKIND_ITEM, 0, 155, 107, 236},   /* id 236  Dran's Feather */
    {ITEMKIND_ITEM, 0, 156, 108, 237},   /* id 237  Cave Key */
    {ITEMKIND_ITEM, 0, 157, 109, 238},   /* id 238  Changing Potion */
    {ITEMKIND_ITEM, 0, 158, 110, 239},   /* id 239  Worldmap */
    {ITEMKIND_ITEM, 0, 159, 111, 240},   /* id 240  Bone Pendant */
    {ITEMKIND_ITEM, 0, 160, 112, 241},   /* id 241  Odd Tone Flute */
    {ITEMKIND_ITEM, 0, 161, 113, 242},   /* id 242  Magical Lamp */
    {ITEMKIND_ITEM, 0, 162, 114, 243},   /* id 243  Moon Orb */
    {ITEMKIND_ITEM, 0, 163, 115, 244},   /* id 244  Shell Ring */
    {ITEMKIND_ITEM, 0, 164, 116, 245},   /* id 245  Search Warrant */
    {ITEMKIND_ITEM, 0, 165, 117, 246},   /* id 246  Ice Block */
    {ITEMKIND_ITEM, 0, 166, 118, 247},   /* id 247  Small Ice */
    {ITEMKIND_ITEM, 0, 167, 119, 248},   /* id 248  Tiny Ice */
    {ITEMKIND_ITEM, 0, 168, 120, 249},   /* id 249  Flame Key */
    {ITEMKIND_ITEM, 0, 169, 121, 250},   /* id 250  Hunter's Earring */
    {ITEMKIND_ITEM, 0, 170, 122, 251},   /* id 251  Ointment Leaf */
    {ITEMKIND_ITEM, 0, 171, 123, 252},   /* id 252  Foundation */
    {ITEMKIND_ITEM, 0, 172, 124, 253},   /* id 253  Clay Doll */
    {ITEMKIND_ITEM, 0, 173, 125, 254},   /* id 254  Manual */
    {ITEMKIND_ITEM, 0, 174, 126, 255},   /* id 255  Sun Sphere */
    {ITEMKIND_ITEM, 0, 175, 127, -1},    /* id 256 */
    {ITEMKIND_WEAPON, 0, 0, 0, 1},       /* id 257 */
    {ITEMKIND_WEAPON, 0, 1, 1, 2},       /* id 258  Dagger[broken1] */
    {ITEMKIND_WEAPON, 0, 2, 2, 3},       /* id 259  Dagger */
    {ITEMKIND_WEAPON, 0, 3, 3, 4},       /* id 260  Baselard */
    {ITEMKIND_WEAPON, 0, 4, 4, 5},       /* id 261  Gladius */
    {ITEMKIND_WEAPON, 0, 5, 5, 6},       /* id 262  Wise Owl Sword */
    {ITEMKIND_WEAPON, 0, 6, 6, 7},       /* id 263  Crysknife */
    {ITEMKIND_WEAPON, 0, 7, 7, 8},       /* id 264  Antique Sword */
    {ITEMKIND_WEAPON, 0, 8, 8, 9},       /* id 265  Buster Sword */
    {ITEMKIND_WEAPON, 0, 9, 9, 10},      /* id 266  Kitchen Knife */
    {ITEMKIND_WEAPON, 0, 10, 10, 11},    /* id 267  Tsukikage */
    {ITEMKIND_WEAPON, 0, 11, 11, 12},    /* id 268  Sun Sword */
    {ITEMKIND_WEAPON, 0, 12, 12, 13},    /* id 269  Serpent Sword */
    {ITEMKIND_WEAPON, 0, 13, 13, 14},    /* id 270  Macho Sword */
    {ITEMKIND_WEAPON, 0, 14, 14, 15},    /* id 271  Shamshir */
    {ITEMKIND_WEAPON, 0, 15, 15, 16},    /* id 272  Heaven's Cloud */
    {ITEMKIND_WEAPON, 0, 16, 16, 17},    /* id 273  Lamb's Sword */
    {ITEMKIND_WEAPON, 0, 17, 17, 18},    /* id 274  Dark Cloud */
    {ITEMKIND_WEAPON, 0, 18, 18, 19},    /* id 275  Brave Ark */
    {ITEMKIND_WEAPON, 0, 19, 19, 20},    /* id 276  Big Bang */
    {ITEMKIND_WEAPON, 0, 20, 20, 256},   /* id 277  Almighty Pass */
    {ITEMKIND_WEAPON, 0, 21, 21, 257},   /* id 278  weapon No.277 */
    {ITEMKIND_WEAPON, 0, 22, 22, 258},   /* id 279  Mardan Eins */
    {ITEMKIND_WEAPON, 0, 23, 23, 259},   /* id 280  Mardan Twei */
    {ITEMKIND_WEAPON, 0, 24, 24, 260},   /* id 281  Arise Mardan */
    {ITEMKIND_WEAPON, 0, 25, 25, 261},   /* id 282  Aga's Sword */
    {ITEMKIND_WEAPON, 0, 26, 26, 262},   /* id 283  Evilcise */
    {ITEMKIND_WEAPON, 0, 27, 27, 263},   /* id 284  Small Sword */
    {ITEMKIND_WEAPON, 0, 28, 28, 264},   /* id 285  Sand Breaker */
    {ITEMKIND_WEAPON, 0, 29, 29, 265},   /* id 286  Drain Seeker */
    {ITEMKIND_WEAPON, 0, 30, 30, 266},   /* id 287  Chopper */
    {ITEMKIND_WEAPON, 0, 31, 31, 267},   /* id 288  Choora */
    {ITEMKIND_WEAPON, 0, 32, 32, 268},   /* id 289  Claymore */
    {ITEMKIND_WEAPON, 0, 33, 33, 269},   /* id 290  Maneater */
    {ITEMKIND_WEAPON, 0, 34, 34, 270},   /* id 291  Bone Rapier */
    {ITEMKIND_WEAPON, 0, 35, 35, 271},   /* id 292  Sax */
    {ITEMKIND_WEAPON, 0, 36, 36, 272},   /* id 293  7Branch Sword */
    {ITEMKIND_WEAPON, 0, 37, 37, 273},   /* id 294  Dusack */
    {ITEMKIND_WEAPON, 0, 38, 38, 284},   /* id 295  Swallow */
    {ITEMKIND_WEAPON, 0, 39, 39, 285},   /* id 296  7thHeaven */
    {ITEMKIND_WEAPON, 0, 40, 40, 286},   /* id 297  Sword Of Zeus */
    {ITEMKIND_WEAPON, 0, 41, 41, 287},   /* id 298  Chronicle Sword */
    {ITEMKIND_WEAPON, 0, 42, 42, 21},    /* id 299  Atlamillia Sword */
    {ITEMKIND_WEAPON, 0, 43, 43, 22},    /* id 300  WoodenSlingshot[broken1] */
    {ITEMKIND_WEAPON, 0, 44, 44, 23},    /* id 301  Wooden Slingshot */
    {ITEMKIND_WEAPON, 0, 45, 45, 24},    /* id 302  Steel Slingshot */
    {ITEMKIND_WEAPON, 0, 46, 46, 25},    /* id 303  Bandit Slingshot */
    {ITEMKIND_WEAPON, 0, 47, 47, 26},    /* id 304  Steve */
    {ITEMKIND_WEAPON, 0, 48, 48, 27},    /* id 305  Bone Slingshot */
    {ITEMKIND_WEAPON, 0, 49, 49, 28},    /* id 306  Hardshooter */
    {ITEMKIND_WEAPON, 0, 50, 50, 29},    /* id 307  Double Impact */
    {ITEMKIND_WEAPON, 0, 51, 51, 30},    /* id 308  Dragon's Y */
    {ITEMKIND_WEAPON, 0, 52, 52, 31},    /* id 309  DivineBeastTitle */
    {ITEMKIND_WEAPON, 0, 53, 53, 274},   /* id 310  Cross Hinder */
    {ITEMKIND_WEAPON, 0, 54, 54, 275},   /* id 311  Flamingo */
    {ITEMKIND_WEAPON, 0, 55, 55, 288},   /* id 312  Chronicle2 */
    {ITEMKIND_WEAPON, 0, 56, 56, 289},   /* id 313  Super Steve */
    {ITEMKIND_WEAPON, 0, 57, 57, 33},    /* id 314  11 */
    {ITEMKIND_WEAPON, 0, 58, 58, 34},    /* id 315  Mallet[broken1] */
    {ITEMKIND_WEAPON, 0, 59, 59, 35},    /* id 316  Mallet */
    {ITEMKIND_WEAPON, 0, 60, 60, 36},    /* id 317  Steel Hammer */
    {ITEMKIND_WEAPON, 0, 61, 61, 37},    /* id 318  Magical Hammer */
    {ITEMKIND_WEAPON, 0, 62, 62, 38},    /* id 319  Battle Ax */
    {ITEMKIND_WEAPON, 0, 63, 63, 39},    /* id 320  Turtle Shell */
    {ITEMKIND_WEAPON, 0, 64, 64, 40},    /* id 321  Big Bucks Hammer */
    {ITEMKIND_WEAPON, 0, 65, 65, 41},    /* id 322  Frozen Tuna */
    {ITEMKIND_WEAPON, 0, 66, 66, 42},    /* id 323  Gaia Hammer */
    {ITEMKIND_WEAPON, 0, 67, 67, 43},    /* id 324  Last Judgement */
    {ITEMKIND_WEAPON, 0, 68, 68, 44},    /* id 325  Tall Hammer */
    {ITEMKIND_WEAPON, 0, 69, 69, 45},    /* id 326  Satan's Ax */
    {ITEMKIND_WEAPON, 0, 70, 70, 276},   /* id 327  Matador */
    {ITEMKIND_WEAPON, 0, 71, 71, 277},   /* id 328  Plate Hammer */
    {ITEMKIND_WEAPON, 0, 72, 72, 290},   /* id 329  Ange Gear */
    {ITEMKIND_WEAPON, 0, 73, 73, 0},     /* id 330 */
    {ITEMKIND_WEAPON, 0, 74, 74, 46},    /* id 331  12 */
    {ITEMKIND_WEAPON, 0, 75, 75, 47},    /* id 332  Gold Ring[broken1] */
    {ITEMKIND_WEAPON, 0, 76, 76, 48},    /* id 333  Gold Ring */
    {ITEMKIND_WEAPON, 0, 77, 77, 49},    /* id 334  Bandit's Ring */
    {ITEMKIND_WEAPON, 0, 78, 78, 50},    /* id 335  Crystal Ring */
    {ITEMKIND_WEAPON, 0, 79, 79, 51},    /* id 336  Platinum Ring */
    {ITEMKIND_WEAPON, 0, 80, 80, 52},    /* id 337  Goddess Ring */
    {ITEMKIND_WEAPON, 0, 81, 81, 53},    /* id 338  Fairy's Ring */
    {ITEMKIND_WEAPON, 0, 82, 82, 54},    /* id 339  Destruction Ring */
    {ITEMKIND_WEAPON, 0, 83, 83, 55},    /* id 340  Satan's Ring */
    {ITEMKIND_WEAPON, 0, 84, 84, 56},    /* id 341  Athena's Armlet */
    {ITEMKIND_WEAPON, 0, 85, 85, 57},    /* id 342  Mobius Ring */
    {ITEMKIND_WEAPON, 0, 86, 86, 278},   /* id 343  Trial Hammer */
    {ITEMKIND_WEAPON, 0, 87, 87, 279},   /* id 344  Pocklekul */
    {ITEMKIND_WEAPON, 0, 88, 88, 291},   /* id 345  Inferno */
    {ITEMKIND_WEAPON, 0, 89, 89, 0},     /* id 346 */
    {ITEMKIND_WEAPON, 0, 90, 90, 58},    /* id 347  11 */
    {ITEMKIND_WEAPON, 0, 91, 91, 59},    /* id 348  Fighting Stick[broken1] */
    {ITEMKIND_WEAPON, 0, 92, 92, 60},    /* id 349  Fighting Stick */
    {ITEMKIND_WEAPON, 0, 93, 93, 61},    /* id 350  Javelin */
    {ITEMKIND_WEAPON, 0, 94, 94, 62},    /* id 351  Halbert */
    {ITEMKIND_WEAPON, 0, 95, 95, 63},    /* id 352  De Sanga */
    {ITEMKIND_WEAPON, 0, 96, 96, 64},    /* id 353  Scorpion */
    {ITEMKIND_WEAPON, 0, 97, 97, 65},    /* id 354  Partisan */
    {ITEMKIND_WEAPON, 0, 98, 98, 66},    /* id 355  Mirage */
    {ITEMKIND_WEAPON, 0, 99, 99, 67},    /* id 356  Terra Sword */
    {ITEMKIND_WEAPON, 0, 100, 100, 68},  /* id 357  Hercules' Wrath */
    {ITEMKIND_WEAPON, 0, 101, 101, 69},  /* id 358  Babel's Spear */
    {ITEMKIND_WEAPON, 0, 102, 102, 280}, /* id 359  Thorn Armlet */
    {ITEMKIND_WEAPON, 0, 103, 103, 281}, /* id 360  5 Foot Nail */
    {ITEMKIND_WEAPON, 0, 104, 104, 0},   /* id 361 */
    {ITEMKIND_WEAPON, 0, 105, 105, 0},   /* id 362 */
    {ITEMKIND_WEAPON, 0, 106, 106, 70},  /* id 363  11 */
    {ITEMKIND_WEAPON, 0, 107, 107, 71},  /* id 364  Machine Gun[broken1] */
    {ITEMKIND_WEAPON, 0, 108, 108, 72},  /* id 365  Machine Gun */
    {ITEMKIND_WEAPON, 0, 109, 109, 73},  /* id 366  Jackal */
    {ITEMKIND_WEAPON, 0, 110, 110, 74},  /* id 367  Launcher */
    {ITEMKIND_WEAPON, 0, 111, 111, 75},  /* id 368  LauncherV2 */
    {ITEMKIND_WEAPON, 0, 112, 112, 76},  /* id 369  Blessing Gun */
    {ITEMKIND_WEAPON, 0, 113, 113, 77},  /* id 370  Skunk */
    {ITEMKIND_WEAPON, 0, 114, 114, 78},  /* id 371  G CRUSHER */
    {ITEMKIND_WEAPON, 0, 115, 115, 79},  /* id 372  Hexa Blaster */
    {ITEMKIND_WEAPON, 0, 116, 116, 80},  /* id 373  Star Breaker */
    {ITEMKIND_WEAPON, 0, 117, 117, 282}, /* id 374  Cactus */
    {ITEMKIND_WEAPON, 0, 118, 118, 283}, /* id 375  Snail */
    {ITEMKIND_WEAPON, 0, 119, 119, 0},   /* id 376 */
};

WEAPON_DATA *GetWeaponDataInfo(int weapon_no) {
    if (weapon_no < 0) {
        return 0;
    }

    return &WeaponList[weapon_no];
}

COM_ITEM_INFO *GetCommonItemInfo(int item_no) {
    if (item_no <= 0) {
        return 0;
    }

    // Items before slot 81 function as an alias for weapons in the info table.
    if (0 < item_no && item_no < ITEM_ATTACH_START) {
        item_no += 175;
    } else {
        item_no -= ITEM_ATTACH_START;
    }

    return &ComItemInfo[item_no];
}

int GetItemTypeInfo(int item_no, s8 *kind) {
    int index;
    unsigned int not_found = -1;

    if (item_no <= 0) {
        index = not_found;
    } else {
        COM_ITEM_INFO *info = GetCommonItemInfo(item_no);
        *kind = info->kind;
        index = info->index;
    }

    return index;
}

ITEM_DATA *GetItemData(int item_no) {
    s8 kind[4];
    int index = GetItemTypeInfo(item_no, kind);

    if (kind[0] == ITEMKIND_ITEM && 0 <= index) {
        return &ITEM_LIST[index];
    }

    return 0;
}

ATTACH_DATA *GetAttachData(int item_no) {
    s8 kind[4];
    int index = GetItemTypeInfo(item_no, kind);

    if ((kind[0] == ITEMKIND_ATTACH) && (0 <= index)) {
        return &AttachList[index];
    }

    return 0;
}

WEAPON_DATA *GetWeaponData(int item_no) {
    s8 kind[4];
    int index = GetItemTypeInfo(item_no, kind);

    if ((kind[0] == ITEMKIND_WEAPON) && (0 <= index)) {
        return &WeaponList[index];
    }

    return 0;
}

int GetCommonItemDataMsg(int item_no) {
    int msg = 0;
    COM_ITEM_INFO *info = GetCommonItemInfo(item_no);

    if (info != 0) {
        msg = info->msg;
    }

    return msg;
}

int GetCommonItemDataSystemMsg(int item_no) {
    return GetCommonItemDataMsg(item_no) + 100;
}
