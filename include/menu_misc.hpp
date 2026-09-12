#pragma once

#include "common.h"

class CCharacter;
class CUserStatus;
class ClsMes;
struct BT_SHOT_EFFECT;
struct WEAPON_HAVE;

/**
 * Returns the game flag number the battle menu shows for a page, given the quest dungeon state.
 *
 * @mangled NowGetGameFlagForBtlMenu__Fi
 * @address 0x20BEC0
 * @size 0xC0
 */
int NowGetGameFlagForBtlMenu(int);

/**
 * Returns the save data's game flag 0x30, which the menus check for the Hebikiri.
 *
 * @mangled GetMenuHebikiriFlag__Fv
 * @address 0x20BF80
 * @size 0x30
 */
int GetMenuHebikiriFlag();

/**
 * Equips a character's default weapon from among the weapons in its dungeon status slots.
 *
 * @mangled EquipDefaultWeapon__Fi
 * @address 0x20BFB0
 * @size 0xC0
 */
void EquipDefaultWeapon(int);

/**
 * Draws the menu's empty-slot picture from a named texture at a screen position.
 *
 * @mangled DrawMenuNothing__FiiiiPcii
 * @address 0x20C070
 * @size 0x360
 */
void DrawMenuNothing(int, int, int, int, char *, int, int);

/**
 * Returns the item use volume the menu holds.
 *
 * @mangled GetMenuItemUseVolume__Fv
 * @address 0x20C3D0
 * @size 0x10
 */
int GetMenuItemUseVolume();

/**
 * Applies the effect of using an item on a character or weapon and returns the outcome.
 *
 * @mangled ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE
 * @address 0x20C3E0
 * @size 0x9F0
 */
int ItemUseFunc(CUserStatus *, int, int, int, WEAPON_HAVE *);

/**
 * Returns a weapon's damage rate: 1.5 for weapon 0x110 once its durability falls to a set fraction, otherwise 1.0.
 *
 * @mangled GetNowWeaponRate__FP11WEAPON_HAVE
 * @address 0x20CDD0
 * @size 0x60
 */
float GetNowWeaponRate(WEAPON_HAVE *);

/**
 * Reports whether a weapon can be broken down, which needs its unk_02 value to be at least five.
 *
 * @mangled WeaponStatusBreakEnable__FP11WEAPON_HAVE
 * @address 0x20CE30
 * @size 0x40
 */
int WeaponStatusBreakEnable(WEAPON_HAVE *);

/**
 * Returns a weapon's number of build-up entries and counts the enabled ones through the reference.
 *
 * @mangled WeaponStatusBuildUp__FP11WEAPON_HAVERi
 * @address 0x20CE70
 * @size 0xC0
 */
int WeaponStatusBuildUp(WEAPON_HAVE *, int &);

/**
 * Applies a weapon's values to named frames of the menu character model.
 *
 * @mangled MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE
 * @address 0x20CF30
 * @size 0x120
 */
void MenuWeaponSpSet(CCharacter *, WEAPON_HAVE *);

/**
 * Records whether the menu character's weapon effect file is being read.
 *
 * @mangled SetMenuCharaEffectReadFlag__Fi
 * @address 0x20D050
 * @size 0x10
 */
void SetMenuCharaEffectReadFlag(int);

/**
 * Returns whether the menu character's weapon effect file is being read.
 *
 * @mangled GetMenuCharaEffectReadFlag__Fv
 * @address 0x20D060
 * @size 0x10
 */
int GetMenuCharaEffectReadFlag();

/**
 * Returns the weapon shot effect the menu character uses.
 *
 * @mangled GetDngWepEffectPointer__Fv
 * @address 0x20D070
 * @size 0x10
 */
BT_SHOT_EFFECT *GetDngWepEffectPointer();

/**
 * Returns the buffer the menu reads weapon effect files into.
 *
 * @mangled GetWepEffectMenuReadBuf__Fv
 * @address 0x20D080
 * @size 0x10
 */
