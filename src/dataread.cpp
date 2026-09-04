#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 187

#include "common.h"
#include "sce/libcdvd.h"
#include "sce/sifdev.h"
#include "sce/sifrpc.h"

#include <cassert>
#include <cstdio>
#include <cstring>

#include "btsysscript.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "sysmes.hpp"

extern CSaveData *SaveData;
extern CSound CSnd;
extern short *SystemMes;
extern int LanguageCode;
extern int BtMapJumpFloor;
extern CDataAlloc<1, 6000> SystemMesBuffer;

void DevInit(void);
void SndInitSeTable(void);

static int play_time_count = 1;

/* One record of the archive's index file. The four numbers a read needs sit behind twelve bytes
   the index does not use, and the first word is where the entry's name begins in the same file. */
struct DATA_HEADER_READ {
    int name;
    int reserved[3];
    int offset;
    int size;
    int sector;
    int sectors;
};

/* One file inside a pack. The name is the entry's own first bytes, everything it locates is a byte
   offset from the entry rather than from the pack, and a first byte of zero ends the table — so a
   pack can be walked without being told how many files it holds. */
struct PACK_ENTRY {
    char name[64];
    int offset;
    int size;
    int next;
};

/* The index is turned into a tree of path components rather than a list of names, so a lookup
   costs one search per component instead of one comparison per entry. A directory carries no
   entry of its own and leaves the header null. */
struct NAME_TREE {
    char *name;
    DATA_HEADER *data;
    NAME_TREE *child;
    NAME_TREE *next;
};

static char CurrentDir[256] = "y:/ps2/dc_data/";

static int header_num;
static u_int *packfile_buff;
static NAME_TREE *tree;
static int data_sector;
static int old_vsync;
static int start_vsync;

static u_char header_buff[0x40000];
static BG_READ_INFO bg_read_info[32];

static NAME_TREE *search_tree(NAME_TREE *node, char *name);
static int CDRead(char *name, u_int *buffer, int *size);

static void copy_data_head(DATA_HEADER *head, DATA_HEADER_READ *read) {
    head->name = read->name;
    head->offset = read->offset;
    head->size = read->size;
    head->sector = read->sector;
    head->sectors = read->sectors;
}

static DATA_HEADER *SearchFile(char *name) {
    NAME_TREE *node;
    char *p;
    char c;
    char word[256];

    p = word;
    node = tree;
    while ((c = *name) != 0) {
        if (c == '/') {
            *p = 0;
            node = search_tree(node, word);
            if (!node)
                return 0;
            name++;
            p = word;
        } else {
            *p = c;
            name++;
            p++;
        }
    }
    *p = 0;
    node = search_tree(node, word);
    if (!node)
        return 0;
    return node->data;
}

void InitReadBG() {
    int i;

    for (i = 0; i < 32; i++)
        bg_read_info[i].busy = 0;
    old_vsync = -1;
    start_vsync = 0;
}

/* The buffer goes to the drive rather than through the processor, so an address the drive cannot
   reach is fatal rather than slow, and one that is not on a 64-byte boundary is only reported. */
int LoadFileBG(char *name, u_long128 *buffer, int *size) {
    BG_READ_INFO *info;
    DATA_HEADER *head;
    int i;

    if (size)
        *size = 0;
    if (!name)
        return 0;
    if (*name == 0)
        return 0;
    info = bg_read_info;
    for (i = 0; i < 32; i++, info++) {
        if (info->busy == 0)
            break;
    }
    if (i == 32)
        return 0;
    if ((int) buffer > 0x2000000) {
        printf("address error\n");
        for (;;)
            ;
    }
    if ((int) buffer % 64)
        printf("/*/*/*/*/not 64byte align at %x %s\n", buffer, name);
    head = SearchFile(name);
    if (!head)
        return 0;
    strcpy(info->name, name);
    info->busy = 1;
    info->id = 0;
    info->done = 0;
    info->buffer = buffer;
    info->size = head->size;
    if (size)
        *size = head->size;
    info->sector = head->sector + data_sector;
    info->sectors = head->sectors;
    return 1;
}

BG_READ_INFO *GetReadBGFile(int no) {
    if (no < 0 || no >= 32)
        return 0;
    return bg_read_info[no].busy ? &bg_read_info[no] : 0;
}

void StartReadBG() {
    InitReadBG();
}

/* One read is issued per vertical sync and the same call collects it, so a queued file costs two
   frames at best and the queue is walked from the front every time. */
