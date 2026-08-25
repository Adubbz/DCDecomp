#include "character.hpp"
#include "cloth.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mds.hpp"
#include "gameutil.hpp"
#include "sysmes.hpp"
#include "texture.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#define body_width unk_0B0
#define body_height unk_0B4
#define body_depth unk_0B8
#define model frame
#define shadow_model shadow_frame
#define config unk_0D4
#define config_size unk_0D8
#define images images
#define texture_anime tex_anime
#define motion_ptr motion
#define shadow_motion_ptr shadow_motion
#define cloth cloth

struct MOTION_FILE_INFO {
    char *name;
    u_int *data;
    int size;
};

typedef MOTION_INFO tagMOTION_KEY;


extern "C" double atof(const char* string);
extern "C" int atoi(const char* string);

struct COMMAND_INFO
{
    char* name;
    int args[16];
};

u_int* GetPackFile(u_int* pack, char* name, int* size = 0);
void CreateAnimeDataEX(tagMOTION_TYPE* motion, CDataAlloc2<1>* buffer, MOTION_FILE_INFO* files);
void AnimeDataInit(CFrame* frame, tagMOTION_TYPE* motion, CDataAlloc2<1>* buffer,
                   tagFRAME_INF** frame_info);
void* InitCloth(CFrameVu1* frame, input_str& input, CDataAlloc2<1>* buffer);

static void ReadInfo(CCharacter* value, u_int* pack, char* name, CDataAlloc2<1>* mds,
                     CDataAlloc2<1>* buffer, CDataAlloc2<1>* exbuffer, int visual_type,
                     CDataAlloc2<1>* image_buffer, int texture_block, int dont_delete);
static void CommandVERTEX_ANIME(void** argv);
static void CommandSHADOW_VERTEX_ANIME(void** argv);
static void CommandMODEL(void** argv);
static void CommandSHADOW_MODEL(void** argv);
static void CommandMOTION(void** argv);
static void CommandSHADOW_MOTION(void** argv);
static void CommandKEY_START(void** argv);
static void CommandKEY(void** argv);
static void CommandMOTION_END(void** argv);
static void CommandCLOTH(void** argv);
static void CommandBODY_SIZE(void** argv);
static void CommandALLOC_MDT(void** argv);
static void CommandALLOC_DBUFF(void** argv);
static void CommandALLOC_SHADOW_MDT(void** argv);
static void CommandALLOC_SHADOW_DBUFF(void** argv);
static void CommandIMG(void** argv);
static void CommandIMG_END(void** argv);
static void CommandFOOT(void** argv);
static void CommandEVENT(void** argv);
static int GetArg(input_str& input, int* args, void** argv);
static int SearchCommand(input_str& input, int* command);
static int SkipSpace(input_str& input);
static int CheckChar(char c);
static void PreProcess(input_str& input);

static CDataAlloc2<1>* mds_buffer;
static CDataAlloc2<1>* buffer;
static CDataAlloc2<1>* exbuffer;
static CDataAlloc2<1>* img_buffer;
static int texture_block;
static CCharacter* character;
static int vertex_anime;
static int def_vtype;
static int shadow_vertex_anime;
static u_int* pack_data;
static int motion_info_num;
static int key_start;
static int key_no;
static tagMOTION_KEY* motion_info;
static int cloth_cnt;
static int now_motion_data;
static int shadow_motion;
static int dont_delete_texb;
static int alloc_mdt_list;
static int alloc_dbuff_list;
static int alloc_smdt_list;
static int alloc_sdbuff_list;
static int fsound_num;
static int tex_anime_list;
static char* config_file;
static int config_file_size;

static char alloc_mdt[9][16];
static char alloc_dbuff[9][16];
static char alloc_smdt[9][16];
static char alloc_sdbuff[9][16];
static u_int* load_img[4];


