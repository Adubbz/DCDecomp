#pragma once

#include "common.h"

#include "itemdata.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
class CCamera;
class CFrame;
class CRect_i_;
class CTexture;
class CUserStatus;
class CDngStatusData;
class ClsMes;
struct IHAVEITEM;
struct ITEM_PACK;
struct SAVEDATA_INFO;
struct WEAPON_HAVE;
struct spRGBA;

/**
 * State of the dungeon entrance menu, and what it shows of each floor.
 */
struct DUN_ENTER_MENU {
    s8 dungeon;         /**< Dungeon the menu is for. */
    s8 scroll_top;      /**< First floor the list shows. */
    s8 selected_floor;  /**< Floor the cursor stands on. */
    s8 requested_floor; /**< Floor the player asked to enter. */
    float unk_004;
    float unk_008;
    s8 unk_00C;
    s8 texture_block; /**< Texture block the menu loads into. */
    s8 unk_00E;
    s8 floor_count;         /**< Floors the list holds. */
    s8 result;              /**< Floor chosen, or a negative value while the menu runs. */
    s8 max_atra[100];       /**< Atla each floor holds. */
    s8 collected_atra[100]; /**< Atla the player has taken from each floor. */
    u8 unk_0D9;
    s16 kills[100]; /**< Monsters the player has defeated on each floor. */
    u8 unk_1A2[2];
    s16 state; /**< Step of the menu's state machine. */
    u8 unk_1A6[2];
    s32 counter; /**< Frames spent in the current step. */
};

STATIC_ASSERT(sizeof(DUN_ENTER_MENU) == 0x1AC);

/**
 * State of a personal inventory board, the item list that the item, shop and Atla menus share.
 */
struct PERSONAL_BOARD {
    s32 unk_00;
    s32 unk_04;
    s32 unk_08;
    s32 unk_0C;
    float unk_10;
    float scroll; /**< Scroll bar position the board draws. */
    s32 unk_18;
    s16 unk_1C;
    u8 unk_1E[2];
    s32 unk_20;
    ITEM_PACK *item_pack; /**< Item pack the board lists. */
    s32 unk_28;
    s32 unk_2C;
    u8 unk_30[0x14];
    WEAPON_HAVE weapon; /**< Weapon record the board holds. */
    u8 unk_13C[0x20];
    s32 unk_15C;
};

/** The dungeon entrance menu. */
extern DUN_ENTER_MENU DEnterMenu;

/** Dungeon progress the entrance menu shows. */
extern CDngStatusData *DEnterStatusPt;

/** Frames a menu error message has shown for. */
extern int MenuEtcErrCnt;

/** Path buffer the menu file loaders build a language directory and file name in. */
extern char MenuGrobalDir[64];

/**
 * Checks the memory card before a save and picks the save menu's next step.
 *
 * @mangled SaveMenuKeySaveCheck__Fv
 * @address 0x221730
 * @size 0x170
 */
int SaveMenuKeySaveCheck(void);

/**
 * Handles the save menu's prompt to confirm a save.
 *
 * @mangled SaveMenuKeySaveDecide__Fv
 * @address 0x2218A0
 * @size 0xE0
 */
int SaveMenuKeySaveDecide(void);

/**
 * Steps the save menu while the game is written to the memory card.
 *
 * @mangled SaveMenuKeySave__Fv
 * @address 0x221980
 * @size 0x130
 */
int SaveMenuKeySave(void);

/**
 * Waits for a button press once a save has finished.
 *
 * @mangled SaveMenuKeyEndSave__Fv
 * @address 0x221AB0
 * @size 0x80
 */
int SaveMenuKeyEndSave(void);

/**
 * Handles the save menu's prompt to confirm a load.
 *
 * @mangled SaveMenuKeyLoadDecide__Fv
 * @address 0x221B30
 * @size 0x100
 */
int SaveMenuKeyLoadDecide(void);

/**
 * Steps the save menu while a save is read from the memory card.
 *
 * @mangled SaveMenuKeyLoad__Fv
 * @address 0x221C30
 * @size 0xE0
 */
int SaveMenuKeyLoad(void);

/**
 * Waits for a button press while the save menu shows an alert.
 *
 * @mangled SaveMenuKeyArart__Fv
 * @address 0x221D10
 * @size 0x130
 */
int SaveMenuKeyArart(void);

