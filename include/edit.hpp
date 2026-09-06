#pragma once

/**
 * @file
 * Declares the shared editor helpers implemented by retail editetc.cpp.
 */

class CCamera;
class CCharacter;
class CDebugFont;
class CEditGround;
class CFrameVu1;
class CMapParts;
class CTexture;
struct EDIT_EFFECT_INFO;
struct EPARTS_FUNC_DATA;

/**
 * Starts the editor's ambient sound at the requested volume.
 *
 * @mangled EdAmbientPlay__Ff
 * @address 0x1715D0
 * @size 0x40
 */
void EdAmbientPlay(float volume);

/**
 * Describes the time range and rendering parameters of depth of field.
 */
struct DEPTH_OF_FIELD_INFO {
    float start;       /**< Start time on the game's twelve-unit clock. */
    float end;         /**< End time on the game's twelve-unit clock. */
    float distance[2]; /**< Near and far focus distances. */
    int level;         /**< Strength preset selected for the effect. */
    int alpha;         /**< Blend alpha of the effect. */
    int blur;          /**< Blur-kernel setting of the effect. */
};

/**
 * Enables or disables the editor debug controls.
 *
 * @mangled EdDDebug__Fi
 * @address 0x170250
 * @size 0xC
 */
void EdDDebug(int on);

/**
 * Selects the font used by the editor debug overlay.
 *
 * @mangled EdDSetFont__FP10CDebugFont
 * @address 0x170260
 * @size 0xC
 */
void EdDSetFont(CDebugFont *font);

/**
 * Draws text queued by the editor debug overlay.
 *
 * @mangled EdDDrawFont__Fv
 * @address 0x170270
 * @size 0xB0
 */
void EdDDrawFont();

/**
 * Updates the editor debug overlay and free-movement controls.
 *
 * @mangled EdDCheck__Fv
 * @address 0x170320
 * @size 0x2C
 */
void EdDCheck();

/**
 * Writes the editor debug text buffer to its output file.
 *
 * @mangled EdOutPutFile__Fv
 * @address 0x170350
 * @size 0x7C
 */
void EdOutPutFile();

/**
 * Queues a labelled vector in the editor debug overlay.
 *
 * @mangled EdDPrintVector__FPcPf
 * @address 0x170450
 * @size 0xB8
 */
void EdDPrintVector(char *name, float *vector);

/**
 * Queues a line of text in the editor debug overlay.
 *
 * @mangled EdDPrint__FPc
 * @address 0x170510
 * @size 0x3C
 */
void EdDPrint(char *text);

/**
 * Moves the editor camera from debug-pad input.
 *
 * @mangled EdDMoveCamera__FPfPf
 * @address 0x170550
 * @size 0x378
 */
void EdDMoveCamera(float *position, float *reference);

/**
 * Moves the editor camera reference point from debug-pad input.
 *
 * @mangled EdDMoveCameraRef__FPfPf
 * @address 0x1708D0
 * @size 0x294
 */
void EdDMoveCameraRef(float *position, float *reference);

/**
 * Moves an editor character using the debug camera controls.
 *
 * @mangled EdDMoveChara__FP10CCharacterP7CCamera
 * @address 0x170B70
 * @size 0x428
 */
void EdDMoveChara(CCharacter *character, CCamera *camera);

/**
 * Resets the positional sound-source slots.
 *
 * @mangled EdInitSoundSrc__Fv
 * @address 0x171800
 * @size 0x64
 */
void EdInitSoundSrc();

/**
 * Starts the positional sound sources prepared for the current frame.
 *
 * @mangled EdPlaySoundSrc__Fv
 * @address 0x171870
 * @size 0x260
 */
void EdPlaySoundSrc();

/**
 * Stops every active positional sound source.
 *
 * @mangled EdStopSoundSrc__Fv
 * @address 0x171AD0
 * @size 0x94
 */
void EdStopSoundSrc();

/**
 * Updates positional sound volume and panning for visible map parts.
 *
 * @mangled EdSetSoundSrcVol__FfPP9CMapPartsiPfPf
 * @address 0x171D20
 * @size 0x3E0
 */
void EdSetSoundSrcVol(float time, CMapParts **parts, int count, float *camera_position,
                      float *camera_reference);

/**
 * Selects the default depth-of-field parameters for a level.
 *
 * @mangled EdSetDOFLevel__Fi
 * @address 0x172210
 * @size 0x8C
 */
void EdSetDOFLevel(int level);

