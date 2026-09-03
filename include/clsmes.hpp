#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCharacter;
class CRect_i_;
class CTexture;
struct sceVif1Packet;

/**
 * One pass of the outline a message window's text draws behind itself.
 */
struct MES_FUCHI {
    s32 x;     /**< How far right of the text this pass draws. */
    s32 y;     /**< How far below the text this pass draws. */
    s32 r;     /**< Red the pass draws with. */
    s32 g;     /**< Green the pass draws with. */
    s32 b;     /**< Blue the pass draws with. */
    s32 alpha; /**< Alpha the pass draws with; zero or less ends the table. */
};

STATIC_ASSERT(sizeof(MES_FUCHI) == 0x18);

/**
 * One laid-out line of a message window.
 */
struct MES_WIN_LINE {
    s16 code; /**< The laid-out character, or the control code it stands for. */
    s16 x;    /**< Distance of the character from the left of the window. */
    s16 y;    /**< Distance of the character from the top of the window. */
    u8 clut;  /**< Palette entry the character draws with. */
    u8 space; /**< Extra width the character takes, for a justified line. */
};

STATIC_ASSERT(sizeof(MES_WIN_LINE) == 0x8);

/** Lines one message window can lay out. */
#define MES_WIN_LINE_MAX 700

/**
 * Where one line of a message window draws, for the windows that place their
 * lines themselves rather than laying them out in a block.
 */
struct MES_LINE_POS {
    s32 x; /**< Distance of the line from the left of the screen; -1 where it is not set. */
    s32 y; /**< Distance of the line from the top of the screen; -1 where it is not set. */
};

