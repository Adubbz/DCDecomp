#include "menu_misc.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "character.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "frame.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "menu_draw.hpp"
#include "menu_manual.hpp"
#include "shop_battlemenu.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "weapon_buildup.hpp"
#include "weaponeffect.hpp"

extern ClsMes CommonMenuMes2;
extern ClsMes CommonMenuMes3;
extern int EditMenuStatus[7];
extern CDataAlloc2<1> EdMenuBuffer;
extern CDataAlloc2<1> MenuExCashBuffer;
extern CCharacter MenuCharaFrame;
extern CCharacter DngWeaponFrm[12];
extern "C" CWeaponEffect CWeaponFx;

/**
 * Sets the buffer the menu reads weapon effect files into.
 *
 * @mangled SetWepEffectMenuReadBuf__FP1
 * @address 0x20D0A0
 * @size 0x10
 */
static void SetWepEffectMenuReadBuf(u_long128 *);

/**
 * Returns one entry of the menu's weapon model table.
 *
 * @mangled GetMenuWeaponModelData__Fi
 * @address 0x20D3B0
 * @size 0x20
 */
static int *GetMenuWeaponModelData(int);

/**
 * Clears the menu's weapon model table.
 *
 * @mangled InitMenuWeaponModelData__Fv
 * @address 0x20D3D0
 * @size 0x30
 */
static void InitMenuWeaponModelData();

/**
 * Returns the two-value reference entry for one weapon model.
 *
 * @mangled GetMenuWeaponModelInfo__Fi
 * @address 0x20D400
 * @size 0x20
 */
static int *GetMenuWeaponModelInfo(int);

/**
 * Returns the motion step a character's status bits select.
 *
 * @mangled GetNowMotionStepCnt__Fi
 * @address 0x20DE80
 * @size 0x40
 */
static int GetNowMotionStepCnt(int status);

/**
 * Writes the file path of one character's model into a buffer.
 *
 * @mangled GetCharaChangeReadCharaFilePath__FPci
 * @address 0x20E530
 * @size 0x80
 */
static void GetCharaChangeReadCharaFilePath(char *, int);

/**
 * Randomly adjusts one value of a weapon being changed into another.
 *
 * @mangled LocalWeaponDataChange__FPciii
 * @address 0x20FBE0
 * @size 0x100
 */
static void LocalWeaponDataChange(char *, int, int, int);

/**
 * Returns the number of edit menu icons, one fewer until the manual is available.
 *
 * @mangled GetEditMenuMax__Fv
 * @address 0x2102E0
 * @size 0x40
 */
static int GetEditMenuMax();

/**
 * Draws one edit menu icon at its resting position.
 *
 * @mangled DrawMenuIcon__Fi
 * @address 0x210320
 * @size 0xD0
 */
static void DrawMenuIcon(int);

/**
 * Writes the screen position of one edit menu icon.
 *
 * @mangled GetEditMenuIconPos__FiPi
 * @address 0x2103F0
 * @size 0x100
 */
static void GetEditMenuIconPos(int, int *);

/**
 * Draws the edit menu icons at their current positions.
 *
 * @mangled DrawMoveMenuIcon__Fv
 * @address 0x2104F0
 * @size 0x1C0
 */
static void DrawMoveMenuIcon();

/**
 * Moves the edit menu icons one step away from their resting positions and reports when they have arrived.
 *
 * @mangled CalMoveFromMenuIcon__Fv
 * @address 0x2106B0
 * @size 0x240
 */
static int CalMoveFromMenuIcon();

/**
 * Moves the edit menu icons one step back to their resting positions and reports when they have arrived.
 *
 * @mangled CalMoveToMenuIcon__Fv
 * @address 0x2108F0
 * @size 0x1C0
 */
static int CalMoveToMenuIcon();

/**
 * Releases the edit menu's textures and returns the pad to normal mode.
 *
 * @mangled EditMenuExit__Fv
 * @address 0x210DA0
 * @size 0x90
 */
static void EditMenuExit();

/**
 * Reports whether the edit menu draws its help window for a page.
 *
 * @mangled GetDrawHelpWindow__Fi
 * @address 0x210E30
 * @size 0x70
 */
static int GetDrawHelpWindow(int);

/**
 * Draws the edit menu's opening and enters its page textures once they have been read.
 *
 * @mangled EditMenuStart__Fv
 * @address 0x2112C0
 * @size 0x4C0
 */
static int EditMenuStart();

/**
 * Draws the edit menu's icon selection.
 *
 * @mangled EditMenuSelectDraw__Fv
 * @address 0x211780
 * @size 0x230
 */
static void EditMenuSelectDraw();

/**
 * Handles pad input in the edit menu's icon selection and returns the result.
 *
 * @mangled EditMenuSelect__Fv
 * @address 0x2119B0
 * @size 0x390
 */