static COMMAND_INFO Command[19] = {
    {"VERTEX_ANIME", {1, -1}},
    {"SHADOW_VERTEX_ANIME", {1, -1}},
    {"MODEL", {0, -1}},
    {"SHADOW_MODEL", {0, -1}},
    {"MOTION", {1, 0, 0, 0, -1}},
    {"SHADOW_MOTION", {0, 0, 0, -1}},
    {"KEY", {1, 1, 2, -1}},
    {"KEY_START", {1, -1}},
    {"MOTION_END", {-1}},
    {"CLOTH", {0, -1}},
    {"BODY_SIZE", {2, 2, 2, -1}},
    {"ALLOC_MDT", {0, -1}},
    {"ALLOC_DBUFF", {0, -1}},
    {"ALLOC_SHADOW_MDT", {0, -1}},
    {"ALLOC_SHADOW_DBUFF", {0, -1}},
    {"IMG", {1, 0, -1}},
    {"IMG_END", {-1}},
    {"FOOT", {2, 2, -1}},
    {"EVENT", {2, 1, 1, -1}}
};

static void (*CommandExe[19])(void**) = {
    CommandVERTEX_ANIME,
    CommandSHADOW_VERTEX_ANIME,
    CommandMODEL,
    CommandSHADOW_MODEL,
    CommandMOTION,
    CommandSHADOW_MOTION,
    CommandKEY,
    CommandKEY_START,
    CommandMOTION_END,
    CommandCLOTH,
    CommandBODY_SIZE,
    CommandALLOC_MDT,
    CommandALLOC_DBUFF,
    CommandALLOC_SHADOW_MDT,
    CommandALLOC_SHADOW_DBUFF,
    CommandIMG,
    CommandIMG_END,
    CommandFOOT,
    CommandEVENT
};

static void ReadInfo(CCharacter* value, u_int* pack, char* name, CDataAlloc2<1>* mds,
                     CDataAlloc2<1>* data, CDataAlloc2<1>* extra, int block,
                     CDataAlloc2<1>* image_buffer, int visual_type, int no_delete)
{
    char arg_data[16][256];
    char* argv[18];
    int size;
    int command;

    def_vtype = visual_type;
    mds_buffer = mds;
    buffer = data;
    exbuffer = extra;
    img_buffer = image_buffer;
    character = value;
    pack_data = pack;
    vertex_anime = 0;
    shadow_vertex_anime = 0;
    motion_info_num = 0;
    key_start = 0;
    key_no = 0;
    motion_info = 0;
    cloth_cnt = 0;
    now_motion_data = 0;
    shadow_motion = 0;
    texture_block = block;
    alloc_mdt[0][0] = 0;
    alloc_dbuff[0][0] = 0;
    alloc_smdt[0][0] = 0;
    alloc_sdbuff[0][0] = 0;
    alloc_mdt_list = 0;
    alloc_dbuff_list = 0;
    alloc_smdt_list = 0;
    alloc_sdbuff_list = 0;
    fsound_num = 0;
    dont_delete_texb = no_delete;
    for (int i = 0; i < 4; i++) {
        load_img[i] = 0;
    }
    tex_anime_list = 0;

    if (value != 0) {
        char* file = (char*)GetPackFile(pack, name, &size);
        if (file == 0) {
            printf("not found %s\n", name);
        } else {
            config_file = file;
            config_file_size = size;
            input_str input;
            input.data = config_file;
            input.size = size;
            input.pos = 0;
            PreProcess(input);
            SkipSpace(input);
            for (int i = 0; i < 16; i++) {
                argv[i] = arg_data[i];
            }
            while (SearchCommand(input, &command)) {
                if (command < 19 && command >= 0) {
                    int result = GetArg(input, Command[command].args, (void**)argv);
                    if (result == 0) {
                        return;
                    }
                    if (result < 0) {
                        printf("error!! at %s\n", Command[command].name);
                    }
                    CommandExe[command]((void**)argv);
                }
            }
        }
    }
}

static void CommandVERTEX_ANIME(void** argv)
{
    vertex_anime = *(int*)argv[0];
}

static void CommandSHADOW_VERTEX_ANIME(void** argv)
{
    shadow_vertex_anime = *(int*)argv[0];
}

static void CommandMODEL(void** argv)
{
    character->Initialize();
    int visual_type = def_vtype;
    if (vertex_anime != 0) visual_type = 6;
    if ((def_vtype & 16) != 0) visual_type = 18;
    u_int* model = GetPackFile(pack_data, (char*)argv[0]);
    if (model == 0) {
        char* missing = (char*)argv[0];
        printf("not found %s\n", missing);
    } else {
        if (alloc_dbuff_list > 0 || alloc_mdt_list > 0) {
            char* mdt[12];
            char* dbuff[12];
            int i;
            for (i = 0; i < alloc_mdt_list; i++) mdt[i] = alloc_mdt[i];
            mdt[i] = 0;
            for (i = 0; i < alloc_dbuff_list; i++) dbuff[i] = alloc_dbuff[i];
            dbuff[i] = 0;
            character->model = LoadMDSFile(model, mds_buffer, 0, dbuff, mdt);
        } else {
            character->model = LoadMDSFile(model, mds_buffer, visual_type, 0, 0);
        }
        character->config = (char*)mds_buffer->Alloc((config_file_size >> 4) + 1);
        character->config_size = config_file_size;
        memcpy(character->config, config_file, config_file_size);
    }
}