u_long128 *GetWepEffectMenuReadBuf();

/**
 * Records the effect kind that was active before the menu changed it.
 *
 * @mangled SetOldEffectKind__Fi
 * @address 0x20D090
 * @size 0x10
 */
void SetOldEffectKind(int);

/**
 * Sets the buffer the menu reads weapon effect files into.
 *
 * @mangled SetWepEffectMenuReadBuf__FP1
 * @address 0x20D0A0
 * @size 0x10
 */
void SetWepEffectMenuReadBuf(u_long128 *);

/**
 * Starts reading the active character's weapon effect file and returns the effect it is for.
 *
 * @mangled DngWepEffectReadStart__Fv
 * @address 0x20D0B0
 * @size 0xC0
 */
BT_SHOT_EFFECT *DngWepEffectReadStart();

/**
 * Attaches the read weapon effect to the menu character.
 *
 * @mangled MenuWeaponEffectSet__Fi
 * @address 0x20D170
 * @size 0x50
 */
void MenuWeaponEffectSet(int);

/**
 * Returns the menu's current test number.
 *
 * @mangled GetNowTestNo__Fv
 * @address 0x20D1C0
 * @size 0x10
 */
int GetNowTestNo();

/**
 * Starts the background read of a weapon model file and reports whether it was started.
 *
 * @mangled StartReadWepMDS__FP1i
 * @address 0x20D1D0
 * @size 0x1E0
 */
int StartReadWepMDS(u_long128 *, int);

/**
 * Returns one entry of the menu's weapon model table.
 *
 * @mangled GetMenuWeaponModelData__Fi
 * @address 0x20D3B0
 * @size 0x20
 */
int *GetMenuWeaponModelData(int);

/**
 * Clears the menu's weapon model table.
 *
 * @mangled InitMenuWeaponModelData__Fv
 * @address 0x20D3D0
 * @size 0x30
 */
void InitMenuWeaponModelData();

/**
 * Returns the two-value reference entry for one weapon model.
 *
 * @mangled GetMenuWeaponModelInfo__Fi
 * @address 0x20D400
 * @size 0x20
 */
int *GetMenuWeaponModelInfo(int);

/**
 * Marks every weapon model reference entry unused.
 *
 * @mangled InitMenuWeaponModelReference__Fv
 * @address 0x20D420
 * @size 0x50
 */
void InitMenuWeaponModelReference();

/**
 * Stores the two values of one weapon model reference entry.
 *
 * @mangled SetMenuWeaponModelReference__Fiii
 * @address 0x20D470
 * @size 0x30
 */
void SetMenuWeaponModelReference(int, int, int);

/**
 * Returns the first value of a weapon model reference entry, the model's frame number.
 *
 * @mangled GetMenuWeaponModelFrameNo__Fi
 * @address 0x20D4A0
 * @size 0x20
 */
int GetMenuWeaponModelFrameNo(int);

/**
 * Enters a menu page's weapon models and textures from their read files and returns the outcome.
 *
 * @mangled EnterWeaponModel__Fiii
 * @address 0x20D4C0
 * @size 0x470
 */
int EnterWeaponModel(int, int, int);

/**
 * Builds the models of a character's weapons into the menu's model cache.
 *
 * @mangled WeaponModelBuildFunc__Fii
 * @address 0x20D930
 * @size 0x430
 */
void WeaponModelBuildFunc(int, int);

/**
 * Builds the model of a character's equipped weapon for the dungeon and attaches its effect.
 *
 * @mangled DngWeaponEquipModelBuild__FiiP1
 * @address 0x20DD60
 * @size 0x120
 */
int DngWeaponEquipModelBuild(int, int, u_long128 *);

/**
 * Returns the motion step a character's status bits select.
 *
 * @mangled GetNowMotionStepCnt__Fi
 * @address 0x20DE80
 * @size 0x40
 */
