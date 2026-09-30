#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 234

#include "common.h"
#include "sce/libcdvd.h"
#include "sce/sifdev.h"
#include "sce/sifrpc.h"

#include <cassert>
#include <cstdio>
#include <cstring>

#include "btsysscript.hpp"
#include "cloth.hpp"
#include "clothread.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dataset.hpp"
#include "framevu1.hpp"
#include "gameutil.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "sysmes.hpp"

/* One record of the archive's index file. The four numbers a read needs sit behind twelve bytes
   the index does not use, and the first word is where the entry's name begins in the same file. */
struct DATA_HEADER_READ {
    int name; /**< Offset of the file name in the index image. */
    int unk_04[3];
    int offset;  /**< Byte offset recorded for the file. */
    int size;    /**< File size in bytes. */
    int sector;  /**< Starting sector relative to DATA.DAT. */
    int sectors; /**< Number of sectors occupied by the file. */
};

/* One file inside a pack. The name is the entry's own first bytes, everything it locates is a byte
   offset from the entry rather than from the pack, and a first byte of zero ends the table — so a
   pack can be walked without being told how many files it holds. */
struct PACK_ENTRY {
    char name[64]; /**< Null-terminated file name; empty ends the table. */
    int  offset;   /**< Byte offset of the file data from this entry. */
    int  size;     /**< File size in bytes. */
    int  next;     /**< Byte offset of the next entry from this entry. */
};

/* The index is turned into a tree of path components rather than a list of names, so a lookup
   costs one search per component instead of one comparison per entry. A directory carries no
   entry of its own and leaves the header null. */
struct NAME_TREE {
    char        *name;  /**< Path component this node matches. */
    DATA_HEADER *data;  /**< File located by the path ending here, or null for a directory. */
    NAME_TREE   *child; /**< First node one component deeper. */
    NAME_TREE   *next;  /**< Next node under the same parent. */
};

static char CurrentDir[256] = "y:/ps2/dc_data/";

static int    header_num;
static u_int *packfile_buff;
#ifndef PAL
static NAME_TREE *tree;
#endif
static int data_sector;
static int old_vsync;
static int start_vsync;

#ifdef PAL
static u_char header_buff[0x50000];
#else
static u_char header_buff[0x40000];
#endif
static BG_READ_INFO bg_read_info[32];

static NAME_TREE *search_tree(NAME_TREE *node, char *name);
static int        CDRead(char *path, u_int *buffer, int *out_size);

#ifndef PAL
static void copy_data_head(DATA_HEADER *dest, DATA_HEADER_READ *record) {
    dest->name = record->name;
    dest->offset = record->offset;
    dest->size = record->size;
    dest->sector = record->sector;
    dest->sectors = record->sectors;
}
#endif

#ifdef PAL
/* The index is searched as the list it is on the disc, one name comparison per entry. */
static DATA_HEADER *SearchFile(char *path) {
    DATA_HEADER_READ *record;
    int               i;

    record = (DATA_HEADER_READ *) header_buff;

    for (i = 0; i < header_num; i++, record++) {
        if (strcasecmp((char *) record->name, path) == 0) {
            return (DATA_HEADER *) record;
        }
    }

    return 0;
}
#else
static DATA_HEADER *SearchFile(char *path) {
    NAME_TREE *node;
    char      *word_end;
    char       ch;
    char       word[256];

    word_end = word;
    node = tree;

    while ((ch = *path) != 0) {
        if (ch == '/') {
            *word_end = 0;
            node = search_tree(node, word);

            if (!node) {
                return 0;
            }

            path++;
            word_end = word;
        } else {
            *word_end = ch;
            path++;
            word_end++;
        }
    }

    *word_end = 0;
    node = search_tree(node, word);

    if (!node) {
        return 0;
    }

    return node->data;
}
#endif

void InitReadBG() {
    int i;

    for (i = 0; i < 32; i++) {
        bg_read_info[i].busy = 0;
    }

    old_vsync = -1;
    start_vsync = 0;
}

/* The buffer goes to the drive rather than through the processor, so an address the drive cannot
   reach is fatal rather than slow, and one that is not on a 64-byte boundary is only reported. */