/**
 * Handles the save menu's prompt to create new save data.
 *
 * @mangled SaveMenuKeyNewDirSelect__Fv
 * @address 0x221E40
 * @size 0xD0
 */
int SaveMenuKeyNewDirSelect(void);

/**
 * Steps the save menu while new save data is created on the memory card.
 *
 * @mangled SaveMenuKeyNewDir__Fv
 * @address 0x221F10
 * @size 0x110
 */
int SaveMenuKeyNewDir(void);

/**
 * Handles the save menu's memory card format step.
 *
 * @mangled SaveMenuKeyFormat__Fv
 * @address 0x222020
 * @size 0x150
 */
int SaveMenuKeyFormat(void);

/**
 * Steps the save menu when the memory card is not formatted.
 *
 * @mangled SaveMenuKeyUnFormat__Fv
 * @address 0x222170
 * @size 0x80
 */
int SaveMenuKeyUnFormat(void);

/**
 * Waits for a button press when the save data is of a different version.
 *
 * @mangled SaveMenuKeyDifVersion__Fv
 * @address 0x2221F0
 * @size 0x60
 */
int SaveMenuKeyDifVersion(void);

/**
 * Steps the delete choice of the save menu.
 *
 * @mangled SaveMenuKeyDelete__Fv
 * @address 0x222250
 * @size 0x10
 */
s32 SaveMenuKeyDelete(void);

/**
 * Steps the copy choice of the save menu.
 *
 * @mangled SaveMenuKeyCopy__Fv
 * @address 0x222260
 * @size 0x10
 */
s32 SaveMenuKeyCopy(void);

/**
 * Handles key input on the save menu offered after the ending.
 *
 * @mangled SaveMenuKeyAfterEnding__Fv
 * @address 0x222270
 * @size 0x80
 */
int SaveMenuKeyAfterEnding(void);

/**
 * Handles the prompt to confirm a save after the ending.
 *
 * @mangled SaveMenuKeySaveDecideEnding__Fv
 * @address 0x2222F0
 * @size 0x80
 */
int SaveMenuKeySaveDecideEnding(void);

/**
 * Steps the save menu while saving after the ending.
 *
 * @mangled SaveMenuKeySaveEnding__Fv
 * @address 0x222370
 * @size 0x40
 */
int SaveMenuKeySaveEnding(void);

/**
 * Waits for a button press once the save after the ending has finished.
 *
 * @mangled SaveMenuKeyEndSaveEnding__Fv
 * @address 0x2223B0
 * @size 0x60
 */
int SaveMenuKeyEndSaveEnding(void);

/**
 * Returns the message number the save menu shows for its current step.
 *
 * @mangled GetSaveMenuMsgNo__Fv
 * @address 0x222410
 * @size 0x230
 */
int GetSaveMenuMsgNo(void);

/**
 * Loads the save menu's textures, messages and memory card icon.
 *
 * @mangled SaveMenuTextureEnter__Fv
 * @address 0x222640
 * @size 0x2D0
 */
int SaveMenuTextureEnter(void);

/**
 * Tells whether the save menu's fade-out is running.
 *
 * @mangled SaveMenuEffectFadeOut__Fv
 * @address 0x222910
 * @size 0x30
 */
int SaveMenuEffectFadeOut(void);

/**
 * Computes the save board's alpha ramp at a position and at that position
 * offset by the second argument.
 *
 * @mangled GetSaveBoardAlphaInfo__FiiRiRii
 * @address 0x222940
 * @size 0x160
 */
void GetSaveBoardAlphaInfo(int x, int width, int &start_alpha, int &end_alpha, int alpha);

/**
 * Draws the board of one save slot with its save data summary.
 *
 * @mangled DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii
 * @address 0x222AA0
 * @size 0x9C0
 */
void DrawSaveBoard(SAVEDATA_INFO *, CTexture **, int, int, int, int);

/**
 * Draws the board of a save slot that holds no save data.
 *
 * @mangled DrawNewFileTemplete__Fiii
 * @address 0x223460
 * @size 0x4E0
 */
void DrawNewFileTemplete(int, int, int);

/**
 * Starts memory card access and checks the card for existing save data.
 *
 * @mangled InitExistData__Fv
 * @address 0x223940
 * @size 0x180
 */
int InitExistData(void);

/**
 * Checks whether the memory card can take a save.
 *
 * @mangled SaveEnableCheck__Fv
 * @address 0x223AC0
 * @size 0x1A0
 */