static int EditMenuSelect();

/**
 * Draws the edit menu while it closes.
 *
 * @mangled EditMenuToExitDraw__Fv
 * @address 0x211D40
 * @size 0x20
 */
static void EditMenuToExitDraw();

/**
 * Runs the edit menu's closing and reports when it is finished.
 *
 * @mangled EditMenuToExit__Fv
 * @address 0x211D60
 * @size 0x150
 */
static int EditMenuToExit();

/**
 * Draws the Atla selection page.
 *
 * @mangled AtoraSelectDraw__Fv
 * @address 0x211EB0
 * @size 0x90
 */
static void AtoraSelectDraw();

/**
 * Runs the Atla selection page and returns the result.
 *
 * @mangled AtoraSelect__Fv
 * @address 0x211F40
 * @size 0x190
 */
static int AtoraSelect();

/**
 * Draws the Atla move state, which has nothing to draw.
 *
 * @mangled AtoraMoveDraw__Fv
 * @address 0x2120D0
 * @size 0x10
 */
static void AtoraMoveDraw();

/**
 * Leaves the edit menu for the Atla move and returns the result.
 *
 * @mangled AtoraMove__Fv
 * @address 0x2120E0
 * @size 0x30
 */
static int AtoraMove();

/**
 * Draws the background panels of the analysis page.
 *
 * @mangled AnalyzeBackDraw__Fii
 * @address 0x212110
 * @size 0x160
 */
static void AnalyzeBackDraw(int, int);

/**
 * Returns the analysis page's completion percentage, capped at 100.
 *
 * @mangled AnalyzeRequestPer__Fv
 * @address 0x212270
 * @size 0xB0
 */
static float AnalyzeRequestPer();

/**
 * Draws the analysis page's bars and reports whether the fill has reached its target.
 *
 * @mangled AnalyzeBarDraw__Fv
 * @address 0x212320
 * @size 0x6A0
 */
static int AnalyzeBarDraw();

/**
 * Draws the transition into the analysis page.
 *
 * @mangled ToAnalyzeEditDraw__Fv
 * @address 0x2129C0
 * @size 0x350
 */
static void ToAnalyzeEditDraw();

/**
 * Advances the transition into the analysis page.
 *
 * @mangled ToAnalyzeEdit__Fv
 * @address 0x212D10
 * @size 0x50
 */
static void ToAnalyzeEdit();

/**
 * Draws the analysis page.
 *
 * @mangled AnalyzeEditDraw__Fv
 * @address 0x212D60
 * @size 0x1C0
 */
static void AnalyzeEditDraw();

/**
 * Handles pad input on the analysis page and returns the result.
 *
 * @mangled AnalyzeEdit__Fv
 * @address 0x212F20
 * @size 0x60
 */
static int AnalyzeEdit();

/**
 * Draws the transition out of the analysis page.
 *
 * @mangled FromAnalyzeEditDraw__Fv
 * @address 0x212F80
 * @size 0x50
 */
static void FromAnalyzeEditDraw();

/**
 * Advances the transition out of the analysis page.
 *
 * @mangled FromAnalyzeEdit__Fv
 * @address 0x212FD0
 * @size 0xB0
 */
static void FromAnalyzeEdit();

/**
 * Draws the edit menu's save page.
 *
 * @mangled EditSaveDraw__Fv
 * @address 0x213080
 * @size 0x80
 */
static void EditSaveDraw();

/**
 * Handles pad input on the edit menu's save page.
 *
 * @mangled EditSaveKey__Fv
 * @address 0x213100
 * @size 0xE0
 */
static void EditSaveKey();

/**
 * Draws the edit menu's option page.
 *
 * @mangled OptionDraw__Fv
 * @address 0x2131E0
 * @size 0x70
 */
static void OptionDraw();

/**
 * Handles pad input on the edit menu's option page.
 *
 * @mangled EdOptionSelect__Fv
 * @address 0x213250
 * @size 0x100
 */
static void EdOptionSelect();

/**
 * Handles pad input on the edit menu's manual page.
 *
 * @mangled EdMenuManualKey__Fv
 * @address 0x213350
 * @size 0x100
 */
static int EdMenuManualKey();

/**
 * Draws the edit menu's manual page.
 *
 * @mangled EdMenuManualDraw__Fv
 * @address 0x213450
 * @size 0x70
 */
static void EdMenuManualDraw();

INCLUDE_ASM("asm/nonmatchings/menu_misc", NowGetGameFlagForBtlMenu__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuHebikiriFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EquipDefaultWeapon__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMenuNothing__FiiiiPcii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuItemUseVolume__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @869);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @870__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @871__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowWeaponRate__FP11WEAPON_HAVE);