/**
 * Copies a map's depth-of-field parameters into editor state.
 *
 * @mangled EdSetDOF__FP19DEPTH_OF_FIELD_INFO
 * @address 0x1722A0
 * @size 0x50
 */
void EdSetDOF(DEPTH_OF_FIELD_INFO *info);

/**
 * Draws depth of field using either the stored or requested level.
 *
 * @mangled EdDrawDOF__Fi
 * @address 0x1722F0
 * @size 0x58
 */
void EdDrawDOF(int level);

/**
 * Resets the editor lightning effect.
 *
 * @mangled EdInitThunderEffect__Fv
 * @address 0x172350
 * @size 0x18
 */
void EdInitThunderEffect();

/**
 * Steps lightning for a map and its editable ground model.
 *
 * @mangled EdThunderEffect__FiP11CEditGround
 * @address 0x172370
 * @size 0x274
 */
void EdThunderEffect(int map, CEditGround *ground);

/**
 * Starts effects attached to the supplied map parts.
 *
 * @mangled EnterPartsEffect__FP9CMapPartsP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFOi
 * @address 0x172AC0
 * @size 0xC4
 */
void EnterPartsEffect(CMapParts *parts, EPARTS_FUNC_DATA *functions, EDIT_EFFECT_INFO *effects,
                      int count);

/**
 * Clears the editor's pending used-item selection.
 *
 * @mangled EdUseItemInit__Fv
 * @address 0x172BD0
 * @size 0x24
 */
void EdUseItemInit();

/**
 * Supplies the item list available to editor menus.
 *
 * @mangled EdSetUseItem__FPi
 * @address 0x172C00
 * @size 0x80
 */
void EdSetUseItem(int *items);

/**
 * Returns the item selected by the editor menu.
 *
 * @mangled EdGetUseItem__Fv
 * @address 0x172C80
 * @size 0x24
 */
int EdGetUseItem();

/**
 * Selects the character whose name the editor registers.
 *
 * @mangled EdSetNameRegChara__Fi
 * @address 0x172CB0
 * @size 0xC
 */
void EdSetNameRegChara(int character);

/**
 * Selects the shop opened by the editor menu.
 *
 * @mangled EdSetShopNo__Fi
 * @address 0x172CC0
 * @size 0xC
 */
void EdSetShopNo(int shop);

/**
 * Starts an editor menu in the requested mode.
 *
 * @mangled EdInitMenu__Fi
 * @address 0x172CD0
 * @size 0x60
 */
int EdInitMenu(int mode);

/**
 * Completes editor-menu initialization once its resources are ready.
 *
 * @mangled EdInitModeFinish__FP7CCameraP8CTexture
 * @address 0x172D30
 * @size 0x200
 */
int EdInitModeFinish(CCamera *camera, CTexture *texture);

/**
 * Closes the active editor menu.
 *
 * @mangled EdExitMenu__Fv
 * @address 0x172F30
 * @size 0x44
 */
void EdExitMenu();

/**
 * Steps the active editor-menu mode.
 *
 * @mangled EdMenuMode__Fv
 * @address 0x172F80
 * @size 0x114
 */
int EdMenuMode();

/**
 * Adds an item awarded by an editor event.
 *
 * @mangled EdGetItem__Fiii
 * @address 0x1730A0
 * @size 0xD4
 */
void EdGetItem(int item, int count, int attachment);

/**
 * Expands the inventory limit used by editor rewards.
 *
 * @mangled EdAddMaxItem__Fi
 * @address 0x173180
 * @size 0x84
 */
int EdAddMaxItem(int amount);

/**
 * Returns whether the preceding editor reward exceeded inventory capacity.
 *
 * @mangled EdCheckItemOver__Fv
 * @address 0x173210
 * @size 0x28
 */
int EdCheckItemOver();

/**
 * Clears the editor reward's inventory-overflow flag.
 *
 * @mangled EdClearItemOverFlag__Fv
 * @address 0x173240
 * @size 0x28
 */
void EdClearItemOverFlag();

/**
 * Returns whether the inventory contains the requested item.
 *
 * @mangled EdCheckItem__Fi
 * @address 0x173270
 * @size 0x6C
 */
int EdCheckItem(int item);

/**
 * Returns whether the requested item can be awarded.
 *
 * @mangled EdCheckGetItem__Fi
 * @address 0x1732E0
 * @size 0x6C
 */
int EdCheckGetItem(int item);