class ClsMes {
public:
    s32 text_x;       /**< Distance of the text from the left of the screen. */
    s32 text_y;       /**< Distance of the text from the top of the screen. */
    s32 char_width;   /**< How wide one character of the font draws. */
    s32 char_height;  /**< How tall one character of the font draws. */
    s32 columns;      /**< Characters one line of the window holds. */
    s32 rows;         /**< Lines the window holds. */
    s32 text_columns; /**< Characters the widest line of the text takes. */
    s32 text_rows;    /**< Lines the text takes. */
    s32 text_len;     /**< Characters the window has laid out to draw. */
    s32 text_width;   /**< How wide the laid-out text is, in pixels. */
    s32 text_height;  /**< How tall the laid-out text is, in pixels. */
    s32 unk_02C;
    s32 unk_030;
    s32 fukidashi;                           /**< Whether the window draws as a speech bubble, not a frame. */
    s32 fukidashi_shape;                     /**< Which shape the bubble takes, as the text asks for. */
    s32 grow_x;                              /**< Point the window grows out of and shrinks back into, from the left. */
    s32 grow_y;                              /**< Point the window grows out of and shrinks back into, from the top. */
    s32 win_x;                               /**< Distance of the window from the left of the screen. */
    s32 win_y;                               /**< Distance of the window from the top of the screen. */
    s32 win_width;                           /**< How wide the window draws. */
    s32 win_height;                          /**< How tall the window draws. */
    s32 auto_pos;                            /**< Forces which of nine positions the window takes; zero picks the best. */
    s32 tail_on;                             /**< Whether the window draws a tail pointing at its speaker. */
    s32 tail_to_x;                           /**< Where the tail points, from the left of the screen. */
    s32 tail_to_y;                           /**< Where the tail points, from the top of the screen. */
    s32 tail_x;                              /**< Where the tail leaves the window, from the left. */
    s32 tail_y;                              /**< Where the tail leaves the window, from the top. */
    s32 tail_half_width;                     /**< Half the width of the tail where it meets the window. */
    s32 tail_length;                         /**< How far the tail reaches towards what it points at. */
    s32 tail_left_x;                         /**< Left corner of the tail's base, worked out by Step. */
    s32 tail_left_y;                         /**< Left corner of the tail's base, worked out by Step. */
    s32 tail_right_x;                        /**< Right corner of the tail's base, worked out by Step. */
    s32 tail_right_y;                        /**< Right corner of the tail's base, worked out by Step. */
    s32 tail_tip_x;                          /**< Point of the tail, worked out by Step. */
    s32 tail_tip_y;                          /**< Point of the tail, worked out by Step. */
    float fade_speed;                        /**< How much of the fade one step covers. */
    float fade;                              /**< How far the window has faded in, from zero to one. */
    s32 fade_in;                             /**< Whether the window is fading in rather than out. */
    s32 stay_frame;                          /**< Whether the window draws a plain frame behind its text. */
    s32 stay_width;                          /**< Width that frame takes; zero or less follows the text. */
    s32 stay_height;                         /**< Height that frame takes; zero or less follows the text. */
    float text_rate;                         /**< Characters the text reveals each step, now. */
    float text_rate_set;                     /**< Characters the text reveals each step, as configured. */
    s32 waiting;                             /**< Whether the text has stopped on a wait code. */
    s32 auto_page;                           /**< Whether the window turns its own pages. */
    float text_at;                           /**< How far through the laid-out characters the text has revealed. */
    s32 text_no;                             /**< The laid-out character the text has revealed up to. */
    s32 text_from;                           /**< The laid-out character the text starts drawing at. */
    s32 page_from;                           /**< The laid-out character the next page begins at. */
    MES_WIN_LINE win_line[MES_WIN_LINE_MAX]; /**< Every line the window lays out. */
    s32 win_line_num;                        /**< Lines the window has laid out. */
    s32 clut_default;                        /**< Palette entry the text draws with unless a code changes it. */
    s32 clut_now;                            /**< Palette entry the text draws with now. */
    s32 wait;                                /**< Steps left before the text reveals its next character. */
    s32 blink;                               /**< Steps the window has drawn for, which drives what flashes. */
    s32 auto_page_wait;                      /**< Steps the window holds a full page before turning it by itself. */
    s32 mes_made;                            /**< The message the window has laid out; negative where it has none. */
    s32 style;                               /**< Which of the window's frames and colours to draw. */
    s32 page_arrow;                          /**< Whether the window draws the mark that says more text follows. */
    s32 end_mark;                            /**< Whether the window always draws that mark, wherever the text is. */
    s32 centre_rows;                         /**< Whether the text sits in the middle of the window's rows. */
    s32 unk_16D0;
    s32 edge_alpha;            /**< How solid the outline behind the text draws. */
    s32 narrow_gaiji_set;      /**< Forces the narrow gaiji page on (2) or off (1); 0 by width. */
    s32 narrow_gaiji;          /**< Whether the editor's external characters draw narrowed. */
    s32 mes_no[10];            /**< The message each of the window's slots names. */
    s32 values[8];             /**< The number each of the window's value slots prints. */
    s32 value;                 /**< The number the window prints for a bare value code. */
    s32 value_signed;          /**< Whether a positive value prints with a leading plus. */
    s32 value_show;            /**< Whether a value prints even when it is zero. */
    s32 value_narrow;          /**< Whether a value's digits draw at three quarters width. */
    s32 space_width;           /**< Width one space takes on a justified line; -1 where it is not. */
    s32 space_area;            /**< Width a justified line spreads across; -1 where it is not. */
    s32 cursor_row;            /**< Line the choice cursor stands on; negative where there is none. */
    s32 cursor_y;              /**< Where the cursor has eased to, from the top of the text. */
    s32 cursor_lit;            /**< Whether the line the cursor stands on is the one drawn wide. */
    s32 tex_block;             /**< Texture block the window's font is loaded into. */
    MES_LINE_POS line_pos[10]; /**< Where each line draws, where the window says so. */
    short *buff;               /**< The message file the window reads its text out of. */
    short *buff_system;        /**< The same, for the system messages. */
    char *text;                /**< Where the text of that file starts. */
    char *text_system;         /**< The same, for the system messages. */
    void *unk_17B0;
    u32 *clut; /**< The palette the window's font draws out of. */
    /**
     * Gives back how wide one external character of the font draws, in pixels.
     *
     * @mangled GetGaijiW__6ClsMesFi
     * @address 0x14CB30
     * @size 0xA0
     */
    s16 GetGaijiW(int code);

    /**
     * Gives back how many characters one character's registered name has, or
     * -1 where there is no such name.
     *
     * @mangled GetNameLen__6ClsMesFi
     * @address 0x14CBD0
     * @size 0x90
     */
    int GetNameLen(int chara);

    /**
     * Adds up how wide a character's registered name draws, in pixels.
     *
     * @mangled GetNameWidth__6ClsMesFi
     * @address 0x14CC60
     * @size 0x120
     */
    int GetNameWidth(int chara);

    /**
     * Reads where two characters stand on screen, so that AutoSet can place
     * the window clear of both of them.
     *
     * @mangled AutoSetSub__6ClsMesFP10CCharacterP10CCharacterPi
     * @address 0x14CFE0
     * @size 0x50
     */
    void AutoSetSub(CCharacter *first, CCharacter *second, int *out_pos);