void ReadBG() {
    BG_READ_INFO *info;
    sceCdRMode mode;
    int count;
    int i;

    count = MGGetVSyncCount();
    if (old_vsync == count)
        return;
    old_vsync = count;
    start_vsync++;
    mode.trycount = 0;
    mode.spindlctrl = 1;
    mode.datapattern = 0;
    info = bg_read_info;
    for (i = 0; i < 32; i++, info++) {
        if (info->busy) {
            if (info->id != 0 && info->done == 0)
                break;
            if (info->id == 0 && info->done == 0)
                break;
        }
    }
    if (i == 32)
        return;
    if (info->id == 0) {
        start_vsync = 0;
        info->id = sceCdRead(info->sector, info->sectors, info->buffer, &mode);
    } else if (info->id != 0) {
        if (sceCdSync(1))
            return;
        if (sceCdGetError()) {
            printf("error at %s\n", info->name);
            info->id = 0;
            return;
        }
        info->done = 1;
    }
}

int ReadBGSync() {
    int i;
    BG_READ_INFO *info;

    ReadBG();
    info = bg_read_info;
    for (i = 0; i < 32; i++, info++) {
        if (info->busy) {
            if (info->id == 0)
                break;
            if (info->done == 0)
                break;
        }
    }
    if (i == 32)
        return 0;
    return 1;
}

void BreakReadBG() {
    sceCdBreak();
    InitReadBG();
}

/* A component is looked for in the whole subtree rather than among the node's own children, so a
   path whose middle components are spelled wrong still finds its entry. */
static NAME_TREE *search_tree(NAME_TREE *node, char *name) {
    NAME_TREE *found;

    if (strcasecmp(node->name, name) == 0)
        return node;
    node = node->child;
    while (node) {
        found = search_tree(node, name);
        if (found)
            return found;
        node = node->next;
    }
    return 0;
}

static void add_tree(NAME_TREE *parent, NAME_TREE *node) {
    NAME_TREE *p;

    p = parent->child;
    if (p == 0) {
        parent->child = node;
        return;
    }
    for (;;) {
        if (p->next == 0) {
            p->next = node;
            return;
        }
        p = p->next;
    }
}

/* The whole tree is built inside the one buffer it is handed: the nodes and their headers grow up
   from the bottom and the names down from the top, so nothing is ever freed and the two meeting is
   what the size report at the end is for. */
static char *create_word_tree(char *head, int size, char *buff) {
    DATA_HEADER_READ *rec;
    NAME_TREE *parent;
    char *alloc;
    char *top;
    int i;
    char *q;
    NAME_TREE *node;
    char *p;
    char *w;
    char c;
    char word[256];

    alloc = buff;
    top = buff + size - 1;
    tree = (NAME_TREE *) buff;
    tree->next = 0;
    tree->child = 0;
    tree->data = 0;
    tree->name = buff + 16;
    buff[16] = 0;
    alloc += 32;
    header_num = *(u_int *) head >> 5;
    for (i = 0; i < header_num; i++) {
        rec = (DATA_HEADER_READ *) (head + i * 32);
        p = (char *) (rec->name + (int) head);
        q = p;
        while ((c = *q) != 0) {
            if (c == '\\')
                *q = '/';
            q++;
        }
        q = p;
        w = word;
        parent = tree;
        for (;;) {
            c = *q;
            if (c == '/' || c == 0) {
                *w = 0;
                if (word[0] == 0)
                    break;
                node = search_tree(parent, word);
                if (!node) {
                    node = (NAME_TREE *) alloc;
                    memset(alloc, 0, 16);
                    alloc += 16;
                    top -= strlen(word) + 1;
                    strcpy(top, word);
                    node->name = top;
                    add_tree(parent, node);
                }
                parent = node;
                w = word;
                if (*q == 0) {
                    node->data = (DATA_HEADER *) alloc;
                    copy_data_head(node->data, rec);
                    alloc += 20;
                    break;
                }
                q++;
            } else {
                *w = c;
                q++;
                w++;
            }
        }
    }
    printf("file header size = %d\n", size - (top - alloc));
    return buff;
}

/* The drive is asked for the data file itself only to learn where it starts; everything after this
   is read by sector from that base, which is why no path but the index's is ever opened. */