int LoadFileBG(char *name, u_long128 *buffer, int *out_size) {
    BG_READ_INFO *info;
#ifdef PAL
    DATA_HEADER_READ *header;
#else
    DATA_HEADER *header;
#endif
    int i;

    if (out_size) {
        *out_size = 0;
    }

    if (!name) {
        return 0;
    }

    if (*name == 0) {
        return 0;
    }

    info = bg_read_info;

    for (i = 0; i < 32; i++, info++) {
        if (info->busy == 0) {
            break;
        }
    }

    if (i == 32) {
        return 0;
    }

    if ((int) buffer > 0x2000000) {
        printf("address error\n");

        for (;;)
            ;
    }

    if ((int) buffer % 64) {
        printf("/*/*/*/*/not 64byte align at %x %s\n", buffer, name);
    }

#ifdef PAL
    header = (DATA_HEADER_READ *) SearchFile(name);

#else
    header = SearchFile(name);

#endif
    if (!header) {
        return 0;
    }

    strcpy(info->name, name);
    info->busy = 1;
    info->id = 0;
    info->done = 0;
    info->buffer = buffer;
    info->size = header->size;

    if (out_size) {
        *out_size = header->size;
    }

    info->sector = header->sector + data_sector;
    info->sectors = header->sectors;
    return 1;
}

BG_READ_INFO *GetReadBGFile(int index) {
    if (index < 0 || index >= 32) {
        return 0;
    }

    return bg_read_info[index].busy ? &bg_read_info[index] : 0;
}

void StartReadBG() {
    InitReadBG();
}

/* One read is issued per vertical sync and the same call collects it, so a queued file costs two
   frames at best and the queue is walked from the front every time. */
void ReadBG() {
    BG_READ_INFO *info;
    sceCdRMode    mode;
    int           vsync;
    int           i;

    vsync = MGGetVSyncCount();

    if (old_vsync == vsync) {
        return;
    }

    old_vsync = vsync;
    start_vsync++;
    mode.trycount = 0;
    mode.spindlctrl = 1;
    mode.datapattern = 0;
    info = bg_read_info;

    for (i = 0; i < 32; i++, info++) {
        if (info->busy) {
            if (info->id != 0 && info->done == 0) {
                break;
            }

            if (info->id == 0 && info->done == 0) {
                break;
            }
        }
    }

    if (i == 32) {
        return;
    }

    if (info->id == 0) {
        start_vsync = 0;
        info->id = sceCdRead(info->sector, info->sectors, info->buffer, &mode);
    } else if (info->id != 0) {
        if (sceCdSync(1)) {
            return;
        }

        if (sceCdGetError()) {
            printf("error at %s\n", info->name);
            info->id = 0;
            return;
        }

        info->done = 1;
    }
}

int ReadBGSync() {
    int           i;
    BG_READ_INFO *info;

    ReadBG();
    info = bg_read_info;

    for (i = 0; i < 32; i++, info++) {
        if (info->busy) {
            if (info->id == 0) {
                break;
            }

            if (info->done == 0) {
                break;
            }
        }
    }

    if (i == 32) {
        return 0;
    }

    return 1;
}

void BreakReadBG() {
    sceCdBreak();
    InitReadBG();
}

/* A component is looked for in the whole subtree rather than among the node's own children, so a
   path whose middle components are spelled wrong still finds its entry. */
#ifndef PAL
static NAME_TREE *search_tree(NAME_TREE *node, char *name) {
    NAME_TREE *found;

    if (strcasecmp(node->name, name) == 0) {
        return node;
    }

    node = node->child;

    while (node) {
        found = search_tree(node, name);

        if (found) {
            return found;
        }

        node = node->next;
    }

    return 0;
}
#endif

#ifndef PAL
static void add_tree(NAME_TREE *parent, NAME_TREE *child_node) {
    NAME_TREE *sibling;

    sibling = parent->child;

    if (sibling == 0) {
        parent->child = child_node;
        return;
    }

    for (;;) {
        if (sibling->next == 0) {
            sibling->next = child_node;
            return;
        }

        sibling = sibling->next;
    }
}
#endif

/* The whole tree is built inside the one buffer it is handed: the nodes and their headers grow up
   from the bottom and the names down from the top, so nothing is ever freed and the two meeting is
   what the size report at the end is for. */