int GetNowMotionStepCnt(int);

/**
 * Returns the status bits of one character, or zero when there is no dungeon status.
 *
 * @mangled GetNowActiveCharaStatus__Fi
 * @address 0x20DEC0
 * @size 0x30
 */
int GetNowActiveCharaStatus(int);

/**
 * Sets the menu character model's motion from its status bits.
 *
 * @mangled SetNowCharaMotionNo__Fi
 * @address 0x20DEF0
 * @size 0x130
 */
void SetNowCharaMotionNo(int);

/**
 * Saves the ambient light and tints it for the status of a character.
 *
 * @mangled SetItemMenuColor__Fi
 * @address 0x20E020
 * @size 0x150
 */
void SetItemMenuColor(int);

/**
 * Restores the ambient light saved before the menu tinted it.
 *
 * @mangled SetItemMenuOldAmbient__Fv
 * @address 0x20E170
 * @size 0x30
 */
void SetItemMenuOldAmbient();

/**
 * Starts the background read of a menu character model file and reports whether it was started.
 *
 * @mangled StartLoadCharaMDS__FP1ii
 * @address 0x20E1A0
 * @size 0xE0
 */
int StartLoadCharaMDS(u_long128 *, int, int);

/**
 * Builds the menu character model from its read file and poses it for the menu.
 *
 * @mangled MenuCharaMDSBuild2__Fii
 * @address 0x20E280
 * @size 0x2B0
 */
void MenuCharaMDSBuild2(int, int);

/**
 * Writes the file path of one character's model into a buffer.
 *
 * @mangled GetCharaChangeReadCharaFilePath__FPci
 * @address 0x20E530
 * @size 0x80
 */
void GetCharaChangeReadCharaFilePath(char *, int);

/**
 * Starts the background reads of the character change screen and reports whether they were started.
 *
 * @mangled CharaChangeInitToGL__FP1i
 * @address 0x20E5B0
 * @size 0x300
 */
int CharaChangeInitToGL(u_long128 *, int);

/**
 * Starts the background read of the character change screen's voice data.
 *
 * @mangled CharaChangeInitToGL2__Fi
 * @address 0x20E8B0
 * @size 0xB0
 */
void CharaChangeInitToGL2(int);

/**
 * Loads the battle menu's character and sets up its weapon effect.
 *
 * @mangled BtMenuLoadChara__Fv
 * @address 0x20E960
 * @size 0xA0
 */
void BtMenuLoadChara();

/**
 * Enters the battle menu's read textures and clears its load state.
 *
 * @mangled BtMenuLoad2__Fi
 * @address 0x20EA00
 * @size 0xE0
 */
void BtMenuLoad2(int);

/**
 * Reports whether all twelve of the East King's game flags are set.
 *
 * @mangled EastKingCheckComplete__Fv
 * @address 0x20EAE0
 * @size 0x80
 */
int EastKingCheckComplete();

/**
 * Records whether the monster name window is drawn.
 *
 * @mangled SetMonsterNameDrawFlag__Fi
 * @address 0x20EB60
 * @size 0x10
 */
void SetMonsterNameDrawFlag(int);

/**
 * Returns whether the monster name window is drawn.
 *
 * @mangled GetMonsterNameDrawFlag__Fv
 * @address 0x20EB70
 * @size 0x10
 */
int GetMonsterNameDrawFlag();

/**
 * Prepares the monster name message window over the given message buffers.
 *
 * @mangled MonsterNameInit__FP6ClsMesPsPUc
 * @address 0x20EB80
 * @size 0x210
 */
void MonsterNameInit(ClsMes *, short *, unsigned char *);

/**
 * Builds the monster name message window for a message.
 *
 * @mangled MonsterNameMake__Fi
 * @address 0x20ED90
 * @size 0x80
 */
void MonsterNameMake(int);