int WeaponStatusBreakEnable(WEAPON_HAVE *weapon) {
    int enable;

    if (weapon == NULL) {
        return 0;
    }
    enable = 0;
    if (weapon->unk_02 >= 5) {
        enable = 1;
    }
    return enable;
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStatusBuildUp__FP11WEAPON_HAVERi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @914__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @915__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetMenuCharaEffectReadFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuCharaEffectReadFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetDngWepEffectPointer__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetWepEffectMenuReadBuf__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetOldEffectKind__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetWepEffectMenuReadBuf__FP1);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngWepEffectReadStart__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @936__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @947__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @948);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @949);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @950);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @951);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @952);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @956);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @957);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @958__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @959__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @960__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @961);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuWeaponEffectSet__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowTestNo__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartReadWepMDS__FP1i);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @969__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @970__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @985__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @986__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @987);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @988);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @989);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @990__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @992__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @993__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @994);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @995);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @996__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @997);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1002);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelData__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitMenuWeaponModelData__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitMenuWeaponModelReference__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetMenuWeaponModelReference__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelFrameNo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EnterWeaponModel__Fiii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1032);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1033);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1034__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1035__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1036__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1037__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1038__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1039__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1040__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponModelBuildFunc__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1104);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1105);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1106);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1107);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1108);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1109);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1110);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1111);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngWeaponEquipModelBuild__FiiP1);

static int GetNowMotionStepCnt(int status) {
    int step = 0;
    if (status & 0x40) {
        step = 1;
    }
    if ((status & 4) || (status & 2)) {
        step = 2;
    }
    return step;
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowActiveCharaStatus__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetNowCharaMotionNo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetItemMenuColor__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetItemMenuOldAmbient__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartLoadCharaMDS__FP1ii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1176);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1177);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1178);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuCharaMDSBuild2__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1199__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1200);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetCharaChangeReadCharaFilePath__FPci);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL__FP1i);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", MenuWepDir);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1205);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1206);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1207__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1208);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1209);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1210);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1236);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL2__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1242);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1243);
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoadChara__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1250);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1251);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1254);
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoad2__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EastKingCheckComplete__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetMonsterNameDrawFlag__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMonsterNameDrawFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameInit__FP6ClsMesPsPUc);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1287__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameMake__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNamePosSet__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgInit__FP6ClsMesP6ClsMesi);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1341);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CheckItemThrow__FPiPi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetWeaponElementStatus__FP11WEAPON_HAVE);

int CheckWeaponOptionStatus(int options) {
    // Each pair of opposed options cancels out when both are set.
    if ((options & 2) && (options & 4)) {
        options &= ~6;
    }
    if ((options & 8) && (options & 0x10)) {
        options &= ~0x18;
    }
    if ((options & 0x100) && (options & 0x200)) {
        options &= ~0x300;
    }
    if ((options & 0x400) && (options & 0x800)) {
        options &= ~0xC00;
    }
    return options;
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", IsWeaponOptionGoodOrBad__Fi);

int DefaultWeaponOptionSet(int weapon_no) {
    WEAPON_DATA *data = GetWeaponData(weapon_no);
    if (data == NULL) {
        return 1;
    }
    return data->flags;
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponOptionStatusDraw__FP11WEAPON_HAVEiii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1507);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStarDraw__FiiP11WEAPON_HAVEi);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1536);
INCLUDE_ASM("asm/nonmatchings/menu_misc", LocalWeaponDataChange__FPciii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1549__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1616__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1617__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1618__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1619__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1620__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1621__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1622__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1623__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1624__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1625__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponDataChangeByRGate__FP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNumHowManyItemsHave__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetEditMenuMax__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMenuIcon__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetEditMenuIconPos__FiPi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMoveMenuIcon__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CalMoveFromMenuIcon__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CalMoveToMenuIcon__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuInit__FPii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @464__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @465__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuExit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetDrawHelpWindow__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuDraw__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @573__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuStart__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @583);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @584__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @585__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @586__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @587__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @588__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @589__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @590__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @650__5);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuSelect__Fv);

static void EditMenuToExitDraw() {
    DrawMoveMenuIcon();
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", EditMenuToExit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AtoraSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AtoraSelect__Fv);

static void AtoraMoveDraw() {}

INCLUDE_ASM("asm/nonmatchings/menu_misc", AtoraMove__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeBackDraw__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeRequestPer__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeBarDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", ToAnalyzeEditDraw__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @894__3);
INCLUDE_ASM("asm/nonmatchings/menu_misc", ToAnalyzeEdit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeEditDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", AnalyzeEdit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", FromAnalyzeEditDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", FromAnalyzeEdit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditSaveDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EditSaveKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", OptionDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EdOptionSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EdMenuManualKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", EdMenuManualDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitSaveFileInfoTbl__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetOpenAttribute__FPc);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @346__2);