static void CommandSHADOW_MODEL(void** argv)
{
    int visual_type = 8;
    if (shadow_vertex_anime != 0) visual_type = 14;
    u_int* model = GetPackFile(pack_data, (char*)argv[0]);
    if (model == 0) {
        char* missing = (char*)argv[0];
        printf("not found %s\n", missing);
    } else {
        character->shadow_model = LoadMDSFile(model, mds_buffer, visual_type, 0, 0);
    }
}

static void CommandMOTION(void** argv)
{
    if (character->model == 0) return;
    now_motion_data = *(int*)argv[0];
    character->ClearEvent(now_motion_data);
    if (now_motion_data < 0 || now_motion_data >= 8) return;
    if (now_motion_data > 0) character->motion_ptr[now_motion_data] =
        (tagMOTION_TYPE *)character->unk_420[now_motion_data];
    tagMOTION_TYPE* motion = character->motion_ptr[now_motion_data];
    memset(motion, 0, sizeof(tagMOTION_TYPE));
    char* name1 = (char*)argv[1];
    char* name0 = (char*)argv[2];
    char* name2 = (char*)argv[3];
    MOTION_FILE_INFO files[3];
    files[1].name = name1;
    files[0].name = name0;
    files[2].name = name2;
    files[0].size = 0;
    files[1].size = 0;
    files[2].size = 0;
    files[0].data = GetPackFile(pack_data, name0, &files[0].size);
    files[1].data = GetPackFile(pack_data, name1, &files[1].size);
    files[2].data = GetPackFile(pack_data, name2, &files[2].size);
    if (files[0].size == 0) files[0].name = 0;
    if (files[1].size == 0) files[1].name = 0;
    if (files[2].size == 0) files[2].name = 0;
    CreateAnimeDataEX(motion, buffer, files);
    if (character->unk_2cc == 0) {
        AnimeDataInit(character->model, motion, mds_buffer, &character->unk_2cc);
    }
    motion->frame_info = character->unk_2cc;
    motion_info_num = 0;
    key_no = 0;
    motion_info = 0;
}

static void CommandSHADOW_MOTION(void** argv)
{
    if (character->shadow_model == 0) return;
    if (now_motion_data < 0 || now_motion_data >= 8) return;
    if (now_motion_data > 0) character->shadow_motion_ptr[now_motion_data] =
        (tagMOTION_TYPE *)character->unk_820[now_motion_data];
    tagMOTION_TYPE* motion = character->shadow_motion_ptr[now_motion_data];
    memset(motion, 0, sizeof(tagMOTION_TYPE));
    shadow_motion = 1;
    char* name1 = (char*)argv[0];
    char* name0 = (char*)argv[1];
    char* name2 = (char*)argv[2];
    MOTION_FILE_INFO files[3];
    files[0].size = 0;
    files[1].size = 0;
    files[2].size = 0;
    files[1].name = name1;
    files[0].name = name0;
    files[2].name = name2;
    files[0].data = GetPackFile(pack_data, name0, &files[0].size);
    files[1].data = GetPackFile(pack_data, name1, &files[1].size);
    files[2].data = GetPackFile(pack_data, name2, &files[2].size);
    if (name0[0] == 0) files[0].name = 0;
    if (name2[0] == 0) files[2].name = 0;
    if (files[0].data == 0 && files[1].data == 0 && files[2].data == 0) return;
    CreateAnimeDataEX(motion, buffer, files);
    if (character->unk_2d0 == 0) {
        AnimeDataInit(character->shadow_model, motion, mds_buffer,
                      &character->unk_2d0);
    }
    motion->frame_info = character->unk_2d0;
}

static void CommandKEY_START(void** argv)
{
    if (now_motion_data < 0 || now_motion_data >= 8) return;
    key_start = *(int*)argv[0];
    character->motion_start[now_motion_data] = key_start;
}

