#include "objanime.hpp"

#include "frame.hpp"

/**
 * Controls whether all object animations are stopped.
 */
extern int all_stop;

/**
 * Clears one object-animation sequence.
 *
 * @mangled Initialize__13OBJ_ANIME_SEQFv
 * @address 0x165C90
 * @size 0x14
 */
INCLUDE_ASM("asm/nonmatchings/objanime", Initialize__13OBJ_ANIME_SEQFv);
/**
 * Constructs an object-animation sequence.
 *
 * @mangled __ct__13OBJ_ANIME_SEQFv
 * @address 0x165CB0
 * @size 0x30
 */
INCLUDE_ASM("asm/nonmatchings/objanime", __ct__13OBJ_ANIME_SEQFv);

void ObjAnimeAllStop(void) {
    all_stop = 1;
}

void ObjAnimeAllStart(void) {
    all_stop = 0;
}
/**
 * Attaches an object animation to one frame.
 *
 * @mangled InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ
 * @address 0x165D00
 * @size 0xC4
 */
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FP6CFrameP13OBJ_ANIME_SEQ);
/**
 * Attaches an object animation to a list of frames.
 *
 * @mangled InitObjAnime__FPP6CFrameP13OBJ_ANIME_SEQ
 * @address 0x165DD0
 * @size 0xFC
 */
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FPP6CFrameP13OBJ_ANIME_SEQ);
/**
 * Attaches an object animation to a counted list of frames.
 *
 * @mangled InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ
 * @address 0x165ED0
 * @size 0x138
 */
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FPP6CFrameiP13OBJ_ANIME_SEQ);
/**
 * Attaches an object animation to the frames one function point names.
 *
 * @mangled InitObjAnime__FPP6CFrameiP16EPARTS_FUNC_DATAP13OBJ_ANIME_SEQ
 * @address 0x166010
 * @size 0x160
 */
INCLUDE_ASM("asm/nonmatchings/objanime", InitObjAnime__FPP6CFrameiP16EPARTS_FUNC_DATAP13OBJ_ANIME_SEQ);
/**
 * Reports whether an animated value has passed its target in the direction it moves.
 *
 * @mangled end_check__Ffff
 * @address 0x166170
 * @size 0x68
 */
INCLUDE_ASM("asm/nonmatchings/objanime", end_check__Ffff);
/**
 * Advances one object animation by a frame.
 *
 * @mangled ObjAnimePlay__FP13OBJ_ANIME_SEQ
 * @address 0x1661E0
 * @size 0x78C
 */
INCLUDE_ASM("asm/nonmatchings/objanime", ObjAnimePlay__FP13OBJ_ANIME_SEQ);

void InitEditEffect(CFrame *frame, EDIT_EFFECT_INFO *effect) {
    if (frame == NULL) {
        effect->frame = NULL;
        return;
    }

    effect->frame = frame->SearchFrame(effect->frame_name);
    if (effect->frame == NULL) {
        effect->frame = frame;
    }
}

/**
 * Attaches an editor effect to the frame a function point names.
 *
 * @mangled InitEditEffect__FP6CFrameP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFO
 * @address 0x1669D0
 * @size 0x1E0
 */
INCLUDE_ASM("asm/nonmatchings/objanime", InitEditEffect__FP6CFrameP16EPARTS_FUNC_DATAP16EDIT_EFFECT_INFO);
INCLUDE_ASM("asm/nonmatchings/objanime", CheckEditEffect__FP16EDIT_EFFECT_INFOf);
/**
 * Advances the editor's shared fire, candle and flame effects.
 *
 * @mangled EditEffectStep__Fv
 * @address 0x166D10
 * @size 0xC4
 */
INCLUDE_ASM("asm/nonmatchings/objanime", EditEffectStep__Fv);
INCLUDE_RODATA("asm/nonmatchings/objanime", @606);
INCLUDE_RODATA("asm/nonmatchings/objanime", @607);
INCLUDE_RODATA("asm/nonmatchings/objanime", @608);
/**
 * Rebuilds the editor's fire texture for the frame.
 *
 * @mangled EditEffectStep2__Fv
 * @address 0x166DE0
 * @size 0x28
 */
INCLUDE_ASM("asm/nonmatchings/objanime", EditEffectStep2__Fv);
/**
 * Draws one editor effect, choosing the kind from its record.
 *
 * @mangled DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup
 * @address 0x166E10
 * @size 0x24C
 */
INCLUDE_ASM("asm/nonmatchings/objanime", DrawEditEffect__FP16EDIT_EFFECT_INFOP7CCameraP12CEffectGroup);