    /**
     * Puts the window at whichever of nine screen positions lies furthest
     * from the two points @p pos names, and works out where its tail leaves
     * it.
     *
     * @mangled AutoSet__6ClsMesFPi
     * @address 0x14D030
     * @size 0x630
     */
    void AutoSet(int *pos);

    /**
     * Pulls the window back inside the screen's margins, and moves its text
     * along with it.
     *
     * @mangled AbsFukidashiIn__6ClsMesFv
     * @address 0x14D660
     * @size 0x160
     */
    void AbsFukidashiIn(void);

    /**
     * Starts a window with nothing to say and every setting at its default.
     *
     * @mangled __ct__6ClsMesFv
     * @address 0x14D7C0
     * @size 0x240
     */
    ClsMes(void);

    /**
     * Gives the window the message file it reads its text out of.
     *
     * @mangled SetBuff__6ClsMesFPs
     * @address 0x14DA00
     * @size 0x30
     */
    void SetBuff(short *buff);

    /**
     * The same, for the file the system messages come out of.
     *
     * @mangled SetBuff_system__6ClsMesFPs
     * @address 0x14DA30
     * @size 0x30
     */
    void SetBuff_system(short *buff);

    /**
     * Sets the frame, colours and text speed that one of the window's styles
     * asks for.
     *
     * @mangled Preset__6ClsMesFi
     * @address 0x14DA60
     * @size 0x150
     */
    void Preset(int style);

    /**
     * Sets the font size, frame and colours that one of the speech-bubble
     * styles asks for.
     *
     * @mangled SetMesFukidashi__6ClsMesFi
     * @address 0x14DBB0
     * @size 0x1E0
     */
    void SetMesFukidashi(int style);

    /**
     * Carries the window's fade on by one step, and works out where its tail
     * stands now.
     *
     * @mangled Step__6ClsMesFv
     * @address 0x14DD90
     * @size 0x2F0
     */
    void Step(void);

    /**
     * Gives back what the window is doing: closed, fading in or out, revealing
     * its text, stopped on a page, or done.
     *
     * @mangled State__6ClsMesFv
     * @address 0x14E080
     * @size 0xB0
     */
    int State(void);

    /**
     * Forgets which characters of the text the window has already drawn.
     *
     * @mangled MyTextureMake_InitAll__6ClsMesFv
     * @address 0x14E130
     * @size 0x40
     */
    void MyTextureMake_InitAll(void);

    /**
     * Carries the window on to the page that follows the one it stopped at.
     *
     * @mangled GoNextPage__6ClsMesFv
     * @address 0x14E170
     * @size 0x50
     */
    void GoNextPage(void);

    /**
     * Steps the window's text on by one laid-out character and gives back
     * what the caller has to do about it.
     *
     * @mangled MyTextureMake_sub__6ClsMesFv
     * @address 0x14E1C0
     * @size 0x1C0
     */
    int MyTextureMake_sub(void);

    /**
     * Reveals as much of the text as this step's rate allows.
     *
     * @mangled MyTextureMake__6ClsMesFv
     * @address 0x14E380
     * @size 0x200
     */
    void MyTextureMake(void);

    /**
     * Lays out the number that a bare value code prints, and moves the pen
     * past it.
     *
     * @mangled MakeMesWinTbl_value__6ClsMesFPiPi
     * @address 0x14E700
     * @size 0x230
     */
    void MakeMesWinTbl_value(int *x, int *y);

    /**
     * The same, for the number one of the window's value slots holds.
     *
     * @mangled MakeMesWinTbl_value__6ClsMesFiPiPi
     * @address 0x14E930
     * @size 0x240
     */
    void MakeMesWinTbl_value(int which, int *x, int *y);

    /**
     * Lays out the system message that a code names, and gives back whether
     * there was one to lay out.
     *
     * @mangled MakeMesWinTbl_system__6ClsMesFiPiPi
     * @address 0x14EB70
     * @size 0x480
     */
    int MakeMesWinTbl_system(int code, int *x, int *y);

    /**
     * Gives back how many characters the longest line of one system message
     * has, or -1 where there is no such message.
     *
     * @mangled GetMesLen_system__6ClsMesFi
     * @address 0x14EFF0
     * @size 0x330
     */
    int GetMesLen_system(int mes_no);

    /**
     * Gives back how wide the widest line of one system message draws.
     *
     * @mangled GetMesWidth_system__6ClsMesFi
     * @address 0x14F320
     * @size 0x190
     */
    int GetMesWidth_system(int mes_no);

    /**
     * Gives back where one message of the window's file starts.
     *
     * @mangled GetTextLineDataTop__6ClsMesFi
     * @address 0x14F4B0
     * @size 0x70
     */
    short *GetTextLineDataTop(int line);

