#pragma once

#include "common.h"

class CCamera;
class CCameraFollow;
class CCharacter;
class CFrame;
class CSprite;
class CLogo;
class CCursol;
class CFrameVu1;
class CScFader;

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
 * @mangled DrawProcB__Fv
 * @address 0x1DCCD20
 * @size 0x4B0
 * @unknownret
 */
void DrawProcB(void);

/**
 * @mangled DrawProcC__Fv
 * @address 0x1DCDAE0
 * @size 0x37C
 * @unknownret
 */
void DrawProcC(void);

/**
 * @mangled DrawProcD__Fv
 * @address 0x1DCE480
 * @size 0x218
 * @unknownret
 */
void DrawProcD(void);

/**
 * @mangled DrawProcE__Fv
 * @address 0x1DCEBE0
 * @size 0x230
 * @unknownret
 */
void DrawProcE(void);

/**
 * @mangled DrawProcF__Fv
 * @address 0x1DCF4A0
 * @size 0x27C
 * @unknownret
 */
void DrawProcF(void);

/**
 * @mangled DrawProcG__Fv
 * @address 0x1DCFCF0
 * @size 0x200
 * @unknownret
 */
void DrawProcG(void);

/**
 * @mangled DrawProcH__Fv
 * @address 0x1DD08E0
 * @size 0x3BC
 * @unknownret
 */
void DrawProcH(void);

/**
 * @mangled DrawProcI__Fv
 * @address 0x1DD14C0
 * @size 0x29C
 * @unknownret
 */
void DrawProcI(void);

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

/**
 * Camera the title is drawn through.
 */
extern CCamera Camera;

/**
 * Following camera of the title.
 */
extern CCameraFollow FCamera;

/**
 * Cloud model of the title.
 */
extern CCharacter Cloud__2;

/**
 * Logo model of the title.
 */
extern CCharacter Logo;

/**
 * Spark models of the title.
 */
extern CCharacter Spark[];

/**
 * Frame of the third title object.
 */
extern CFrame *ObjectFrame3;

/**
 * Screen fader of the title.
 */
extern CScFader CFade;

/**
 * The step the title screen is on. The symbol is eight bytes; only the first word is ever
 * initialised and the second is never read or written anywhere in the overlay.
 */
class CProcess {
public:
    CProcess() { no = 0; }

    int no;
    int unk_04;
};

/**
 * Step the title screen is on.
 */
extern CProcess CProcess;

/**
 * Sprite drawer of the title.
 */
extern CSprite CSprite;

/**
 * Logo of the title.
 */
extern CLogo CLogo;

/**
 * Cursor of the title menu.
 */
extern CCursol CCursol;