int SaveEnableCheck(void);

/**
 * Opens the event item selection menu.
 *
 * @mangled InitEventItemSelect__FiPiP9ITEM_PACKiiii
 * @address 0x223C60
 * @size 0x480
 */
void InitEventItemSelect(int, int *, ITEM_PACK *, int, int, int, int);

/**
 * Frees the event item selection menu's textures and releases the pad.
 *
 * @mangled EventItemSelectExit__Fv
 * @address 0x2240E0
 * @size 0x60
 */
void EventItemSelectExit(void);

/**
 * Runs one frame of the event item selection menu, and returns its result.
 *
 * @mangled EventItemSelectLoop__FPi
 * @address 0x224140
 * @size 0x120
 */
int EventItemSelectLoop(int *);

/**
 * Handles pad input for the event item selection menu.
 *
 * @mangled EventItemSelectKey__FPi
 * @address 0x224260
 * @size 0x6B0
 */
int EventItemSelectKey(int *);

/**
 * Draws one vertical section of the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii
 * @address 0x224910
 * @size 0x150
 */
void DrawEventAndFishMenuBoard_Ver(CTexture *, CRect_i_, int, int, int, int);

/**
 * Draws the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard__FP8CTextureiiii
 * @address 0x224A60
 * @size 0x2F0
 */
void DrawEventAndFishMenuBoard(CTexture *, int, int, int, int);

/**
 * Draws the event item selection menu.
 *
 * @mangled EventItemSelectDraw__Fv
 * @address 0x224D50
 * @size 0x6D0
 */
void EventItemSelectDraw(void);

/**
 * Draws a section of the event item board, clipped to a range.
 *
 * @mangled DrawEventItemBoard__FiiiiiP8CTexture
 * @address 0x225420
 * @size 0x110
 */
void DrawEventItemBoard(int, int, int, int, int, CTexture *);

/**
 * Tells whether the player holds an item, in the dungeon inventory or in storage.
 *
 * @mangled PlayerAllItemCheck__Fi
 * @address 0x225530
 * @size 0xA0
 */
int PlayerAllItemCheck(int item);

/**
 * Tells whether an item identifier is an additive attachment.
 *
 * @mangled GetAddAttachItem__Fi
 * @address 0x2255D0
 * @size 0x30
 */
s32 GetAddAttachItem(int);

/**
 * Converts a weapon item identifier into its position in the owner's weapon chain.
 *
 * @mangled TransWepNo__Fi
 * @address 0x225600
 * @size 0xE0
 */
int TransWepNo(int weapon_no);

/**
 * Converts a position in an owner's weapon chain back into the weapon's item identifier.
 *
 * @mangled TransWepNoNewToOld__Fi
 * @address 0x2256E0
 * @size 0x130
 */
int TransWepNoNewToOld(int weapon_no);

/**
 * Adds one attachment's values into another, scaled by a factor.
 *
 * @mangled PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf
 * @address 0x225810
 * @size 0x160
 */
void PlusAttachmentVolume(ATTACH_LIST *, ATTACH_LIST *, float);

/**
 * Returns how much a weapon's attachments raise one of its values.
 *
 * @mangled GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
 * @address 0x225970
 * @size 0x130
 */
int GetWeaponAttachStatusUp(WEAPON_HAVE *, int);

/**
 * Takes one hit off the weapon the player holds and gives back what broke:
 * 0 for nothing, 1 for the weapon, 2 for the one it fell back to.
 *
 * @mangled BattleSubWeaponDmg__Ffi
 * @address 0x1B5D90
 * @size 0x570
 */
int BattleSubWeaponDmg(float amount, int kind);

/**
 * Recomputes a held weapon's values from its attachments.
 *
 * @mangled SetWeaponAttachStatus__FP11WEAPON_HAVE
 * @address 0x225AA0
 * @size 0xC0
 */
void SetWeaponAttachStatus(WEAPON_HAVE *);

/**
 * Applies a weapon's attachments to its stats and writes the result into a
 * second weapon record.
 *
 * @mangled WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
 * @address 0x225B60
 * @size 0x3F0
 */
void WeaponAllValueSet(WEAPON_HAVE *, WEAPON_HAVE *, int);

/**
 * Fills an attachment record from the attachment data table.
 *
 * @mangled SetAttachMentValue__FiisP11ATTACH_LIST
 * @address 0x225F50
 * @size 0x160
 */