void InitCDFile() {
    char buff[307200];
    sceCdlFILE file;
    int fd;
    int size;

    packfile_buff = 0;
    while (1) {
        if (sceCdSearchFile(&file, "\\DATA.DAT;1")) {
            sceCdSync(0);
            if (sceCdGetError() == 0)
                break;
        }
    }
    data_sector = file.lsn;
    fd = sceOpen("cdrom0:\\DATA.HD2;1", SCE_RDONLY);
    if (fd < 0) {
        printf("File open error \"\"\n \n \n");
        /* The file and line the original's assertion carries are spelled out: a reconstruction
           whose lines fall elsewhere cannot reach them through __FILE__ and __LINE__. */
        __assert("etc.cpp", 556, "FALSE");
    }
    size = sceLseek(fd, 0, SCE_SEEK_END);
    sceLseek(fd, 0, SCE_SEEK_SET);
    sceRead(fd, buff, size);
    sceClose(fd);
    create_word_tree(buff, sizeof header_buff, (char *) header_buff);
}

void InitMemoryFile() {
}

int LoadFile(char *name, void *buffer, int *size) {
    if (!LoadFile2(name, buffer, size, 0)) {
        printf("File open error \"%s\"\n \n \n", name);
        __assert("etc.cpp", 740, "FALSE");
    }
    return 1;
}

/* A name may carry a device in front of a colon, which is dropped: everything the game ships with
   is on the disc, and the development tree the other devices reached is what CurrentDir names. */
int LoadFile2(char *name, void *buffer, int *size, int mode) {
    char *p;
    char *w;
    char *fname;
    char c;
    int host_file;
    char word[256];

    if (size)
        *size = 0;

    /* The two devices the development build could read through instead of the disc. Nothing left
       here reads either one; they are what the test below was written against. */
    char sim[16] = "sim:";
    char host[16] = "host:";

    p = name;
    w = word;
    while ((c = *p) != 0) {
        if (c == ':')
            break;
        *w = c;
        w++;
        p++;
    }
    if (c)
        fname = p + 1;
    else
        fname = name;
    /* Reading through the host machine is what the development tree was for, and the retail build
       keeps the question and does nothing with the answer. */
    if (memcmp(word, "host", 4) != 0 && memcmp(CurrentDir, "host:", 4) == 0) {
        host_file = 1;
    }
    if ((int) buffer > 0x2000000) {
        printf("address error\n");
        for (;;)
            ;
    }

    char path[256] = "";

    strcat(path, fname);
    return CDRead(path, (u_int *) buffer, size);
}

static int CDRead(char *name, u_int *buffer, int *size) {
    DATA_HEADER *head;
    sceCdRMode mode;

    head = SearchFile(name);
    if (!head)
        return 0;
    mode.trycount = 0;
    mode.spindlctrl = 1;
    mode.datapattern = 0;
    while (1) {
        if (sceCdRead(head->sector + data_sector, head->sectors, buffer, &mode)) {
            sceCdSync(0);
            if (sceCdGetError() == 0)
                break;
        }
    }
    if (size)
        *size = head->size;
    return 1;
}

int WriteFile(char *name, void *buffer, int size) {
    int fd;

    fd = sceOpen(name, SCE_WRONLY | SCE_CREAT | SCE_TRUNC);
    if (fd < 0)
        return 0;
    sceWrite(fd, buffer, size);
    sceClose(fd);
    return 1;
}

int LoadPackFile(char *name, u_int *buffer, int *size) {
    packfile_buff = buffer;
    if (!LoadFile2(name, buffer, size, 0)) {
        packfile_buff = 0;
        return 0;
    }
    return 1;
}

u_int *GetPackFile(char *name, int *size) {
    return GetPackFile(packfile_buff, name, size);
}

/* A pack is looked up by the last component of a path, so a caller may name a file the way the
   archive spells it and still find it inside the pack it was loaded from. */
u_int *GetPackFile(u_int *pack, char *name, int *size) {
    char *fname;
    PACK_ENTRY *entry;
    u_int *data;
    char c;

    if (!pack)
        return 0;
    fname = name;
    while ((c = *name) != 0) {
        if (c == '/')
            fname = name + 1;
        name++;
    }
    entry = (PACK_ENTRY *) pack;
    while (entry->name[0]) {
        if (strcasecmp(entry->name, fname) == 0) {
            data = (u_int *) ((char *) entry + entry->offset);
            if (size)
                *size = entry->size;
            return data;
        }
        entry = (PACK_ENTRY *) ((char *) entry + entry->next);
    }
    return 0;
}

u_int *GetPackFile(u_int *pack, int no, char **name, int *size) {
    PACK_ENTRY *entry;
    u_int *data;
    int i;

    if (!pack)
        return 0;
    entry = (PACK_ENTRY *) pack;
    i = 0;
    while (entry->name[0]) {
        if (no == i) {
            data = (u_int *) ((char *) entry + entry->offset);
            if (size)
                *size = entry->size;
            *name = entry->name;
            return data;
        }
        entry = (PACK_ENTRY *) ((char *) entry + entry->next);
        i++;
    }
    return 0;
}

