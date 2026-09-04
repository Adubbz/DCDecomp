#pragma once

#include "common.h"

/**
 * Finalizes the East King event's asynchronously loaded texture and sound data.
 *
 * @mangled EastKingTextureEnter__Fv
 * @address 0x00232830
 * @size 0x430
 */
void EastKingTextureEnter();

/**
 * Draws the current East King event message.
 *
 * @mangled EastKingMsgDraw__Fv
 * @address 0x00232C60
 * @size 0x1A0
 */
void EastKingMsgDraw();

/**
 * Restores the background-music volume saved before the East King event.
 *
 * @mangled GetPrevEastKingSndVol__Fv
 * @address 0x00232E00
 * @size 0x24
 */
void GetPrevEastKingSndVol();

/**
 * Initializes one East King event and begins loading its resources.
 *
 * @mangled InitEastKingEvent__FiPiP1
 * @address 0x00232E30
 * @size 0x1A8
 */
void InitEastKingEvent(int event_no, int *result, void *load_buffer);

/**
 * Processes input and state transitions for the East King event.
 *
 * @mangled EastKingEventKey__Fv
 * @address 0x00232FE0
 * @size 0x354
 */
int EastKingEventKey();

/**
 * Draws the East King event image, message, and fade overlay.
 *
 * @mangled EastKingEventDraw__Fv
 * @address 0x00233340
 * @size 0x1E0
 */
void EastKingEventDraw();