#ifndef PAL
static char *create_word_tree(char *index_image, int size, char *tree_buffer) {
    DATA_HEADER_READ *record;
    NAME_TREE        *parent;
    char             *bottom;
    char             *top;
    int               i;
    char             *cursor;
    NAME_TREE        *node;
    char             *path;
    char             *word_end;
    char              ch;
    char              word[256];

    bottom = tree_buffer;
    top = tree_buffer + size - 1;
    tree = (NAME_TREE *) tree_buffer;
    tree->next = 0;
    tree->child = 0;
    tree->data = 0;
    tree->name = tree_buffer + 16;
    tree_buffer[16] = 0;
    bottom += 32;
    header_num = *(u_int *) index_image >> 5;

    for (i = 0; i < header_num; i++) {
        record = (DATA_HEADER_READ *) (index_image + i * 32);
        path = (char *) (record->name + (int) index_image);
        cursor = path;

        while ((ch = *cursor) != 0) {
            if (ch == '\\') {
                *cursor = '/';
            }

            cursor++;
        }

        cursor = path;
        word_end = word;
        parent = tree;

        for (;;) {
            ch = *cursor;

            if (ch == '/' || ch == 0) {
                *word_end = 0;

                if (word[0] == 0) {
                    break;
                }

                node = search_tree(parent, word);

                if (!node) {
                    node = (NAME_TREE *) bottom;
                    memset(bottom, 0, 16);
                    bottom += 16;
                    top -= strlen(word) + 1;
                    strcpy(top, word);
                    node->name = top;
                    add_tree(parent, node);
                }

                parent = node;
                word_end = word;

                if (*cursor == 0) {
                    node->data = (DATA_HEADER *) bottom;
                    copy_data_head(node->data, record);
                    bottom += 20;
                    break;
                }

                cursor++;
            } else {
                *word_end = ch;
                cursor++;
                word_end++;
            }
        }
    }

    printf("file header size = %d\n", size - (top - bottom));
    return tree_buffer;
}
#endif

/* The drive is asked for the data file itself only to learn where it starts; everything after this
   is read by sector from that base, which is why no path but the index's is ever opened. */
#ifdef PAL
/* The index is read straight into the header buffer and kept as it is, with each entry's name
   offset turned into a pointer to the name and its path separators made forward slashes. */