/* Every file of one extension at once, which is how a pack of animations or textures is taken
   whole. The caller says how many it has room for and gets back how many it was given. */
int GetPackFileExt(u_int *pack, char *ext, u_int **files, int max, int *sizes, char **names) {
    int found;
    int i;
    u_int *data;
    char *p;
    char c;
    int size;
    char *name;

    found = 0;
    i = 0;
    for (;;) {
        data = GetPackFile(pack, i, &name, &size);
        if (!data)
            break;
        p = name;
        while ((c = *p) != 0) {
            if (c == '.') {
                p++;
                break;
            }
            p++;
        }
        if (strcasecmp(ext, p) == 0) {
            files[found] = data;
            if (names)
                names[found] = name;
            if (sizes)
                sizes[found] = size;
            found++;
            if (found >= max)
                break;
        }
        i++;
    }
    return found;
}

static void CommandSIZE(void **argv);
static void CommandFRAME(void **argv);
static void CommandNORMAL(void **argv);
static void CommandFOLLOW(void **argv);
static void CommandK(void **argv);
static void CommandWINDEFFECT(void **argv);
static void CommandGRAVITY(void **argv);
static void CommandPOLYDIVE(void **argv);
static void CommandBOUND(void **argv);

/**
 *              Names one keyword of the cloth configuration file.
 *
 * The argument list gives each argument's kind -- 0 for a word, 1 for an
 * integer, 2 for a float -- and ends at -1.
 */
struct COMMAND_INFO {
    char *name;   /**< Keyword the line starts with. */
    int args[16]; /**< Kind of each argument, ended by -1. */
};

/* The keywords a cloth configuration file may use. */
static COMMAND_INFO Command[9] = {
    {"SIZE", {1, 1, -1}},
    {"FRAME", {0, -1}},
    {"NORMAL", {2, -1}},
    {"FOLLOW", {2, 2, 2, -1}},
    {"K", {2, 2, 2, -1}},
    {"WINDEFFECT", {2, -1}},
    {"GRAVITY", {2, 2, 2, -1}},
    {"POLYDIV", {0, -1}},
    {"BOUND", {0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, -1}},
};

/* What each of those keywords does, in the same order. */
static void (*CommandExe[9])(void **) = {
    CommandSIZE,
    CommandFRAME,
    CommandNORMAL,
    CommandFOLLOW,
    CommandK,
    CommandWINDEFFECT,
    CommandGRAVITY,
    CommandPOLYDIVE,
    CommandBOUND,
};

INCLUDE_RODATA("asm/nonmatchings/dataread", LIT_254);
INCLUDE_RODATA("asm/nonmatchings/dataread", LIT_255);

