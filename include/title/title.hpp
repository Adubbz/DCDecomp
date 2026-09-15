#pragma once

#include "common.h"

/**
 *          Initializes title cinematic scene A.
 *
 * @mangled InitProcA__Fv
 * @address 0x1DCB560
 * @size 0x82C
 * @unknownret
 */
void InitProcA(void);

/**
 *          Draws title cinematic scene A.
 *
 * @mangled DrawProcA__Fv
 * @address 0x1DCBD90
 * @size 0x7D4
 * @unknownret
 */
void DrawProcA(void);

/**
 * @mangled InitProcB__Fv
 * @address 0x1DCC570
 * @size 0x7B0
 * @unknownret
 */
void InitProcB(void);

/**
 * @mangled DrawProcB__Fv
 * @address 0x1DCCD20
 * @size 0x4B0
 * @unknownret
 */
void DrawProcB(void);

/**
 * @mangled AtraLight__Fv
 * @address 0x1DCD1D0
 * @size 0x28C
 * @unknownret
 */
void AtraLight(void);

/**
 * @mangled InitProcC__Fv
 * @address 0x1DCD460
 * @size 0x67C
 * @unknownret
 */
void InitProcC(void);

/**
 * @mangled DrawProcC__Fv
 * @address 0x1DCDAE0
 * @size 0x37C
 * @unknownret
 */
void DrawProcC(void);

/**
 * @mangled InitProcD__Fv
 * @address 0x1DCDE60
 * @size 0x614
 * @unknownret
 */
void InitProcD(void);

/**
 * @mangled DrawProcD__Fv
 * @address 0x1DCE480
 * @size 0x218
 * @unknownret
 */
void DrawProcD(void);

/**
 * @mangled InitProcE__Fv
 * @address 0x1DCE6A0
 * @size 0x538
 * @unknownret
 */
void InitProcE(void);

/**
 * @mangled DrawProcE__Fv
 * @address 0x1DCEBE0
 * @size 0x230
 * @unknownret
 */
void DrawProcE(void);

/**
 * @mangled InitProcF__Fv
 * @address 0x1DCEE10
 * @size 0x690
 * @unknownret
 */
void InitProcF(void);

/**
 * @mangled DrawProcF__Fv
 * @address 0x1DCF4A0
 * @size 0x27C
 * @unknownret
 */
void DrawProcF(void);

/**
 * @mangled InitProcG__Fv
 * @address 0x1DCF720
 * @size 0x5D0
 * @unknownret
 */
void InitProcG(void);

/**
 * @mangled DrawProcG__Fv
 * @address 0x1DCFCF0
 * @size 0x200
 * @unknownret
 */
void DrawProcG(void);

/**
 * @mangled InitProcH__Fv
 * @address 0x1DCFEF0
 * @size 0x9E8
 * @unknownret
 */
void InitProcH(void);

/**
 * @mangled DrawProcH__Fv
 * @address 0x1DD08E0
 * @size 0x3BC
 * @unknownret
 */
void DrawProcH(void);

/**
 * @mangled InitProcI__Fv
 * @address 0x1DD0CA0
 * @size 0x814
 * @unknownret
 */
void InitProcI(void);

/**
 * @mangled DrawProcI__Fv
 * @address 0x1DD14C0
 * @size 0x29C
 * @unknownret
 */
void DrawProcI(void);

/**
 * @mangled InitProcTitle__Fv
 * @address 0x1DD1760
 * @size 0x9C
 * @unknownret
 */
void InitProcTitle(void);

/**
 * @mangled DrawProcTitle__Fv
 * @address 0x1DD1800
 * @size 0x2A4
 * @unknownret
 */
void DrawProcTitle(void);

/**
 * @mangled TitleInit__Fi
 * @address 0x1DD1AB0
 * @size 0x76C
 * @unknownret
 */
void TitleInit(int);

/**
 * @mangled TitleLoop__Fv
 * @address 0x1DD2220
 * @size 0x9E4
 * @unknownret
 */
int TitleLoop(void);

/**
 *          Draws the active title cinematic or title-screen scene.
 *
 * @mangled TitleDraw__Fv
 * @address 0x1DD2C10
 * @size 0x11EC
 * @unknownret
 */
void TitleDraw(void);
