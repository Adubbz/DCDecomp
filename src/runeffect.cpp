#include "runeffect.hpp"

/**
 * Draws two textures blended over one another.
 *
 * @mangled blendTextuer__FP13sceVif1PacketiiiP8CTextureRC8CRect_i_RC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_
 * @address 0x162580
 * @size 0x73C
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", blendTextuer__FP13sceVif1PacketiiiP8CTextureRC8CRect_i_RC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_);
/**
 * Fills the blend table with one period of a sine.
 *
 * @mangled initBlendCnt__Fif
 * @address 0x162CC0
 * @size 0xB4
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", initBlendCnt__Fif);
/**
 * Draws a blended texture clipped to a rectangle, at a given strength.
 *
 * @mangled blendTextuerTest__FP13sceVif1PacketiiiRC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_ff
 * @address 0x162D80
 * @size 0x6E4
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", blendTextuerTest__FP13sceVif1PacketiiiRC8CRect_i_P8CTextureRC8CRect_i_RC8CRect_i_ff);
/**
 * Sets whether the running effect takes light.
 *
 * @mangled Lighting__10CRunEffectFi
 * @address 0x163470
 * @size 0xC
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", Lighting__10CRunEffectFi);
/**
 * Draws the dust the player's run leaves behind.
 *
 * @mangled Draw__10CRunEffectFv
 * @address 0x163480
 * @size 0x46C
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", Draw__10CRunEffectFv);
INCLUDE_RODATA("asm/nonmatchings/runeffect", @395__2);
INCLUDE_RODATA("asm/nonmatchings/runeffect", @396);
/**
 * Starts one puff of run dust at a position.
 *
 * @mangled Set__10CRunEffectFPf
 * @address 0x1638F0
 * @size 0x8C
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", Set__10CRunEffectFPf);
/**
 * Advances the run dust by a frame.
 *
 * @mangled Step__10CRunEffectFv
 * @address 0x163980
 * @size 0x70
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", Step__10CRunEffectFv);
/**
 * Constructs the run effect with no dust standing.
 *
 * @mangled __ct__10CRunEffectFv
 * @address 0x1639F0
 * @size 0x3C
 */
INCLUDE_ASM("asm/nonmatchings/runeffect", __ct__10CRunEffectFv);
