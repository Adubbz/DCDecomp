#pragma once

#include "common.h"

class ClsMes;

/**
 *          Carries a mutable text buffer and the parser's current position.
 */
struct input_str {
    input_str() : size(0), pos(0) {}
    input_str(int) {}

    int get(int *value)
    {
        *value = (u_char)data[pos];
        pos++;
        if (size < pos) return 0;
        return 1;
    }

    char *data; /**< Text being parsed. */
    int size;   /**< Number of bytes available in the text. */
    int pos;    /**< Current byte position in the text. */
};

STATIC_ASSERT(sizeof(input_str) == 0xC);

/**
 * Message window used for transient system notifications.
 */
extern ClsMes SystemMessage;
/**
 * Aligned storage containing the system-message file.
 */
extern short mes_data[24000];
/**
 * Work buffer used while laying out a system message.
 */
extern char mes_buff[65536];
/**
 * Message number currently displayed, or -1 when none is active.
 */
extern int SystemMesNo;
/**
 * Screen-position preset used by the active message.
 */
extern int SystemMesPosition;
/**
 * Display frames remaining for the active message.
 */
extern int SystemMesCount;
/**
 * Frames before the active message begins stepping.
 */
extern int SystemMesWait;
/**
 * Whether the active message waits for confirm input.
 */
extern int SystemMesInputKey;

/**
 * Initializes the system-message window and loads its message file.
 */
void InitSystemMes(void);
/**
 * Clears the active system message.
 */
void ClearSystemMes(void);
/**
 * Reports whether a system message still has display time remaining.
 */
int SystemMesCheck(void);
/**
 * Advances the active system message and its input wait.
 */
void SystemMesStep(void);
/**
 * Draws the active system message.
 */
void SystemMesDraw(void);
/**
 * Shows the message for an acquired item.
 */
void ItemGetMes(int item, int value, int count, int input_key);
/**
 * Shows the message for an acquired Atlamillia component.
 */
void AtraGetMes(int map, int no, int count);
/**
 * Shows the message for an acquired technique.
 */
void TecGetMes(int technique, int count);
/**
 * Shows a maximum-stat increase message.
 */
void MaxUpMes(int value, int count);
/**
 * Shows the message for one defeated party member.
 */
void DeadMes(int member, int count);
/**
 * Shows the message for the defeated party.
 */
void AllDeadMes(int count);
/**
 * Shows why a party member cannot collect an Atlamillia component.
 */
void NotGetAtraMes(int member, int count);
/**
 * Shows why an item cannot be collected.
 */
void DontGetItemMes(int kind);
/**
 * Configures and opens one system message.
 */
void SetSystemMes(int no, int count, int position, int input_key, int *args, int *numbers);

/**
 * Loads the matrix and translation used by cell transforms into VU0 registers.
 */
void pretest(float matrix[4][4], float *translation);
/**
 * Transforms one cell and advances its source position by the loaded translation.
 */
void Trans_AddCell(float *output, float *position);