int SetAttachMentValue(int, int, short, ATTACH_LIST *);

/**
 * Returns the stat value an attachment adds, for its message line.
 *
 * @mangled GetAttachVolumeForMsg__FP11ATTACH_LIST
 * @address 0x2260B0
 * @size 0x60
 */
int GetAttachVolumeForMsg(ATTACH_LIST *);

/**
 * Opens the dungeon entrance menu for a dungeon and floor.
 *
 * @mangled InitDunEnterMenu__Fiii
 * @address 0x226110
 * @size 0x410
 */
int InitDunEnterMenu(int texture_block, int dungeon, int requested_floor);

/**
 * Restores the pad and textures when the dungeon entrance menu closes.
 *
 * @mangled ExitDunEnterMenu__Fv
 * @address 0x226520
 * @size 0x70
 */
void ExitDunEnterMenu(void);

/**
 * Runs one frame of the dungeon entrance menu, and returns its result once it closes.
 *
 * @mangled DunEnterMenuLoop__Fv
 * @address 0x226590
 * @size 0x90
 */
int DunEnterMenuLoop(void);

/**
 * Handles key input on the dungeon entrance menu.
 *
 * @mangled DunEnterMenuKey__Fv
 * @address 0x226620
 * @size 0x6F0
 */
int DunEnterMenuKey(void);

/**
 * Draws the dungeon entrance menu.
 *
 * @mangled DunEnterDraw__Fv
 * @address 0x226D10
 * @size 0x540
 */
void DunEnterDraw(void);

/**
 * Draws the frame of the dungeon entrance board.
 *
 * @mangled DunEnterBoardWaku__Fiii
 * @address 0x227250
 * @size 0x4B0
 */
void DunEnterBoardWaku(int, int, int);

/**
 * Draws the dungeon entry board.
 *
 * @mangled DunEnterBoard__Fiii
 * @address 0x227700
 * @size 0x7C0
 */
void DunEnterBoard(int, int, int);

/**
 * Draws a number right to left, one digit at a time, clipped to the board.
 *
 * @mangled DrawEnemyNum__Fiiiiii
 * @address 0x227EC0
 * @size 0x160
 */
void DrawEnemyNum(int, int, int, int, int, int);

/**
 * Draws the collected Atla count on the dungeon entrance board.
 *
 * @mangled DrawGetAtoraNumBoard__Fiiiiii
 * @address 0x228020
 * @size 0x250
 */
void DrawGetAtoraNumBoard(int, int, int, int, int, int);

/**
 * Draws one digit of the dungeon board's numbers, clipped to the board.
 *
 * @mangled DrawDunNumberClip__Fiiiiii
 * @address 0x228270
 * @size 0xE0
 */
void DrawDunNumberClip(int, int, int, int, int, int);

/**
 * Draws the dungeon entry screen's background and its darkening box.
 *
 * @mangled DrawDunEnterBack__Fi
 * @address 0x228350
 * @size 0xA0
 */
void DrawDunEnterBack(int);

/**
 * Draws the floor's name and number on the dungeon entry board.
 *
 * @mangled DrawDunEnterFloorName__Fiiiiii
 * @address 0x2283F0
 * @size 0x290
 */
void DrawDunEnterFloorName(int, int, int, int, int, int);

/**
 * Opens the character change menu.
 *
 * @mangled StartQuickChange__FP1iPii
 * @address 0x228680
 * @size 0x530
 */
void StartQuickChange(u_long128 *, int, int *, int);

/**
 * Runs one frame of the character change menu, and returns its result.
 *
 * @mangled CharaChangeLoop__Fv
 * @address 0x228BB0
 * @size 0x2E0
 */
int CharaChangeLoop(void);

/**
 * Handles key input on the character change menu.
 *
 * @mangled CharaChangeKey__Fv
 * @address 0x228E90
 * @size 0x8B0
 */
int CharaChangeKey(void);

/**
 * Draws the character change menu.
 *
 * @mangled CharaChangeDraw__Fv
 * @address 0x229740
 * @size 0xAD0
 */
void CharaChangeDraw(void);

/**
 * Starts reading the model of the active item.
 *
 * @mangled DngActItemModelReadStart__FP1
 * @address 0x22A210
 * @size 0x180
 */
int DngActItemModelReadStart(u_long128 *buffer);

/**
 * Builds the active item's model once its file has been read.
 *
 * @mangled DngActItemModelBuild__Fi
 * @address 0x22A390
 * @size 0x210
 */