void InitCDFile() {
    sceCdlFILE        file;
    int               fd;
    int               size;
    DATA_HEADER_READ *records;
    int               i;

    packfile_buff = 0;

    while (1) {
        if (sceCdSearchFile(&file, "\\DATA.DAT;1")) {
            sceCdSync(0);

            if (sceCdGetError() == 0) {
                break;
            }
        }
    }

    data_sector = file.lsn;
    fd = sceOpen("cdrom0:\\DATA.HD2;1", SCE_RDONLY);

    if (fd < 0) {
        printf("File open error \"\"\n \n \n");
        __assert("etc.cpp", 565, "FALSE");
    }

    size = sceLseek(fd, 0, SCE_SEEK_END);
    sceLseek(fd, 0, SCE_SEEK_SET);
    sceRead(fd, header_buff, size);
    sceClose(fd);
    records = (DATA_HEADER_READ *) header_buff;
    // The names follow the last record, so the first name's offset counts the records.
    header_num = (u_int) records->name >> 5;

    for (i = 0; i < header_num; i++) {
        char *cursor;
        char  ch;

        records[i].name += (int) header_buff;

        for (cursor = (char *) records[i].name; (ch = *cursor) != 0; cursor++) {
            if (ch == '\\') {
                *cursor = '/';
            }
        }
    }
}
#else
void InitCDFile() {
    char       index_image[307200];
    sceCdlFILE file;
    int        fd;
    int        size;

    packfile_buff = 0;

    while (1) {
        if (sceCdSearchFile(&file, "\\DATA.DAT;1")) {
            sceCdSync(0);

            if (sceCdGetError() == 0) {
                break;
            }
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
    sceRead(fd, index_image, size);
    sceClose(fd);
    create_word_tree(index_image, sizeof header_buff, (char *) header_buff);
}
#endif

void InitMemoryFile() {
}

int LoadFile(char *path, void *buffer, int *out_size) {
    if (!LoadFile2(path, buffer, out_size, 0)) {
        printf("File open error \"%s\"\n \n \n", path);
#ifdef PAL
        __assert("etc.cpp", 753, "FALSE");
#else
        __assert("etc.cpp", 740, "FALSE");
#endif
    }

    return 1;
}

/* A name may carry a device in front of a colon, which is dropped: everything the game ships with
   is on the disc, and the development tree the other devices reached is what CurrentDir names. */
int LoadFile2(char *path, void *buffer, int *out_size, int mode) {
    char *cursor;
    char *device_end;
    char *file_name;
    char  ch;
    int   host_file;
    char  device[256];

    if (out_size) {
        *out_size = 0;
    }

    /* The two devices the development build could read through instead of the disc. Nothing left
       here reads either one; they are what the test below was written against. */
    char sim[16] = "sim:";
    char host[16] = "host:";

    cursor = path;
    device_end = device;

    while ((ch = *cursor) != 0) {
        if (ch == ':') {
            break;
        }

        *device_end = ch;
        device_end++;
        cursor++;
    }

    if (ch) {
        file_name = cursor + 1;
    } else {
        file_name = path;
    }

    /* Reading through the host machine is what the development tree was for, and the retail build
       keeps the question and does nothing with the answer. */
    if (memcmp(device, "host", 4) != 0 && memcmp(CurrentDir, "host:", 4) == 0) {
        host_file = 1;
    }

    if ((int) buffer > 0x2000000) {
        printf("address error\n");

        for (;;)
            ;
    }

    char full_path[256] = "";

    strcat(full_path, file_name);
    return CDRead(full_path, (u_int *) buffer, out_size);
}

static int CDRead(char *path, u_int *buffer, int *out_size) {
#ifdef PAL
    DATA_HEADER_READ *header;
#else
    DATA_HEADER *header;
#endif
    sceCdRMode mode;

#ifdef PAL
    header = (DATA_HEADER_READ *) SearchFile(path);

#else
    header = SearchFile(path);

#endif
    if (!header) {
        return 0;
    }

    mode.trycount = 0;
    mode.spindlctrl = 1;
    mode.datapattern = 0;

    while (1) {
        if (sceCdRead(header->sector + data_sector, header->sectors, buffer, &mode)) {
            sceCdSync(0);

            if (sceCdGetError() == 0) {
                break;
            }
        }
    }

    if (out_size) {
        *out_size = header->size;
    }

    return 1;
}

int WriteFile(char *path, void *buffer, int size) {
    int fd;

    fd = sceOpen(path, SCE_WRONLY | SCE_CREAT | SCE_TRUNC);

    if (fd < 0) {
        return 0;
    }

    sceWrite(fd, buffer, size);
    sceClose(fd);
    return 1;
}

int LoadPackFile(char *path, u_int *buffer, int *out_size) {
    packfile_buff = buffer;

    if (!LoadFile2(path, buffer, out_size, 0)) {
        packfile_buff = 0;
        return 0;
    }

    return 1;
}

u_int *GetPackFile(char *name, int *out_size) {
    return GetPackFile(packfile_buff, name, out_size);
}

/* A pack is looked up by the last component of a path, so a caller may name a file the way the
   archive spells it and still find it inside the pack it was loaded from. */
u_int *GetPackFile(u_int *pack, char *name, int *out_size) {
    char       *base_name;
    PACK_ENTRY *entry;
    u_int      *data;
    char        ch;

    if (!pack) {
        return 0;
    }

    base_name = name;

    while ((ch = *name) != 0) {
        if (ch == '/') {
            base_name = name + 1;
        }

        name++;
    }

    entry = (PACK_ENTRY *) pack;

    while (entry->name[0]) {
        if (strcasecmp(entry->name, base_name) == 0) {
            data = (u_int *) ((char *) entry + entry->offset);

            if (out_size) {
                *out_size = entry->size;
            }

            return data;
        }

        entry = (PACK_ENTRY *) ((char *) entry + entry->next);
    }

    return 0;
}

u_int *GetPackFile(u_int *pack, int index, char **out_name, int *out_size) {
    PACK_ENTRY *entry;
    u_int      *data;
    int         i;

    if (!pack) {
        return 0;
    }

    entry = (PACK_ENTRY *) pack;
    i = 0;

    while (entry->name[0]) {
        if (index == i) {
            data = (u_int *) ((char *) entry + entry->offset);

            if (out_size) {
                *out_size = entry->size;
            }

            *out_name = entry->name;
            return data;
        }

        entry = (PACK_ENTRY *) ((char *) entry + entry->next);
        i++;
    }

    return 0;
}

/* Every file of one extension at once, which is how a pack of animations or textures is taken
   whole. The caller says how many it has room for and gets back how many it was given. */
int GetPackFileExt(u_int *pack, char *extension, u_int **files, int max_files, int *sizes, char **names) {
    int    found_count;
    int    i;
    u_int *data;
    char  *ext_start;
    char   ch;
    int    size;
    char  *name;

    found_count = 0;
    i = 0;

    for (;;) {
        data = GetPackFile(pack, i, &name, &size);

        if (!data) {
            break;
        }

        ext_start = name;

        while ((ch = *ext_start) != 0) {
            if (ch == '.') {
                ext_start++;
                break;
            }

            ext_start++;
        }

        if (strcasecmp(extension, ext_start) == 0) {
            files[found_count] = data;

            if (names) {
                names[found_count] = name;
            }

            if (sizes) {
                sizes[found_count] = size;
            }

            found_count++;

            if (found_count >= max_files) {
                break;
            }
        }

        i++;
    }

    return found_count;
}