/**
 * Sets the screen position of the monster name message window.
 *
 * @mangled MonsterNamePosSet__Fii
 * @address 0x20EE10
 * @size 0x60
 */
void MonsterNamePosSet(int, int);

/**
 * Steps and draws the monster name message window while it is enabled.
 *
 * @mangled MonsterNameDraw__Fv
 * @address 0x20EE70
 * @size 0x120
 */
void MonsterNameDraw();

/**
 * Loads the textures and message windows of the dungeon escape prompt.
 *
 * @mangled DngEscapeMsgInit__FP6ClsMesP6ClsMesi
 * @address 0x20EF90
 * @size 0x2B0
 */
void DngEscapeMsgInit(ClsMes *, ClsMes *, int);

/**
 * Steps the dungeon escape prompt's fade and draws it.
 *
 * @mangled DngEscapeMsgDraw__Fv
 * @address 0x20F240
 * @size 0x120
 */
void DngEscapeMsgDraw();

/**
 * Handles one frame of pad input for the dungeon escape prompt and returns its result.
 *
 * @mangled DngEscapeMsgLoop__Fv
 * @address 0x20F360
 * @size 0x170
 */
int DngEscapeMsgLoop();

/**
 * Collects the party's special items and weapons into the given arrays and reports whether there are any.
 *
 * @mangled CheckItemThrow__FPiPi
 * @address 0x20F4D0
 * @size 0x1B0
 */
int CheckItemThrow(int *, int *);

/**
 * Stores the index of a weapon's largest element value in its best_elem.
 *
 * @mangled SetWeaponElementStatus__FP11WEAPON_HAVE
 * @address 0x20F680
 * @size 0x60
 */
void SetWeaponElementStatus(WEAPON_HAVE *);

/**
 * Returns weapon option bits with each pair of opposed options cancelled.
 *
 * @mangled CheckWeaponOptionStatus__Fi
 * @address 0x20F6E0
 * @size 0x90
 */
int CheckWeaponOptionStatus(int);

/**
 * Returns whether a weapon option is a benefit or a drawback.
 *
 * @mangled IsWeaponOptionGoodOrBad__Fi
 * @address 0x20F770
 * @size 0x40
 */
int IsWeaponOptionGoodOrBad(int);

/**
 * Returns the default option value of a weapon, or 1 when it has no data.
 *
 * @mangled DefaultWeaponOptionSet__Fi
 * @address 0x20F7B0
 * @size 0x40
 */
int DefaultWeaponOptionSet(int);

/**
 * Draws the icons of the options a weapon carries.
 *
 * @mangled WeaponOptionStatusDraw__FP11WEAPON_HAVEiii
 * @address 0x20F7F0
 * @size 0x230
 */
void WeaponOptionStatusDraw(WEAPON_HAVE *, int, int, int);

/**
 * Draws a weapon's star rating.
 *
 * @mangled WeaponStarDraw__FiiP11WEAPON_HAVEi
 * @address 0x20FA20
 * @size 0x1C0
 */
void WeaponStarDraw(int, int, WEAPON_HAVE *, int);

/**
 * Randomly adjusts one value of a weapon being changed into another.
 *
 * @mangled LocalWeaponDataChange__FPciii
 * @address 0x20FBE0
 * @size 0x100
 */
void LocalWeaponDataChange(char *, int, int, int);

/**
 * Changes a weapon into another one, carrying over and adjusting its values, and reports success.
 *
 * @mangled WeaponDataChangeByRGate__FP11WEAPON_HAVEi
 * @address 0x20FCE0
 * @size 0x4F0
 */
int WeaponDataChangeByRGate(WEAPON_HAVE *, int);

/**
 * Returns how many of an item the party is carrying.
 *
 * @mangled GetNumHowManyItemsHave__Fi
 * @address 0x2101D0
 * @size 0x110
 */
int GetNumHowManyItemsHave(int);