int DngActItemModelBuild(int);

/**
 * @mangled DngActiveItemTextureCopy__Fv
 * @address 0x22A5A0
 * @size 0x110
 * @unknownret
 */
void DngActiveItemTextureCopy(void);

/**
 * @mangled DngActiveWeaponTextureCopy__Fv
 * @address 0x22A6B0
 * @size 0x130
 * @unknownret
 */
void DngActiveWeaponTextureCopy(void);

/**
 * Returns the message number of a held weapon's name.
 *
 * @mangled GetWeaponMsgNo__FP11WEAPON_HAVE
 * @address 0x22A7E0
 * @size 0x60
 */
s32 GetWeaponMsgNo(WEAPON_HAVE *);

/**
 * Returns the message number of an item's name.
 *
 * @mangled GetWeaponMsgNo2__Fi
 * @address 0x22A840
 * @size 0x40
 */
s16 GetWeaponMsgNo2(int);

/**
 * Draws the attachments set in a weapon's holes.
 *
 * @mangled DrawWepAttach__FiiP11WEAPON_HAVEii
 * @address 0x22A880
 * @size 0x1C0
 */
void DrawWepAttach(int, int, WEAPON_HAVE *, int, int);

/**
 * Tells whether the player has an Atla piece, held or placed.
 *
 * @mangled GetAtraTipNowHave__Fii
 * @address 0x22AA40
 * @size 0x180
 */
int GetAtraTipNowHave(int, int);

/**
 * Converts a value into the whole number the menus display for it.
 *
 * @mangled GetDispVolumeForFloat__Ff
 * @address 0x22ABC0
 * @size 0x70
 */
int GetDispVolumeForFloat(float);

/**
 * Starts reading the model the item preview shows.
 *
 * @mangled InitItemPolygonView__FiP1
 * @address 0x22AC30
 * @size 0xF0
 */
int InitItemPolygonView(int item_no, u_long128 *buffer);

/**
 * Sets up the item preview's model and textures once they have been read.
 *
 * @mangled EnterItemPolygonView__Fv
 * @address 0x22AD20
 * @size 0x220
 */
int EnterItemPolygonView(void);

/**
 * Turns and scales the item model under pad control, then draws it.
 *
 * @mangled LocalDrawItemPolygonView__Fv
 * @address 0x22AF40
 * @size 0x270
 */
void LocalDrawItemPolygonView(void);

/**
 * Draws the item preview model.
 *
 * @mangled DrawItemPolygonView__Fv
 * @address 0x22B1B0
 * @size 0x40
 */
void DrawItemPolygonView(void);

/**
 * Maps a debug item selection to its spreadsheet item number.
 *
 * @mangled ConvDebugSelectToExcelListNo__Fi
 * @address 0x22B1F0
 * @size 0x50
 */
int ConvDebugSelectToExcelListNo(int selection);

/**
 * Handles key input on the debug item menu.
 *
 * @mangled DebugItemGetKey__Fv
 * @address 0x22B240
 * @size 0x370
 */
int DebugItemGetKey(void);

/**
 * Draws the debug item menu.
 *
 * @mangled DebugItemGetDraw__Fv
 * @address 0x22B5B0
 * @size 0x210
 */
void DebugItemGetDraw(void);

/**
 * Draws the debug overlay listing an item's data.
 *
 * @mangled DrawItemDataView__Fi
 * @address 0x22B7C0
 * @size 0x230
 */
void DrawItemDataView(int);

/**
 * Returns the directory that menu textures load from.
 *
 * @mangled GetMenuTextureDir__Fv
 * @address 0x22B9F0
 * @size 0x10
 */
char *GetMenuTextureDir(void);

/**
 * Returns the language the menus display in.
 *
 * @mangled GetMenuLangFlag__Fv
 * @address 0x22BA00
 * @size 0x10
 */
int GetMenuLangFlag(void);

/**
 * Returns the path fragment of a language.
 *
 * @mangled GetNowSelectLanguage__Fi
 * @address 0x22BA10
 * @size 0x40
 */
char *GetNowSelectLanguage(int);

/**
 * Builds the menu texture path of the selected language.
 *
 * @mangled GetPathReadDifferntLang__FPc
 * @address 0x22BA50
 * @size 0x60
 */
void GetPathReadDifferntLang(char *);