static void CommandKEY(void** argv)
{
    if (motion_info == 0) {
        motion_info = (tagMOTION_KEY*)(buffer->base + buffer->used * 16);
    }
    tagMOTION_KEY* info = motion_info + key_no;
    info->start = *(int*)argv[0];
    info->end = *(int*)argv[1];
    info->speed = *(float*)argv[2];
    key_no++;
    motion_info_num = key_no;
}

static void CommandMOTION_END(void**)
{
    if (now_motion_data < 0 || now_motion_data >= 8 || motion_info == 0) return;
    tagMOTION_TYPE* motion = character->motion_ptr[now_motion_data];
    buffer->Alloc((((unsigned int)(motion_info_num + 1) << 4) >> 4) + 1);
    motion_info[motion_info_num].start = -1;
    motion_info[motion_info_num].end = -1;
    motion_info[motion_info_num].speed = -1.0f;
    motion->motion_info = motion_info;
    motion->state.time = (float)motion->motion_info->start;
    motion->state.unk_04 = 0.1f;
    motion->state.unk_10 = 0;
    motion->state.motion_no = 0;
    motion->state.playing_no = 0;
    if (shadow_motion != 0) {
        tagMOTION_TYPE* shadow = character->shadow_motion_ptr[now_motion_data];
        shadow->motion_info = motion_info;
        shadow->state.time = (float)shadow->motion_info->start;
        shadow->state.unk_04 = 0.1f;
        shadow->state.unk_10 = 0;
        shadow->state.motion_no = 0;
        shadow->state.playing_no = 0;
    }
    character->motion_end[now_motion_data] = key_start + key_no;
}

static void CommandCLOTH(void** argv)
{
    int size;
    u_int* file = GetPackFile(pack_data, (char*)argv[0], &size);
    if (file != 0) {
        input_str input;
        input.data = (char*)file;
        input.size = size;
        input.pos = 0;
        character->cloth[cloth_cnt] =
            (CCloth *)InitCloth((CFrameVu1 *)character->model, input, buffer);
        cloth_cnt++;
    }
}

static void CommandBODY_SIZE(void** argv)
{
    character->body_height = *(float*)argv[0];
    character->body_width = *(float*)argv[1];
    character->body_depth = *(float*)argv[2];
}

static void CommandALLOC_MDT(void** argv)
{
    if (alloc_mdt_list < 8) strcpy(alloc_mdt[alloc_mdt_list++], (char*)argv[0]);
}

static void CommandALLOC_DBUFF(void** argv)
{
    if (alloc_dbuff_list < 8) strcpy(alloc_dbuff[alloc_dbuff_list++], (char*)argv[0]);
}

static void CommandALLOC_SHADOW_MDT(void** argv)
{
    if (alloc_smdt_list < 8) strcpy(alloc_smdt[alloc_smdt_list++], (char*)argv[0]);
}

static void CommandALLOC_SHADOW_DBUFF(void** argv)
{
    if (alloc_sdbuff_list < 8) strcpy(alloc_sdbuff[alloc_sdbuff_list++], (char*)argv[0]);
}

static void CommandIMG(void** argv)
{
    if (img_buffer == 0) return;
    int index = *(int*)argv[0];
    if (index < 0 || index >= 4) return;
    int size;
    u_int* file = GetPackFile(pack_data, (char*)argv[1], &size);
    if (file != 0) {
        load_img[index] = (u_int*)img_buffer->Alloc((size >> 4) + 1);
        memcpy(load_img[index], file, size);
    }
}

static void CommandIMG_END(void**)
{
    LOADTEXTURE_INFO2 info[5];
    info[0].block_no = 0;
    info[0].unk_08 = 0;
    info[0].name = 0;
    int i;
    int count = 0;
    if (character->images[0] != 0 && load_img[0] == 0) load_img[0] = character->images[0];
    for (i = 0; i < 4; i++) {
        character->images[i] = load_img[i];
        if (load_img[i] != 0) {
            info[count].block_no = texture_block;
            info[count].unk_08 = 0;
            info[count].name = (char*)load_img[i];
            count++;
        }
    }
    info[count].block_no = 0;
    info[count].unk_08 = 0;
    info[count].name = 0;
    if (count > 0) {
        if (dont_delete_texb == 0) TexManager.DeleteTextureBlock(texture_block);
        TexManager.LoadTextureBlockEX(texture_block, info);
    }
    if (config_file != 0) {
        character->texture_anime.LoadCFGFile(config_file, config_file_size);
    }
}