/**
 * Returns the number of edit menu icons, one fewer until the manual is available.
 *
 * @mangled GetEditMenuMax__Fv
 * @address 0x2102E0
 * @size 0x40
 */
int GetEditMenuMax();

/**
 * Draws one edit menu icon at its resting position.
 *
 * @mangled DrawMenuIcon__Fi
 * @address 0x210320
 * @size 0xD0
 */
void DrawMenuIcon(int);

/**
 * Writes the screen position of one edit menu icon.
 *
 * @mangled GetEditMenuIconPos__FiPi
 * @address 0x2103F0
 * @size 0x100
 */
void GetEditMenuIconPos(int, int *);

/**
 * Draws the edit menu icons at their current positions.
 *
 * @mangled DrawMoveMenuIcon__Fv
 * @address 0x2104F0
 * @size 0x1C0
 */
void DrawMoveMenuIcon();

/**
 * Moves the edit menu icons one step away from their resting positions and reports when they have arrived.
 *
 * @mangled CalMoveFromMenuIcon__Fv
 * @address 0x2106B0
 * @size 0x240
 */
int CalMoveFromMenuIcon();

/**
 * Moves the edit menu icons one step back to their resting positions and reports when they have arrived.
 *
 * @mangled CalMoveToMenuIcon__Fv
 * @address 0x2108F0
 * @size 0x1C0
 */
int CalMoveToMenuIcon();

/**
 * Loads the edit menu's data and textures and sets up its windows, pad and cursor.
 *
 * @mangled EditMenuInit__FPii
 * @address 0x210AB0
 * @size 0x2F0
 */
void EditMenuInit(int *, int);

/**
 * Releases the edit menu's textures and returns the pad to normal mode.
 *
 * @mangled EditMenuExit__Fv
 * @address 0x210DA0
 * @size 0x90
 */
void EditMenuExit();

/**
 * Reports whether the edit menu draws its help window for a page.
 *
 * @mangled GetDrawHelpWindow__Fi
 * @address 0x210E30
 * @size 0x70
 */
int GetDrawHelpWindow(int);

/**
 * Runs one frame of the edit menu for its current state and returns the result.
 *
 * @mangled EditMenuLoop__Fv
 * @address 0x210EA0
 * @size 0x110
 */
int EditMenuLoop();

/**
 * Draws the edit menu for its current state.
 *
 * @mangled EditMenuDraw__Fv
 * @address 0x210FB0
 * @size 0x310
 */
void EditMenuDraw();

/**
 * Draws the edit menu's opening and enters its page textures once they have been read.
 *
 * @mangled EditMenuStart__Fv
 * @address 0x2112C0
 * @size 0x4C0
 */
int EditMenuStart();

/**
 * Draws the edit menu's icon selection.
 *
 * @mangled EditMenuSelectDraw__Fv
 * @address 0x211780
 * @size 0x230
 */
void EditMenuSelectDraw();

/**
 * Handles pad input in the edit menu's icon selection and returns the result.
 *
 * @mangled EditMenuSelect__Fv
 * @address 0x2119B0
 * @size 0x390
 */
int EditMenuSelect();

/**
 * Draws the edit menu while it closes.
 *
 * @mangled EditMenuToExitDraw__Fv
 * @address 0x211D40
 * @size 0x20
 */
void EditMenuToExitDraw();

/**
 * Runs the edit menu's closing and reports when it is finished.
 *
 * @mangled EditMenuToExit__Fv
 * @address 0x211D60
 * @size 0x150
 */
int EditMenuToExit();

/**
 * Draws the Atla selection page.
 *
 * @mangled AtoraSelectDraw__Fv
 * @address 0x211EB0
 * @size 0x90
 */
void AtoraSelectDraw();

/**
 * Runs the Atla selection page and returns the result.
 *
 * @mangled AtoraSelect__Fv
 * @address 0x211F40
 * @size 0x190
 */
int AtoraSelect();