/**
 * Loads a menu file from the selected language's directory, and returns its size or -1.
 *
 * @mangled LoadFileBGMenuData__FPcP1
 * @address 0x22BAB0
 * @size 0x90
 */
int LoadFileBGMenuData(char *name, u_long128 *buffer);

/**
 * Loads a menu file from the selected language's directory, and returns its size.
 *
 * @mangled LoadFileMenuData__FPcPUi
 * @address 0x22BB40
 * @size 0x70
 */
int LoadFileMenuData(char *, unsigned int *);

/**
 * Returns the buffer the battle menu or the edit menu loads its files into.
 *
 * @mangled BtlMenuBufferSet__Fi
 * @address 0x22BBB0
 * @size 0x50
 */
u_long128 *BtlMenuBufferSet(int);

/**
 * Rounds a buffer pointer up to the next 64-byte boundary.
 *
 * @mangled MenuCalcBufAlignment__FP1
 * @address 0x22BC00
 * @size 0x40
 */
u_long128 *MenuCalcBufAlignment(u_long128 *buffer);

/**
 * Returns the upper village bound for Atla selection based on story progress.
 *
 * @mangled GetAtoraMaxVillage__Fv
 * @address 0x22BC40
 * @size 0xD0
 */
int GetAtoraMaxVillage(void);

/**
 * Converts a map number into the village the Atla menu shows, capped at the villages available.
 *
 * @mangled GetNowMapTransAtraMap__Fi
 * @address 0x22BD10
 * @size 0xE0
 */
int GetNowMapTransAtraMap(int);

/**
 * Sets the menu's projection and view matrices from a camera.
 *
 * @mangled MenuWorldTrans__FP7CCamera
 * @address 0x22BDF0
 * @size 0xA0
 */
void MenuWorldTrans(CCamera *);

/**
 * Draws a menu model through a callback under the menu's camera and lights.
 *
 * @mangled MenuPolygonDraw__FiPFv_v
 * @address 0x22BE90
 * @size 0x190
 */
void MenuPolygonDraw(int, void (*)(void));

/**
 * Projects a frame's world position to screen coordinates.
 *
 * @mangled Get3DPosTo2DPos__FP6CFramePi
 * @address 0x22C020
 * @size 0x70
 */
void Get3DPosTo2DPos(CFrame *, int *);

/**
 * Returns the common menu font width of a style.
 *
 * @mangled GetMenuCommonFontW__Fii
 * @address 0x22C090
 * @size 0x40
 */
int GetMenuCommonFontW(int, int);

/**
 * Centres a message window on a horizontal position.
 *
 * @mangled GetMenuCommonPutXY__FP6ClsMesi
 * @address 0x22C0D0
 * @size 0x70
 */
int GetMenuCommonPutXY(ClsMes *, int);

/**
 * Sets up the common menu message windows.
 *
 * @mangled InitMenuMesSet__FiPs
 * @address 0x22C140
 * @size 0xD60
 */
void InitMenuMesSet(int, short *);

/**
 * Steps and draws a message window at a position.
 *
 * @mangled DrawMenuClsMes__FP6ClsMesii
 * @address 0x22CEA0
 * @size 0x50
 */
void DrawMenuClsMes(ClsMes *, int, int);

/**
 * Plays a menu sound effect, unless the identifier is negative.
 *
 * @mangled ComMenuSePlay__Fi
 * @address 0x22CEF0
 * @size 0x30
 */
void ComMenuSePlay(int);

/**
 * Draws a part of a menu texture with an alpha.
 *
 * @mangled DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i
 * @address 0x22CF20
 * @size 0x70
 */
void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, int);

/**
 * Draws a part of a menu texture tinted by a colour.
 *
 * @mangled DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci
 * @address 0x22CF90
 * @size 0xA0
 */
void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, unsigned char, unsigned char, unsigned char, int);

/**
 * Draws a part of a menu texture with a colour at each corner.
 *
 * @mangled DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
 * @address 0x22D030
 * @size 0xB0
 */
void DrawMenu2DSprite(CTexture *, CRect_i_, CRect_i_, spRGBA *, spRGBA *, spRGBA *, spRGBA *);

/**
 * Reloads one menu texture block through the texture manager.
 *
 * @mangled MenuTextureReload__Fi
 * @address 0x22D0E0
 * @size 0x50
 */
void MenuTextureReload(int);

/**
 * Deletes the texture block a menu holds.
 *
 * @mangled MenuTextureDelete__FPi
 * @address 0x22D130
 * @size 0x80
 */