static void CommandFOOT(void** argv)
{
    character->SetFootSound(*(float*)argv[0], *(float*)argv[1], now_motion_data);
}

static void CommandEVENT(void** argv)
{
    if (*(int*)argv[1] >= 0) {
        character->SetEvent(*(float*)argv[0], *(int*)argv[1], *(int*)argv[2], now_motion_data);
    }
}

static int GetArg(input_str& input, int* args, void** argv)
{
    char word[256];
    if (args[0] < 0) return 1;
    if (!SkipSpace(input)) return 0;
    int argc = 0;
    while (args[argc++] >= 0) ;
    int c;
    for (int i = 0; i < argc - 1; i++) {
        int length = 0;
        if (!SkipSpace(input)) return 0;
        while (1) {
            if (input.get(&c) == 0) return 0;
            if (c == ',' || !CheckChar(c)) break;
            word[length++] = c;
        }
        word[length] = 0;
        if (args[i] != 2) {
            length = 1;
            if (args[i] != 1) {
                switch (args[i]) {
                case 0:
                    break;
                default:
                    goto invalid_type;
                }
                {
                    if (word[0] != '"') return -1;
                    while (1) {
                        char value = word[length];
                        if (value == '"') {
                            word[length] = 0;
                            break;
                        }
                        if (value == 0) return -1;
                        length++;
                    }
                    strcpy((char*)argv[i], word + 1);
                    goto next_arg;
                }
            } else {
                for (length = 0; word[length] != 0; length++) {
                    char value = word[length];
                    if (value < '0' || value > '9') return -1;
                }
                *(int*)argv[i] = atoi(word);
                goto next_arg;
            }
        } else {
            for (length = 0; word[length] != 0; length++) {
                char value = word[length];
                if ((value < '0' || value > '9') && value != '.' && value != '-') return -1;
            }
            *(float*)argv[i] = (float)atof(word);
            goto next_arg;
        }
invalid_type:
        return -1;
next_arg:
        ;
    }
    return 1;
}

static int SearchCommand(input_str& input, int* command)
{
    char word[256];
    if (!SkipSpace(input)) return 0;
    int length = 0;
    int c;
    while (1) {
        if (input.get(&c) == 0 && length == 0) return 0;
        if (!CheckChar(c)) break;
        word[length++] = c;
    }
    word[length] = 0;
    for (int i = 0; i < 19; i++) {
        if (strcmp(Command[i].name, word) == 0) {
            *command = i;
            return 1;
        }
    }
    *command = 20;
    return 1;
}

static int SkipSpace(input_str& input)
{
    char* str;
    int i;

    str = input.data;
    i = input.pos;
    while (i < input.size) {
        if (CheckChar(str[i])) {
            break;
        }
        i++;
    }
    input.pos = i;

    if (i >= input.size) return 0;
    return 1;
}

static int CheckChar(char c)
{
    int found = 0;
    if (c == ' ') found = 1;
    if (c == '\t') found = 1;
    if (c == '\n') found = 1;
    if (c == '\r') found = 1;
    return !found;
}

static void PreProcess(input_str& input)
{
    u_char* str;
    int i;

    str = (u_char*)input.data;
    i = 0;
    while (i < input.size) {
        if (str[i] == '/' && str[i + 1] == '/') {
            while (i < input.size) {
                if (str[i] == '\n' || str[i] == '\r') {
                    break;
                }
                str[i] = ' ';
                i++;
            }
        }
        if (str[i] == '/' && str[i + 1] == '*') {
            while (i < input.size) {
                if (str[i] == '*' && str[i + 1] == '/') {
                    str[i] = ' ';
                    str[i + 1] = ' ';
                    break;
                }
                str[i] = ' ';
                i++;
            }
            continue;
        }
        i++;
    }
}


INCLUDE_ASM("asm/nonmatchings/chararead", StopCloth__10CCharacterFi);
INCLUDE_ASM("asm/nonmatchings/chararead", StretchBind2__FPfPfPf);
INCLUDE_ASM("asm/nonmatchings/chararead", vuabs__FPf);