/**
 * Draws the Atla move state, which has nothing to draw.
 *
 * @mangled AtoraMoveDraw__Fv
 * @address 0x2120D0
 * @size 0x10
 */
void AtoraMoveDraw();

/**
 * Leaves the edit menu for the Atla move and returns the result.
 *
 * @mangled AtoraMove__Fv
 * @address 0x2120E0
 * @size 0x30
 */
int AtoraMove();

/**
 * Draws the background panels of the analysis page.
 *
 * @mangled AnalyzeBackDraw__Fii
 * @address 0x212110
 * @size 0x160
 */
void AnalyzeBackDraw(int, int);

/**
 * Returns the analysis page's completion percentage, capped at 100.
 *
 * @mangled AnalyzeRequestPer__Fv
 * @address 0x212270
 * @size 0xB0
 */
float AnalyzeRequestPer();

/**
 * Draws the analysis page's bars and reports whether the fill has reached its target.
 *
 * @mangled AnalyzeBarDraw__Fv
 * @address 0x212320
 * @size 0x6A0
 */
int AnalyzeBarDraw();

/**
 * Draws the transition into the analysis page.
 *
 * @mangled ToAnalyzeEditDraw__Fv
 * @address 0x2129C0
 * @size 0x350
 */
void ToAnalyzeEditDraw();

/**
 * Advances the transition into the analysis page.
 *
 * @mangled ToAnalyzeEdit__Fv
 * @address 0x212D10
 * @size 0x50
 */
void ToAnalyzeEdit();

/**
 * Draws the analysis page.
 *
 * @mangled AnalyzeEditDraw__Fv
 * @address 0x212D60
 * @size 0x1C0
 */
void AnalyzeEditDraw();

/**
 * Handles pad input on the analysis page and returns the result.
 *
 * @mangled AnalyzeEdit__Fv
 * @address 0x212F20
 * @size 0x60
 */
int AnalyzeEdit();

/**
 * Draws the transition out of the analysis page.
 *
 * @mangled FromAnalyzeEditDraw__Fv
 * @address 0x212F80
 * @size 0x50
 */
void FromAnalyzeEditDraw();

/**
 * Advances the transition out of the analysis page.
 *
 * @mangled FromAnalyzeEdit__Fv
 * @address 0x212FD0
 * @size 0xB0
 */
void FromAnalyzeEdit();

/**
 * Draws the edit menu's save page.
 *
 * @mangled EditSaveDraw__Fv
 * @address 0x213080
 * @size 0x80
 */
void EditSaveDraw();

/**
 * Handles pad input on the edit menu's save page.
 *
 * @mangled EditSaveKey__Fv
 * @address 0x213100
 * @size 0xE0
 */
void EditSaveKey();

/**
 * Draws the edit menu's option page.
 *
 * @mangled OptionDraw__Fv
 * @address 0x2131E0
 * @size 0x70
 */
void OptionDraw();

/**
 * Handles pad input on the edit menu's option page.
 *
 * @mangled EdOptionSelect__Fv
 * @address 0x213250
 * @size 0x100
 */
void EdOptionSelect();

/**
 * Handles pad input on the edit menu's manual page.
 *
 * @mangled EdMenuManualKey__Fv
 * @address 0x213350
 * @size 0x100
 */
int EdMenuManualKey();

/**
 * Draws the edit menu's manual page.
 *
 * @mangled EdMenuManualDraw__Fv
 * @address 0x213450
 * @size 0x70
 */
void EdMenuManualDraw();

/**
 * Clears the table of save file information.
 *
 * @mangled InitSaveFileInfoTbl__Fv
 * @address 0x2134C0
 * @size 0x80
 */
void InitSaveFileInfoTbl();

/**
 * Returns the attribute recorded for a save file name, or zero when the name is not in the table.
 *
 * @mangled GetOpenAttribute__FPc
 * @address 0x213540
 * @size 0x90
 */
int GetOpenAttribute(char *);
