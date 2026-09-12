#pragma once

#include "common.h"

#include "dataalloc_fwd.hpp"

class CFrameVu1;
struct sceVif1Packet;

/**
 * Stores the location and extent of one file in DATA.DAT.
 */
struct DATA_HEADER {
    int name;    /**< Offset of the file name in the header image. */
    int offset;  /**< Byte offset recorded for the file. */
    int size;    /**< File size in bytes. */
    int sector;  /**< Starting sector relative to DATA.DAT. */
    int sectors; /**< Number of sectors occupied by the file. */
};

/**
 * Tracks one asynchronous background file read.
 */
struct BG_READ_INFO {
    int busy;          /**< Whether the queue slot is allocated. */
    int id;            /**< CD/DVD request identifier. */
    int done;          /**< Whether the request has completed. */
    char name[128];    /**< File name used for error reporting. */
    u_long128 *buffer; /**< Destination buffer. */
    int size;          /**< File size in bytes. */
    int sector;        /**< Absolute starting sector. */
    int sectors;       /**< Number of sectors to read. */
};

/**
 * @file
 * Declares the calls that read a file off the disc, and the ones that reach
 * into a pack file once it has been read.
 */

/**
 * Steps the background read, and says whether one is still going.
 *
 * @mangled ReadBGSync__Fv
 * @address 0x13EE30
 * @size 0x88
 */
int ReadBGSync(void);

/**
 * Initializes the background-read queue.
 */
void InitReadBG(void);

/**
 * Queues a file for background reading.
 */
int LoadFileBG(char *name, u_long128 *buffer, int *out_size);

/**
 * Returns an allocated background-read queue slot.
 *
 * @mangled GetReadBGFile__Fi
 * @address 0x13EC60
 * @size 0x58
 */
BG_READ_INFO *GetReadBGFile(int index);

/**
 * Starts the background-read system.
 */
void StartReadBG(void);

/**
 * Advances the active background read by one vertical sync.
 */
void ReadBG(void);

/**
 * Cancels the active CD/DVD read and resets the background queue.
 */
void BreakReadBG(void);

/**
 * Initializes the DATA.DAT file index from disc.
 */
void InitCDFile(void);

/**
 * Initializes memory-backed file access.
 */
void InitMemoryFile(void);

/**
 * Reads a whole file off the disc.
 *
 * @mangled LoadFile__FPcPvPi
 * @address 0x13F360
 * @size 0x6C
 */
int LoadFile(char *path, void *buffer, int *out_size);

/**
 * Reads a file using the requested loading mode.
 */
int LoadFile2(char *path, void *buffer, int *out_size, int mode);

/**
 * Writes a buffer to a file.
 */
int WriteFile(char *path, void *buffer, int size);

/**
 * Loads a pack and makes it the current implicit pack.
 */
int LoadPackFile(char *path, u_int *buffer, int *out_size);

/**
 * Finds a file in the current implicit pack.
 *
 * @mangled GetPackFile__FPcPi
 * @address 0x13F6F0
 * @size 0x30
 */
u_int *GetPackFile(char *name, int *out_size);

/**
 * Finds a file inside a pack that has already been read.
 *
 * @mangled GetPackFile__FPUiPcPi
 * @address 0x13F720
 * @size 0xD8
 */
u_int *GetPackFile(u_int *pack, char *name, int *out_size);

/**
 * Finds a file by ordinal position in a pack.
 */
u_int *GetPackFile(u_int *pack, int index, char **out_name, int *out_size);

/**
 * Collects files with a requested extension from a pack.
 */
int GetPackFileExt(u_int *pack, char *extension, u_int **files, int max_files, int *sizes,
                   char **names);

/** Shared buffer used for synchronous game-data reads. */
extern u_int *read_buffer;

/**
 * Turns a model towards one heading, a step at a time, and gives back the
 * heading it stands on now.
 *
 * @mangled unitRotation__FP9CFrameVu1f
 * @address 0x140810
 * @size 0x28C
 */
float unitRotation(CFrameVu1 *frame, float heading);

/**
 * Loads the overlay required by a top-level game mode.
 *
 * @mangled LoadOverlay__Fi
 * @address 0x140AA0
 * @size 0xE4
 */
void LoadOverlay(int mode);

/**
 * Initializes the IOP services and core rendering and file systems.
 *
 * @mangled init_all__Fv
 * @address 0x140B90
 * @size 0x210
 */
void init_all(void);

/**
 * Writes the persistent GS state into the current VIF packet.
 *
 * @mangled SetEnv__FP13sceVif1Packet
 * @address 0x140DA0
 * @size 0xE4
 */
void SetEnv(sceVif1Packet *packet);

/**
 * Loads the sound-effect and sequence metadata tables.
 *
 * @mangled LoadSndTxt__Fv
 * @address 0x140E90
 * @size 0x90
 */
void LoadSndTxt(void);

/**
 * Enables or disables accumulation of save-file play time.
 *
 * @mangled PlayTimeCountFlag__Fi
 * @address 0x140F20
 * @size 0xC
 */
void PlayTimeCountFlag(int flag);

/**
 * Adds one vertical-sync interval to the save-file play time when enabled.
 *
 * @mangled PlayTimeCount__Fi
 * @address 0x140F30
 * @size 0x34
 */
int PlayTimeCount(int unused);

/**
 * Loads and initializes the system message catalogue for the active language.
 *
 * @mangled LoadSystemMessage__Fv
 * @address 0x140F70
 * @size 0x108
 */
void LoadSystemMessage(void);

/**
 * Loads the global message and sound metadata used by game modes.
 *
 * @mangled initialize_data__Fv
 * @address 0x141080
 * @size 0x30
 */
void initialize_data(void);

/**
 * Resets the shared read buffers the loaders hand out.
 *
 * @mangled InitializeDataBuffer__Fv
 * @address 0x125990
 * @size 0xF4
 */
void InitializeDataBuffer(void);

/**
 * Finds one named record inside a loaded PTS archive.
 *
 * @mangled SearchPTS__FPUiPc
 * @address 0x13E4E0
 * @size 0xD8
 * @unknownret
 */
unsigned int *SearchPTS(unsigned int *archive, char *name);

/**
 * Gives one arena to the loader as its working buffer.
 *
 * @mangled SetDataBuffer__FP14CDataAlloc2_1_i
 * @address 0x125A90
 * @size 0x4C
 */
void SetDataBuffer(CDataAlloc2<1> *arena, int kind);

/**
 * Sets where packet reads land, and how much room they have.
 *
 * @mangled SetPacketReadBuffer__Fii
 * @address 0x125AE0
 * @size 0xD8
 */
void SetPacketReadBuffer(int address, int size);

/**
 * Reports whether a background read is still running.
 *
 * @mangled check_now_loading__Fv
 * @address 0x153F40
 * @size 0xC
 * @unknownret
 */
int check_now_loading(void);

/** Allocator that dungeon monsters take their collision polygons from. */
extern "C" CDataAlloc2<1> *WorkBuffer__2;