    /**
     * The same, for the system messages.
     *
     * @mangled GetTextLineDataTop_system__6ClsMesFi
     * @address 0x14F520
     * @size 0x70
     */
    short *GetTextLineDataTop_system(int line);

    /**
     * Empties the window's line table so that a message can be laid out into
     * it.
     *
     * @mangled InitMesWinTbl__6ClsMesFv
     * @address 0x14F590
     * @size 0x50
     */
    void InitMesWinTbl(void);

    /**
     * Enters one laid-out character into the window's line table, or applies
     * the control code it stands for; gives back whether a line was entered.
     *
     * @mangled SetMesWinTbl__6ClsMesFiiss
     * @address 0x14F5E0
     * @size 0x1A0
     */
    int SetMesWinTbl(int code, int mode, short x, short y);

    /**
     * Works out how wide each space of one justified line has to draw.
     *
     * @mangled CalcSpaceW__6ClsMesFiiPs
     * @address 0x14F780
     * @size 0x150
     */
    int CalcSpaceW(int width, int glyph_width, short *text);

    /**
     * Lays one message out into the window's line table, and gives back
     * whether it ran as far as a page break.
     *
     * @mangled MakeMesWinTbl__6ClsMesFi
     * @address 0x14F8D0
     * @size 0x430
     */
    int MakeMesWinTbl(int mes_no);

    /**
     * Works out the characters, lines, width and height that a message needs,
     * and writes the largest of each into the four slots of @p out.
     *
     * @mangled NeedMesWinWH__6ClsMesFiPi
     * @address 0x14FD60
     * @size 0x6B0
     */
    void NeedMesWinWH(int mes_no, int *out);

    /**
     * Opens the window on one message: lays the text out, sizes the frame
     * around it and places it on screen.
     *
     * @mangled MakeMesWin__6ClsMesFi
     * @address 0x150550
     * @size 0x100
     */
    int MakeMesWin(int mes_no);

    /**
     * Lays one message out and works out the frame it needs, unless the
     * window already holds that message.
     *
     * @mangled MakeMesTexture__6ClsMesFi
     * @address 0x150650
     * @size 0x1C0
     */
    void MakeMesTexture(int mes_no);

    /**
     * Draws the outline that stands behind one character of the text.
     *
     * @mangled Myset2DSprite_Fuchi__6ClsMesFP13sceVif1PacketP8CTextureiiiiiiii
     * @address 0x150810
     * @size 0x3A0
     */
    void Myset2DSprite_Fuchi(sceVif1Packet *packet, CTexture *texture, int x, int y, int width,
                             int height, int u, int v, int u_width, int v_height);

    /**
     * Writes the points that the speech bubble's outline is drawn from into
     * the packet.
     *
     * @mangled MakeFukidashi_sub__6ClsMesFP13sceVif1Packeti
     * @address 0x150F50
     * @size 0xB80
     */
    void MakeFukidashi_sub(sceVif1Packet *packet, int prim);

    /**
     * Draws the speech bubble into the texture that the text is laid over.
     *
     * @mangled MakeFukidashi__6ClsMesFP13sceVif1Packet
     * @address 0x151AD0
     * @size 0x540
     */
    void MakeFukidashi(sceVif1Packet *packet);

    /**
     * Draws the window's frame once, offset by @p dx and @p dy; @p frame asks
     * for the nine-slice frame rather than one plain sprite.
     *
     * @mangled DrawMesWin_sub__6ClsMesFP8CTextureiii
     * @address 0x152030
     * @size 0x900
     */
    void DrawMesWin_sub(CTexture *texture, int dx, int dy, int frame);

    /**
     * Draws one external character of the text at the colour its palette
     * entry asks for.
     *
     * @mangled DrawGaijiFont__6ClsMesFP8CTextureiRC8CRect_i_RC8CRect_i_ii
     * @address 0x152EE0
     * @size 0x308
     */
    void DrawGaijiFont(CTexture *texture, int no, const CRect_i_ &texel,
                       const CRect_i_ &screen, int wide, int dark);

    /**
     * Draws the window: its frame, the text revealed so far, and the marks
     * that go alongside them.
     *
     * @mangled DrawMesWin__6ClsMesFv
     * @address 0x153310
     * @size 0xC30
     */
    void DrawMesWin(void);
};

STATIC_ASSERT(sizeof(ClsMes) == 0x17B8);

/** The message window the menus share. */
extern ClsMes CommonMenuMes1;