void MenuTextureDelete(int *);

/**
 * Fills the whole screen with a colour.
 *
 * @mangled AllFillBoxForMenu__FUcUcUcUc
 * @address 0x22D1B0
 * @size 0xD0
 */
void AllFillBoxForMenu(unsigned char, unsigned char, unsigned char, unsigned char);

/**
 * Darkens the whole screen behind a menu.
 *
 * @mangled AllFadeForMenu__Fi
 * @address 0x22D280
 * @size 0x30
 */
void AllFadeForMenu(int);

/**
 * Draws the menu frame image over the whole screen at the given tint and alpha.
 *
 * @mangled FrameImageDraw__Fii
 * @address 0x22D2B0
 * @size 0x120
 */
void FrameImageDraw(int, int);

/**
 * Draws a rectangle shaded between a colour at each corner.
 *
 * @mangled DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA
 * @address 0x22D3D0
 * @size 0x80
 */
void DrawMenuColorGradation(CRect_i_ &, spRGBA *, spRGBA *, spRGBA *, spRGBA *);

/**
 * Draws a rectangle shaded between two colours from side to side.
 *
 * @mangled DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA
 * @address 0x22D450
 * @size 0x70
 */
void DrawMenuSideGradation(CRect_i_ &, spRGBA *, spRGBA *);

/**
 * Draws the mark over an item that cannot be set.
 *
 * @mangled DrawDontSetItemMark__Fiiiii
 * @address 0x22D4C0
 * @size 0xE0
 */
void DrawDontSetItemMark(int, int, int, int, int);

/**
 * Draws an item's icon with its attachment count or weapon mark.
 *
 * @mangled DrawIconParts__Fiiiiiii
 * @address 0x22D5A0
 * @size 0x1E0
 */
void DrawIconParts(int, int, int, int, int, int, int);

/**
 * Draws the attachment count or the weapon mark over one menu item slot.
 *
 * @mangled DrawAttachNumberOrWeapon__Fiiiiiiii
 * @address 0x22D780
 * @size 0x270
 */
void DrawAttachNumberOrWeapon(int, int, int, int, int, int, int, int);

/**
 * Draws a named texture with its alpha fading from one side to the other.
 *
 * @mangled FadeTexX__FiiiiPci
 * @address 0x22D9F0
 * @size 0x3A0
 */
void FadeTexX(int, int, int, int, char *, int);

/**
 * Looks up the icon sheet for an item and the icon's offset within it.
 *
 * @mangled RetCTex__FsRiRi
 * @address 0x22DD90
 * @size 0xF0
 */
CTexture *RetCTex(short, int &, int &);

/**
 * Clips a texture strip to a range of screen positions.
 *
 * @mangled MenuTextureClip__FRiRiRiii
 * @address 0x22DE80
 * @size 0x80
 */
void MenuTextureClip(int &, int &, int &, int, int);

/**
 * Counts the decimal digits of a number.
 *
 * @mangled GetNumberKeta__Fi
 * @address 0x22DF00
 * @size 0x40
 */
int GetNumberKeta(int);

/**
 * @mangled GetMenuIconInfo__Fi
 * @address 0x22DF40
 * @size 0x60
 * @unknownret
 */
void GetMenuIconInfo(int);

/**
 * Draws one of the main menu's icons.
 *
 * @mangled DrawMainMenuIcon__Fiiiiii
 * @address 0x22DFA0
 * @size 0x1E0
 */
void DrawMainMenuIcon(int, int, int, int, int, int);

/**
 * Draws a shaking item icon with its attachment count or weapon mark.
 *
 * @mangled DrawMenuVibeItem__Fiiiii
 * @address 0x22E180
 * @size 0x190
 */
void DrawMenuVibeItem(int, int, int, int, int);

/**
 * Reads the selected language's offsets for the main menu's help window.
 *
 * @mangled GetMainMenuRightHelpWinLangOffset__FRfRfRfRf
 * @address 0x22E310
 * @size 0xB0
 */
int GetMainMenuRightHelpWinLangOffset(float &, float &, float &, float &);

/**
 * Reads the selected language's offsets for the main menu's help message.
 *
 * @mangled GetMainMenuRightHelpMsgLangOffset__FRiRi
 * @address 0x22E3C0
 * @size 0x80
 */
int GetMainMenuRightHelpMsgLangOffset(int &, int &);

