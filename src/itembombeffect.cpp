#include "itembombeffect.hpp"

/**
 * Reports whether one running item is still in use.
 *
 * @mangled checkItemUsed__Fi
 * @address 0x1D5580
 * @size 0x16C
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", checkItemUsed__Fi);
INCLUDE_ASM("asm/nonmatchings/itembombeffect", usedActiveItem__FP11CUserStatusi);
/**
 * Starts a bomb effect at a position and gives back the slot it took.
 *
 * @mangled SetBombEffect__FPfiif
 * @address 0x1D5940
 * @size 0x1F0
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", SetBombEffect__FPfiif);
/**
 * Draws the bomb's blast and its shock wave.
 *
 * @mangled Draw__15CItemBombEffectFP7CCamera
 * @address 0x1D5B30
 * @size 0x374
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", Draw__15CItemBombEffectFP7CCamera);
INCLUDE_RODATA("asm/nonmatchings/itembombeffect", @1169__2);
/**
 * Advances the bomb effect by a frame.
 *
 * @mangled Step__15CItemBombEffectFv
 * @address 0x1D5EB0
 * @size 0x1F0
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", Step__15CItemBombEffectFv);
/**
 * Places the bomb's five blast puffs around a position.
 *
 * @mangled SetBomb__15CItemBombEffectFPff
 * @address 0x1D60A0
 * @size 0xBC
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", SetBomb__15CItemBombEffectFPff);
/**
 * Reports whether the bomb effect is still running.
 *
 * @mangled CheckBomb__15CItemBombEffectFv
 * @address 0x1D6160
 * @size 0x48
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", CheckBomb__15CItemBombEffectFv);
/**
 * Clears the bomb effect.
 *
 * @mangled Initialize__15CItemBombEffectFv
 * @address 0x1D61B0
 * @size 0x30
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", Initialize__15CItemBombEffectFv);
/**
 * Draws the expanding shock-wave ring.
 *
 * @mangled Draw__10CShockWaveFP7CCamera
 * @address 0x1D61E0
 * @size 0x2F8
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", Draw__10CShockWaveFP7CCamera);
/**
 * Expands and fades the shock-wave ring by a frame.
 *
 * @mangled Step__10CShockWaveFv
 * @address 0x1D64E0
 * @size 0xD8
 */
INCLUDE_ASM("asm/nonmatchings/itembombeffect", Step__10CShockWaveFv);
