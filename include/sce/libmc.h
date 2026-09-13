#pragma once

#define MC_WAIT 0
#define MC_NOWAIT 1

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Initializes the memory-card library and returns its status.
 */
int sceMcInit(void);

/**
 * Polls or waits for the running memory-card command and returns its execution state.
 */
int sceMcSync(int mode, int *cmd, int *result);

/**
 * Opens the named file on the card in the given port and returns a command id.
 */
int sceMcOpen(int port, int slot, char *name, int flag);

/**
 * Closes the given file and returns a command id.
 */
int sceMcClose(int fd);

/**
 * Reads the given number of bytes of the given file and returns a command id.
 */
int sceMcRead(int fd, void *buffer, int size);

/**
 * Writes the given number of bytes to the given file and returns a command id.
 */
int sceMcWrite(int fd, void *buffer, int size);

/**
 * Writes the buffered data of the given file to the card and returns a command id.
 */
int sceMcFlush(int fd);

/**
 * Enters the named directory of the card, writes back the one it left, and returns a command id.
 */
int sceMcChdir(int port, int slot, char *name, char *current);

/**
 * Creates the named directory on the card and returns a command id.
 */
int sceMcMkdir(int port, int slot, char *name);

/**
 * Deletes the named file of the card and returns a command id.
 */
int sceMcDelete(int port, int slot, char *name);

/**
 * Reads up to the given number of directory entries into the given table and returns a command id.
 */
int sceMcGetDir(int port, int slot, char *name, unsigned int mode, int count, void *table);

/**
 * Asks for the type, the free space and the format flag of the card in the given port.
 */
int sceMcGetInfo(int port, int slot, int *type, int *free_size, int *formatted);

/**
 * Formats the card in the given port and returns a command id.
 */
int sceMcFormat(int port, int slot);

/**
 * Unformats the card in the given port and returns a command id.
 */
int sceMcUnformat(int port, int slot);

#ifdef __cplusplus
}
#endif