INCLUDE_ASM("asm/nonmatchings/dataread", InitCloth__FP9CFrameVu1R9input_strP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandSIZE__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandFRAME__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandNORMAL__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandFOLLOW__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandK__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandWINDEFFECT__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandGRAVITY__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandPOLYDIVE__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", CommandBOUND__FPPv);
INCLUDE_ASM("asm/nonmatchings/dataread", GetArg__FR9input_strPiPPv__2);
INCLUDE_ASM("asm/nonmatchings/dataread", SearchCommand__FR9input_strPi__2);
INCLUDE_ASM("asm/nonmatchings/dataread", SkipSpace__FR9input_str__2);
INCLUDE_ASM("asm/nonmatchings/dataread", CheckChar__Fc__2);
INCLUDE_ASM("asm/nonmatchings/dataread", keyCtrl__FffP11MOTION_INFO);
INCLUDE_ASM("asm/nonmatchings/dataread", MoveImageTest__FP13sceVif1PacketiiiRC8CRect_i_iiiiii);
INCLUDE_ASM("asm/nonmatchings/dataread", unitRotation__FP9CFrameVu1f);
/* The overlay each map number is served from; an empty name means the map runs out of the
   executable itself. */
static char *binfile[15] = {"TITLE.BIN", "TITLE.BIN", "", "DUN.BIN", "DUN.BIN",
                            "TITLE.BIN", "", "", "DUN.BIN", "DUN.BIN",
                            "", "", "", "", ""};

/* The overlay that is loaded now, so asking for it again costs nothing. */
static char now_binfile[128] = "";

void LoadOverlay(int mode) {
    if (binfile[mode][0] == '\0')
        return;
    if (strcmp(binfile[mode], now_binfile) == 0)
        return;

    strcpy(now_binfile, binfile[mode]);
    void *address = *(void **) 0x002A17B4;
    char path[128] = "cdrom0:\\";
    strcat(path, binfile[mode]);
    strcat(path, ";1");
    mwLoadOverlay(path, address);
}

void init_all() {
    sceSifInitRpc(0);
    sceCdInit(0);
    sceCdMmode(2);
    while (!sceSifRebootIop("cdrom0:\\MODULES\\IOPRP211.IMG;1")) {
    }
    while (!sceSifSyncIop()) {
    }
    sceSifInitRpc(0);
    sceCdInit(0);
    sceCdMmode(2);
    sceFsReset();
    while (sceSifLoadModule("cdrom0:\\MODULES\\SIO2MAN.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\PADMAN.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\MCMAN.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\MCSERV.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\LIBSD.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\SDRDRV.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\MODMIDI.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\MODHSYN.IRX;1", 0, 0) < 0) {
    }
    while (sceSifLoadModule("cdrom0:\\MODULES\\EZMIDI.IRX;1", 0, 0) < 0) {
    }
    InitCDFile();
    DevInit();
    sceDmaGetChan(1);
    sceDmaGetChan(2);
    sceDmaGetChan(8);
    MGInit();
    InitMemoryFile();
    BufferAllClear();
    InitReadBG();
}

/* The parallel lights the renderer starts with. The direction matrix is held transposed -- the
   overlays write light n's x, y and z into rows 0, 1 and 2 at column n -- so three equal rows are
   one light and the other two are off, while the colour matrix is the other way round with one
   light to a row. */
sceVu0FMATRIX light = {
    {0.578f, 0.0f, 0.0f, 0.0f},
    {0.578f, 0.0f, 0.0f, 0.0f},
    {0.578f, 0.0f, 0.0f, 0.0f},
    {0.0f, 0.0f, 0.0f, 0.0f},
};

sceVu0FMATRIX lightcolor = {
    {120.0f, 120.0f, 120.0f, 128.0f},
    {0.0f, 0.0f, 0.0f, 0.0f},
    {0.0f, 0.0f, 0.0f, 0.0f},
    {0.0f, 0.0f, 0.0f, 0.0f},
};

/* The light every surface gets no matter which way it faces. */
sceVu0FVECTOR ambientlight = {64.0f, 64.0f, 64.0f, 128.0f};

void SetEnv(sceVif1Packet *packet) {
    sceVif1PkCnt(packet, 0);
    sceVif1PkOpenDirectCode(packet, 0);
    sceVif1PkOpenGifTag(packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(packet, SCE_GS_TEX1_1, *(u_long *) &mgTEX1Env);
    sceVif1PkAddGsAD(packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkAddGsAD(packet, SCE_GS_ZBUF_1, *(u_long *) &mgZBuffer);
    sceVif1PkAddGsAD(packet, SCE_GS_ALPHA_1, *(u_long *) &mgAlpha);
    sceVif1PkAddGsAD(packet, SCE_GS_CLAMP_1, 5);
    sceVif1PkCloseGifTag(packet);
    sceVif1PkCloseDirectCode(packet);
}

void LoadSndTxt() {
    u_char work[48000];
    u_char *buffer = work;
    int offset = (int) buffer % 64;
    if (offset)
        buffer += 64 - offset;
    CSnd.LoadSeInf("sound/tbl/setbl.txt", (u_int *) buffer);
    CSnd.LoadSqInf("sound/tbl/sqtbl.txt", (u_int *) buffer);
    SndInitSeTable();
}

void PlayTimeCountFlag(int flag) {
    play_time_count = flag;
}

int PlayTimeCount(int) {
    if (play_time_count)
        SaveData->AddPlayTime(1);
}

void LoadSystemMessage() {
    int size;
    SystemMesBuffer.used = 0;
    SystemMesBuffer.Align64();
    SystemMes = (short *) &SystemMesBuffer.block[SystemMesBuffer.used];
    char name[64] = "meswin/system";
    if (LanguageCode > 0)
        sprintf(name, "meswin/system_%d", LanguageCode);
    strcat(name, ".mes");
    if (!LoadFile2(name, SystemMes, &size, 0))
        LoadFile("meswin/systeme.bin", SystemMes, &size);
    SystemMesBuffer.Alloc((size >> 4) + 1);
    InitSystemMes();
}

void initialize_data() {
    LoadSystemMessage();
    BtMapJumpFloor = -1;
    LoadSndTxt();
}