/**
 * Empties an inventory record.
 *
 * @mangled InitHaveData__FP9IHAVEITEM
 * @address 0x22E440
 * @size 0x30
 */
void InitHaveData(IHAVEITEM *);

/**
 * Empties a held-weapon record.
 *
 * @mangled InitHaveWep__FP11WEAPON_HAVE
 * @address 0x22E470
 * @size 0x40
 */
void InitHaveWep(WEAPON_HAVE *);

/**
 * Empties a held-attachment record.
 *
 * @mangled InitHaveAttach__FP11ATTACH_LIST
 * @address 0x22E4B0
 * @size 0x30
 */
void InitHaveAttach(ATTACH_LIST *);

/**
 * Exchanges two menu values, doing nothing if either pointer is null.
 *
 * @mangled MenuDataSwap__FPsPs
 * @address 0x22E4E0
 * @size 0x30
 */
void MenuDataSwap(s16 *first, s16 *second);

/**
 * Exchanges two menu values, doing nothing if either pointer is null.
 *
 * @mangled MenuDataSwap__FPiPi
 * @address 0x22E510
 * @size 0x30
 */
void MenuDataSwap(int *first, int *second);

/**
 * Exchanges two weapon records, doing nothing if either pointer is null.
 *
 * @mangled MenuDataSwap__FP11WEAPON_HAVEP11WEAPON_HAVE
 * @address 0x22E540
 * @size 0x90
 */
void MenuDataSwap(WEAPON_HAVE *first, WEAPON_HAVE *second);

/**
 * Exchanges two attachment records, doing nothing if either pointer is null.
 *
 * @mangled MenuDataSwap__FP11ATTACH_LISTP11ATTACH_LIST
 * @address 0x22E5D0
 * @size 0x90
 */
void MenuDataSwap(ATTACH_LIST *first, ATTACH_LIST *second);

/**
 * Marks which entries of an item pack the menu shows as disposable.
 *
 * @mangled SetMenuTrushMark__FP9ITEM_PACK
 * @address 0x22E660
 * @size 0xB0
 */
void SetMenuTrushMark(ITEM_PACK *);

/**
 * Clears the menu's disposable-item marks.
 *
 * @mangled DeleteMenuTrushMark__Fv
 * @address 0x22E710
 * @size 0x30
 */
void DeleteMenuTrushMark(void);

/**
 * Sets up a personal inventory board for a character.
 *
 * @mangled InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii
 * @address 0x22E740
 * @size 0x270
 */
void InitPersonalBoardMode(CUserStatus *, PERSONAL_BOARD *, int, int);

/**
 * Handles the key input that changes the personal board's mode.
 *
 * @mangled BoardModeChangeKey__Fv
 * @address 0x22E9B0
 * @size 0x130
 */
int BoardModeChangeKey(void);

/**
 * Keeps the personal board's cursor and scroll inside the list.
 *
 * @mangled PersonalBoardLimmitCheck__Fv
 * @address 0x22EAE0
 * @size 0x1A0
 */
void PersonalBoardLimmitCheck(void);

/**
 * Handles cursor movement on the personal board.
 *
 * @mangled PersonalBoardKeySub__Fv
 * @address 0x22EC80
 * @size 0x2E0
 */
int PersonalBoardKeySub(void);

/**
 * Handles key input on the personal board.
 *
 * @mangled PersonalBoardKey__Fv
 * @address 0x22EF60
 * @size 0x30
 */
void PersonalBoardKey(void);

/**
 * Swaps an inventory entry into a personal board slot.
 *
 * @mangled PersonalBoardItemPush__FP9IHAVEITEMi
 * @address 0x22EF90
 * @size 0x110
 */
int PersonalBoardItemPush(IHAVEITEM *, int);

/**
 * Returns the sort category containing an attachment identifier.
 *
 * @mangled GetAttachKind__Fi
 * @address 0x00231AD0
 * @size 0x9C
 */
int GetAttachKind(int item_no);

/** Texture block the shadow and icon sheets load into. */
extern int MenuShadowReadBlock;
/** Highest weapon-chain position available to each playable character. */
extern s16 MenuCharaWeaponMax[];
/** Texture block the battle menu loads into. */
extern int BtlMenuReadBlock;

/** Volume the battle menu drops the background music to. */
extern int BtlMenuBGMvol;
/** Set while the extra-menu texture has been read. */
extern int MenuExTextureReadFlag;