/**
 * Configures the editor's system-message prompt.
 *
 * @mangled EdSetSystemMes__FiiiiPii
 * @address 0x1733E0
 * @size 0xB4
 */
void EdSetSystemMes(int number, int count, int position, int input_key, int *arguments,
                    int argument_count);

/**
 * Configures the editor's contextual help message.
 *
 * @mangled EdSetHelpMes__FiiiPii
 * @address 0x1734A0
 * @size 0x134
 */
void EdSetHelpMes(int number, int count, int position, int *arguments, int argument_count);

/**
 * Clears the active editor system message.
 *
 * @mangled EdClearSystemMes__Fv
 * @address 0x1735E0
 * @size 0x60
 */
void EdClearSystemMes();

/**
 * Returns whether the active editor system message has completed.
 *
 * @mangled EdSystemMesCheck__Fv
 * @address 0x173640
 * @size 0x20
 */
int EdSystemMesCheck();

/**
 * Advances the active editor system message.
 *
 * @mangled EdSystemMesStep__Fv
 * @address 0x173660
 * @size 0xE8
 */
void EdSystemMesStep();

/**
 * Draws the active editor system message.
 *
 * @mangled EdSystemMesDraw__Fv
 * @address 0x173750
 * @size 0x70
 */
void EdSystemMesDraw();

/**
 * Selects the main editor help message for the current build state.
 *
 * @mangled EdEditMainHelpMes__Fi
 * @address 0x1737C0
 * @size 0x6C
 */
void EdEditMainHelpMes(int building);

/**
 * Displays the prompt for walking into editor mode.
 *
 * @mangled EdWalkToEditMes__Fi
 * @address 0x173830
 * @size 0x50
 */
void EdWalkToEditMes(int wait);

/**
 * Displays the contextual help for placing a building part.
 *
 * @mangled EdEditBuildHelpMes__Fi
 * @address 0x173880
 * @size 0xAC
 */
void EdEditBuildHelpMes(int part);

/**
 * Displays the contextual help for moving an editor part.
 *
 * @mangled EdEditMoveHelpMes__Fv
 * @address 0x173930
 * @size 0x74
 */
void EdEditMoveHelpMes();

/**
 * Displays the fishing movement help message.
 *
 * @mangled EdFishingWalkHelpMes__Fi
 * @address 0x1739B0
 * @size 0x68
 */
void EdFishingWalkHelpMes(int fish);

/**
 * Displays the fishing-angle help message.
 *
 * @mangled EdFishingAngleHelpMEs__Fi
 * @address 0x173A20
 * @size 0x8
 */
void EdFishingAngleHelpMEs(int angle);

/**
 * Displays the message for losing fishing bait.
 *
 * @mangled EdFishingLostEsaMes__Fv
 * @address 0x173A30
 * @size 0x3C
 */
void EdFishingLostEsaMes();

/**
 * Displays the message describing an awarded item.
 *
 * @mangled EdItemGetMes__Fiiii
 * @address 0x173A70
 * @size 0x2C
 */
void EdItemGetMes(int item, int kind, int count, int attachment);

/**
 * Initializes the editor's animated item box frames.
 *
 * @mangled EdInitOpenItemBox__FP9CFrameVu1P9CFrameVu1
 * @address 0x173AA0
 * @size 0x1C
 */
void EdInitOpenItemBox(CFrameVu1 *frame, CFrameVu1 *base);

/**
 * Positions the editor's animated item box.
 *
 * @mangled EdSetOpenItemBox__FPfPf
 * @address 0x173AC0
 * @size 0x70
 */
void EdSetOpenItemBox(float *position, float *rotation);

/**
 * Advances the editor's item-box opening animation.
 *
 * @mangled EdStepOpenItemBox__Fv
 * @address 0x173B30
 * @size 0x1C8
 */
void EdStepOpenItemBox();

/**
 * Draws the editor's animated item box.
 *
 * @mangled EdDrawOpenItemBox__Fv
 * @address 0x173D00
 * @size 0xF8
 */
void EdDrawOpenItemBox();

/**
 * Converts a clock hour into the game's twelve-unit time scale.
 *
 * @mangled ConvertTime__Ff
 * @address 0x1740F0
 * @size 0x54
 */
float ConvertTime(float hour);

/**
 * Converts the game's twelve-unit time scale back into a clock hour.
 *
 * @mangled InvertTime__Ff
 * @address 0x174150
 * @size 0x4C
 */
float InvertTime(float time);
